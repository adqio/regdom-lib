local regdom = require 'src.regdom'
local spec_helper = require 'spec.spec_helper'
local fixtures = read_yaml("test_domains.yaml")
describe("regdom", function()
  describe(".get_registered_domain",function ( )
    for i,v in ipairs(fixtures.test_cases) do
      it("should get domain "..v.url,function ( ... )
        assert.are.equals(regdom.get_registered_domain(v.url),v.domain)
      end)
    end
   end)
  describe(".get_registered_domain strict",function ( )
    for i,v in ipairs(fixtures.strict_cases) do
      it("should get domain "..v.url,function ( ... )
        assert.are.equals(regdom.get_registered_domain(v.url,true),v.domain)
      end)
    end
   end)
end)