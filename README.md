# OpenMW FreeFPS + Rubic0n native Arch package

This repository packages the audited OpenMW 0.51-based FreeFPS fork together
with Rubic0n's `development` branch. It is intentionally a local, CPU-specific
package rather than a portable binary package.

## Included decisions

- FreeFPS is pinned to commit `5e3096851d5a60477a33c72122030551ff9a51cf`.
  It is not rebased onto OpenMW development.
- Rubic0n follows `development`, is built as a static library, and is linked
  only into this OpenMW build. It neither provides nor conflicts with Arch's
  `luajit` package.
- Rubic0n's `resources/lua_libs/content.lua` replaces the corresponding OpenMW
  0.51 build resource so Lua 5.2-compatible iteration has the correct indices.
- OpenMW commits `ec26c521` and `d7c2f416` are backported together to perform
  Lua garbage collection on the existing Lua worker thread without racing
  input-driven Lua calls.
- OpenMW and Rubic0n use `-march=native` and OpenMW uses its Release/LTO build.
  The baseline Masked Occlusion Culling source gets a required `-mno-avx`
  exception; its AVX2 and AVX-512 dispatch units retain their own flags.
- The unfinished persistent occluder cache is not initialized. Occlusion
  culling itself is still available, but only its existing in-memory cache is
  active.

## Build

Run this on the same machine that will run OpenMW:

```sh
makepkg -si
```

The package uses only official Arch repository dependencies. It conflicts with
other OpenMW engine packages but can coexist with the system `luajit` package.

To force synchronous Lua garbage collection for troubleshooting, put this in
`settings.cfg`:

```ini
[Lua]
lua num threads = 0
```

Do not set `gc steps per frame = 0` as a rollback: that disables scheduled Lua
garbage collection instead of merely disabling the background worker.

## Validation

The package was built from scratch in an up-to-date Arch `base-devel` container
with GCC 16.2.1 and CMake 4.4.2. The full 1,198-target Ninja build and LTO link
completed, `namcap` reported no errors, and an Xvfb smoke test returned OpenMW
0.51 revision `5e3096851d` cleanly.

The final `openmw` ELF has exported Lua API symbols but no dynamic dependency on
`libluajit`; installing Arch's `luajit` beside the package was also tested. The
installed `resources/lua_libs/content.lua` is byte-identical to the tracked
Rubic0n source resource.
