# shaderc

## Silent dependency on specific spirv-tools & spirv-headers version

Be mindful of the version of `spirv-tools` that this links to. Upstream actually expects the use of the particular commits of `spirv-tools` and `spirv-headers` that are provided in the `DEPS` file.  
However, if we went that route, we'd have to vendor the resulting `spirv-tools` libs from this `shaderc` build and they would be incompatible with system libs, resulting in us having to ship both. Instead, I recommend just waiting until upstream releases a compatible version of `spirv-tools`, then updating the `spriv-tools` system package and only then building `shaderc` against that.
