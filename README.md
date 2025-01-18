# glslang

## Silent dependency on specific spirv-tools & spirv-headers version

 However, if we went that route, we'd have to vendor the resulting `spirv-tools` libs from this `glslang` build and they would be incompatible with system libs, resulting in us having to ship both. Instead, it is recommend to just wait until upstream releases a compatible version of `spirv-tools` and `spirv-header`, then updates those packages and only then building `glslang` against that.

## Silent ABI breakages

Careful when upgrading this package! It usually breaks ABI without bumping soname.  
It is recommended to rebuild reverse dependencies on upgrade out of precaution (e.g. <https://archlinux.org/todo/glslang-1510-rebuild/>).
