package = "xsys"
version = "1.0.2-1"

source = {
   url = "https://github.com/stepelu/lua-xsys/archive/v1.0.2.tar.gz",
   dir = "lua-xsys-1.0.2"
}
description = {
   summary = "LuaJIT General Purpose Routines",
   detailed = "This is a MIT licensed library that provides a small number of general purpose routines and extends the global `table` and `string` libraries.",
   homepage = "http://scilua.org/xsys.html",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, < 5.4",
   "luajit >= 2.0"
}
build = {
   type = "builtin",
   modules = {
      ["xsys._dep.templet.init"] = "_dep/templet/init.lua",
      ["xsys._xsys"] = "_xsys.lua",
      ["xsys.init"] = "init.lua"
   }
}
