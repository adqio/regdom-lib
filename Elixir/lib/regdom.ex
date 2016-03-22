defmodule Regdom do
  require Logger
  def get_registered_domain(host,strict \\ false )
  def get_registered_domain(host,strict) when strict and byte_size(host) >= 253, do: nil
  def get_registered_domain(host,strict) do
    domain_parts = String.split(host,".") |> Enum.reverse
    too_large =strict && Enum.any?(domain_parts,fn (part)-> byte_size(part) > 63 end)
    tlds = strict && strict_tlds || Regdom.EffectiveTLD.tld
    ## deal with too long strct
    unless too_large  do
      result = find_registered_domain(domain_parts,tlds)
      unless result && length(String.split(result,".")) == 1 do
        result
      end
    end
  end
  defp find_registered_domain(_,_,aggregate_domain \\ nil)
  defp find_registered_domain(_,%{"!"=>_},aggregate_domain), do: aggregate_domain
  defp find_registered_domain(_,nil,aggregate_domain), do: aggregate_domain
  defp find_registered_domain([],_,_), do: nil
  defp find_registered_domain([last|t],nodes,aggregate_domain) do
    next_node = nodes[last] || nodes["*"]
    aggregate_domain = if aggregate_domain do
      last <> "." <> aggregate_domain
    else
      last
    end
    find_registered_domain(t,next_node,aggregate_domain)
  end

  defp strict_tlds do
    Map.delete(Regdom.EffectiveTLD.tld,"*")
  end
end
