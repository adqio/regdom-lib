defmodule RegdomTest do
  use ExUnit.Case
  doctest Regdom
  test "domains" do
    Enum.each RegdomTest.Fixtures.fixtures["test_cases"], fn (fixture)->
      assert Regdom.get_registered_domain(fixture["url"],false) == fixture["domain"]
    end
  end
  test "strict domains" do
    Enum.each RegdomTest.Fixtures.fixtures["strict_cases"], fn (fixture)->
      assert Regdom.get_registered_domain(fixture["url"],true) == fixture["domain"]
    end
  end

end
