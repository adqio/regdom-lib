package = "regdom"
version = "0.1-1"
source = {
url = "https://github.com/adqio/regdom-lib"
}
description = {
summary = "Implementation of http://mxr.mozilla.org/mozilla-central/source/netwerk/dns/effective_tld_names.dat?raw=1",
detailed = [[
Returns the domain name from a host name.
]],
homepage = "https://github.com/adqio/regdom-lib",
license = "MIT <http://www.mozilla.org/MPL/2.0/>"
}
dependencies = {
"lua >= 5.1",
"lapis",
"penlight",
"yaml"
}
build = {
type = "builtin",
modules = {
["regdom"] = "/usr/src/adjs/stream/regdom/Lua/src/regdom.lua",
["regdom.effective_tlds"] = "/usr/src/adjs/stream/regdom/effective_tlds.lua"
}
}
