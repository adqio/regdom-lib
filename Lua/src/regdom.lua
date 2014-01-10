-- The MIT License (MIT)

-- Copyright (c) 2013 Jason Fertel

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.


local effective_tlds = require '.regdom.effective_tlds'
local stringx = require 'pl.stringx'
local tablex = require 'pl.tablex'
local regdom = {}
local strict_tlds = tablex.deepcopy(effective_tlds)
strict_tlds["*"] = nil

local function find_registered_domain(parts,node,aggregate_domain,strict)
  if node["!"] then
    return aggregate_domain
  end
  if #parts == 0 then
    return nil 
  end
  local last_part = parts[#parts]
  local next_node = node[last_part] or node["*"]
  if aggregate_domain then
    aggregate_domain = last_part .. "." .. aggregate_domain
  else
    aggregate_domain = last_part
  end
  if next_node then
    return find_registered_domain(tablex.sub(parts,1,#parts-1),next_node,aggregate_domain)
  else 
    return aggregate_domain
  end
end

function regdom.get_registered_domain( host,strict )
  local strict = strict or false
  local domain_parts = stringx.split(host,".")
  local tlds = strict and strict_tlds or effective_tlds
  local result = find_registered_domain(domain_parts,tlds)
  if result and #(stringx.split(result,"."))==1 then
    return nil
  end
  return result
end

return regdom