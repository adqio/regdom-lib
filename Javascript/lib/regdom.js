var effectiveTlds = require('./effective_tlds');
var clone =  function(obj){

}


var findRegisteredDomain = function(parts,node,aggregateDomain)
  if(node["!"])
    return aggregate_domain;
  if(parts.length == 0)
    return null;

  var lastPart = parts.pop();
  var nextNode = node[last_part] || node["*"];
  if(aggregateDomain)
    aggregateDomain = lastPart + "." + aggregateDomain;
  else
    aggregateDomain = lastPart;
  
  if(nextNode)
    return findRegisteredDomain(parts,,aggregate_domain)
  else
    return aggregate_domain
  end
end

function regdom.get_registered_domain( host,strict )
  local strict = strict or false
  local domain_parts = stringx.split(host,".")
  local tlds = strict and strict_tlds or effective_tlds
  if strict and (#host >= 253 or tablex.find_if(domain_parts,
      function(part) return #part>63 end)) then
    return nil
  end

  local result = find_registered_domain(domain_parts,tlds)
  if result and #(stringx.split(result,"."))==1 then
    return nil
  end
  return result
end

return regdom