package = "sci"
version = "1.0.0.beta12-1"

source = {
   url = "https://github.com/stepelu/lua-sci/archive/v1.0.0-beta12.tar.gz",
   dir = "lua-sci-1.0.0-beta12"
}
description = {
   summary = "Scientific Computing with LuaJIT",
   detailed = "A complete framework for numerical computing based on LuaJIT which combines the ease of use of scripting languages (MATLAB, R, ...) with the high performance of compiled languages (C/C++, Fortran, ...).",
   homepage = "https://github.com/stepelu/lua-sci",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, < 5.4",
   "luajit >= 2.0",
   "xsys >= 1.0"
}
build = {
   type = "builtin",
   modules = {
      ["sci.__init"] = "__init.lua",
      ["sci._cblas_h"] = "_cblas_h.lua",
      ["sci.alg"] = "alg.lua",
      ["sci.complex"] = "complex.lua",
      ["sci.diff"] = "diff.lua",
      ["sci.dist"] = "dist.lua",
      ["sci.dist._beta"] = "dist/_beta.lua",
      ["sci.dist._exponential"] = "dist/_exponential.lua",
      ["sci.dist._gamma"] = "dist/_gamma.lua",
      ["sci.dist._lognormal"] = "dist/_lognormal.lua",
      ["sci.dist._normal"] = "dist/_normal.lua",
      ["sci.dist._student"] = "dist/_student.lua",
      ["sci.dist._uniform"] = "dist/_uniform.lua",
      ["sci.fmax"] = "fmax.lua",
      ["sci.fmin"] = "fmin.lua",
      ["sci.fmin._de"] = "fmin/_de.lua",
      ["sci.fmin._lbfgs"] = "fmin/_lbfgs.lua",
      ["sci.math"] = "math.lua",
      ["sci.mcmc"] = "mcmc.lua",
      ["sci.mcmc._nuts"] = "mcmc/_nuts.lua",
      ["sci.prng"] = "prng.lua",
      ["sci.prng._marsaglia"] = "prng/_marsaglia.lua",
      ["sci.prng._mrg"] = "prng/_mrg.lua",
      ["sci.qrng"] = "qrng.lua",
      ["sci.qrng._new-joe-kuo-6-21201"] = "qrng/_new-joe-kuo-6-21201.lua",
      ["sci.qrng._sobol"] = "qrng/_sobol.lua",
      ["sci.quad"] = "quad.lua",
      ["sci.quad._dblexp"] = "quad/_dblexp.lua",
      ["sci.quad._dblexp_precomputed"] = "quad/_dblexp_precomputed.lua",
      ["sci.root"] = "root.lua",
      ["sci.root._newtonm"] = "root/_newtonm.lua",
      ["sci.root._ridders"] = "root/_ridders.lua",
      ["sci.stat"] = "stat.lua"
   }
}
