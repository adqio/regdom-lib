package = "regdom"
version = "0.1-1"
source = {
  url = "https://github.com/sunblock/regdom-lib"
}
description = {
  summary = "Implementation of http://mxr.mozilla.org/mozilla-central/source/netwerk/dns/effective_tld_names.dat?raw=1",
  detailed = [[
    Returns the domain name from a host name.
  ]],
  homepage = "https://github.com/sunblock/regdom-lib",
  license = "MIT <http://www.mozilla.org/MPL/2.0/>"
}
dependencies = {
  "lua >= 5.1",
  "penlight",
  "yaml"
}
build = {
  type = "builtin",
  modules = {
    ["regdom"] = "src/regdom.lua",
    ["regdom.effective_tlds"]  = "src/regdom/effective_tlds.lua"
  }
}