package = "sci-lang"
version = "1.0.0.beta10-1"

source = {
   url = "https://github.com/stepelu/lua-sci-lang/archive/v1.0.0-beta10.tar.gz",
   dir = "lua-sci-lang-1.0.0-beta10"
}
description = {
   summary = "Syntax extensions to LuaJIT for scientific computing",
   detailed = "Based on the LuaJIT Language Toolkit this executable introduces extensions to the LuaJIT syntax for algebra operations.",
   homepage = "http://scilua.org/",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, < 5.4",
   "luajit >= 2.0",
   "sci >= 1.0"
}
build = {
   type = "builtin",
   modules = {
      ["sci-lang.__bin.scilua"] = "__bin/scilua.lua",
      ["sci-lang.ast-boolean-const-eval"] = "ast-boolean-const-eval.lua",
      ["sci-lang.ast-const-eval"] = "ast-const-eval.lua",
      ["sci-lang.ast-validate"] = "ast-validate.lua",
      ["sci-lang.bcread"] = "bcread.lua",
      ["sci-lang.bcsave"] = "bcsave.lua",
      ["sci-lang.bytecode"] = "bytecode.lua",
      ["sci-lang.compile"] = "compile.lua",
      ["sci-lang.generator"] = "generator.lua",
      ["sci-lang.lexer"] = "lexer.lua",
      ["sci-lang.lua-ast"] = "lua-ast.lua",
      ["sci-lang.luacode-generator"] = "luacode-generator.lua",
      ["sci-lang.operator"] = "operator.lua",
      ["sci-lang.parser"] = "parser.lua",
      ["sci-lang.reader"] = "reader.lua",
      ["sci-lang.transform"] = "transform.lua",
      ["sci-lang.util"] = "util.lua"
   }
}
