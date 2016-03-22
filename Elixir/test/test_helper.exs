
defmodule RegdomTest.Fixtures do

  def fixtures do
    Application.start(:fast_yaml)
    {:ok,[yaml]} = "#{File.cwd!}/../fixtures/test_domains.yml" |> :fast_yaml.decode_from_file
    yaml_to_map(yaml)
  end
  def yaml_to_map(_,map \\ %{})
  def yaml_to_map([{k,v}| t],map) when is_list(v) do
    map = Map.put(map,k,yaml_to_map(v,%{}))
    yaml_to_map(t,map)
  end
  def yaml_to_map(map_list= [[{_k,_v}|_t1]| _t2],map) do
    Enum.map map_list,&yaml_to_map(&1,map)
  end
  def yaml_to_map(map_list= [{_k,_v}| _t],_map) do
    Enum.into(map_list,%{})
  end
  def yaml_to_map([],map), do: map

end

ExUnit.start()
