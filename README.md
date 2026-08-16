# OpenMW FreeFPS + Rubic0n native Arch package

This repository packages the OpenMW 0.51-based
[FreeFPS fork](https://www.nexusmods.com/morrowind/mods/59700) together with
[Rubic0n](https://www.nexusmods.com/morrowind/mods/58557)'s `development`
branch. It is intentionally a local, CPU-specific package rather than a
portable binary package.

## Included decisions

- FreeFPS follows its own `master` branch. It is not rebased onto OpenMW
  development. The `pkgver()` revision is calculated from the FreeFPS fork
  point rather than frozen in the PKGBUILD.
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
  exception; its AVX2 and AVX-512 dispatch units retain their own flags. MOC
  alone is compiled with `-fno-strict-aliasing` to prevent GCC 16 from
  optimizing its non-conforming union-based SIMD lane accessors under
  strict-aliasing assumptions.
- The engine links against the same OpenMW-oriented dependency set used by
  `openmw-stable-git`: `openscenegraph-openmw-git`, `mygui-openmw`, and
  `recastnavigation-openmw`.
- The unfinished persistent occluder cache is not initialized. Occlusion
  culling itself is still available, but only its existing in-memory cache is
  active.

## Build and install

Install the three AUR dependencies first (an AUR helper can resolve and build
them), then run this on the same machine that will run OpenMW:

```sh
paru -S openscenegraph-openmw-git mygui-openmw recastnavigation-openmw
```

Substitute another AUR helper or build those packages manually if `paru` is
not used. Then build this package:

```sh
makepkg -si
```

The OpenMW-specific dependency packages conflict with their repository
counterparts. This package conflicts with other OpenMW engine packages but can
coexist with the system `luajit` package.

Because the package is compiled with `-march=native`, do not distribute the
resulting package file to a machine with a different CPU. Rebuild it on each
target machine. FreeFPS `master` and Rubic0n `development` are moving branches;
run a clean `makepkg -si` again to update them.

Start `openmw-launcher` after installation and configure Morrowind normally if
this is a new OpenMW installation. Existing OpenMW configuration, mod lists,
and saves continue to work, and no new game is required.

Do not download either Nexus archive in addition to this package. FreeFPS is
the engine being installed, while Rubic0n is statically linked into that engine.
There is no Rubic0n data directory or content file to activate, no replacement
`libluajit.so`, and no `LD_PRELOAD` command to use. The Rubic0n-compatible
`resources/lua_libs/content.lua` is also already installed by the package.

## Required FreeFPS configuration

Occlusion culling is compiled in but deliberately defaults to off. Completely
close OpenMW, then edit the user configuration file:

```text
${XDG_CONFIG_HOME:-$HOME/.config}/openmw/settings.cfg
```

This is OpenMW's default Linux path; custom profiles can place the active file
elsewhere as described in the
[OpenMW path documentation](https://openmw.readthedocs.io/en/latest/reference/modding/paths.html).

Add the setting to the existing `[Camera]` section, or create that section if
it is absent:

```ini
[Camera]
occlusion culling = true
```

Do not edit `/usr/share/games/openmw/defaults.bin`. Also avoid creating a
second copy of a section or setting in `settings.cfg`; merge the line into the
existing section instead. Restart OpenMW after changing the file.

The following related defaults are already enabled and normally should remain
enabled:

```ini
[Camera]
occlusion culling terrain = true
occlusion culling statics = true
```

Occlusion culling is most useful in dense exterior cells and at long viewing
distances. A longer viewing distance gives the culler more hidden objects to
reject, but can still reduce absolute performance, so compare builds at the
same viewing distance rather than raising it solely to obtain a larger gain.

## Recommended shadow configuration

FreeFPS can reuse shadow maps across frames. If shadows are enabled, the
recommended starting point is:

```ini
[Shadows]
shadow map resolution = 1024
soft shadows = true
shadow update interval = 2
```

These lines do not enable shadows or choose which objects cast them; those
remain normal launcher or in-game graphics choices. `soft shadows = true`
adds a small GPU cost but makes the lower 1024 resolution look better.
`shadow update interval = 2` updates the maps every other frame and usually
reduces CPU work. It is also exposed in-game as **Shadow Temporal Reuse** and
requires a restart.

Use `shadow update interval = 1` to disable temporal reuse if it causes visible
jitter or transient shadow artifacts. Values 3 and 4 save more work but delay
shadow movement further; interval 4 is not recommended while actor or player
shadows are enabled. Temporal reuse automatically falls back to per-frame
updates at very low frame rates.

If alternating update/reuse frames make frame pacing conspicuous, set a stable
frame limit in the launcher. Do not disable VSync blindly: retain VSync or VRR
when needed to prevent tearing, and choose a cap that the machine can sustain.

## Occlusion tuning and diagnostics

Start with the defaults. The important tuning controls in this fork are:

| Setting | Default | Guidance |
| --- | ---: | --- |
| `occlusion culling interiors` | `false` | Exterior culling is the intended default. Interior culling is experimental; enable it only after checking for disappearing geometry and a real performance gain. |
| `occlusion occluder min radius` | `400` | Lower values admit more and smaller buildings as occluders, increasing both culling opportunities and CPU work. Higher values are safer if small geometry becomes a bad occluder. |
| `occlusion occluder shrink factor` | `1` | Lower values shrink simplified occluders and reduce false culling. Try `0.95`, then no lower than `0.9`, if geometry disappears in alleys or near buildings. |
| `occlusion buffer width` / `height` | `512` / `256` | Higher values are more precise but take more CPU time to rasterize. |
| `occlusion terrain lod` | `3` | Higher values use coarser, cheaper terrain occluders; lower values use more detail. |
| `occlusion terrain radius` | `2` | Number of cells around the camera whose terrain is used as an occluder. |
| `occlusion occluder max distance` | `6144` | Buildings beyond this distance are tested but are not themselves rasterized as occluders. |
| `occlusion max triangles` | `30000` | Per-frame building-occluder triangle budget; `0` means unlimited. Terrain is outside this budget. |

The original FreeFPS page spells the radius key as `occluder min radius` in
one workaround. That name is not recognized by this source tree; use the full
`occlusion occluder min radius` name shown above.

To diagnose disappearing objects, temporarily make occlusion more conservative:

```ini
[Camera]
occlusion occluder shrink factor = 0.95
```

If that is insufficient, raise `occlusion occluder min radius` gradually above
400. Test in the location that showed the problem. A shrink factor below 0.9
can make openings such as archways poor occluders, while values above 1 expand
the simplified mesh beyond the original geometry and are unsuitable as a
normal setting.

To confirm that the culler is active, temporarily enable either diagnostic:

```ini
[Camera]
occlusion debug overlay = true
occlusion debug messages = true
```

The overlay displays the software depth buffer in the bottom-left corner. The
message option writes an `OcclusionCull:` summary every 300 frames to
`${XDG_CONFIG_HOME:-$HOME/.config}/openmw/openmw.log`. Disable both after
testing because they add visual clutter, log noise, and some overhead. There is
no F10 page for these statistics.

The persistent SQLite occluder cache present in the unfinished source is not
initialized by this build. No cache file needs to be created, populated, or
deleted; simplified occluders are cached only in memory for the current run.

## Rubic0n and Lua garbage collection

Rubic0n needs no runtime configuration. To verify the linked implementation,
load a game, open OpenMW's console, and enter these commands one line at a time:

```text
luam
_VERSION
exit()
```

The result should be `Lua 5.1-DW`. This build uses Rubic0n's normal sandboxed
mode: the optional `sandbox.bypass` escape hatch is not compiled in.

Background Lua garbage collection is active with the packaged defaults:

```ini
[Lua]
lua num threads = 1
gc steps per frame = 100
```

Normally, leave both values unchanged. To troubleshoot a Lua crash or compare
frame-time behavior, force Lua work and garbage collection back onto the main
thread:

```ini
[Lua]
lua num threads = 0
gc steps per frame = 100
```

Do not set `gc steps per frame = 0` as a rollback: that disables scheduled Lua
garbage collection instead of merely disabling the background worker.

## Troubleshooting and rollback

- Package release 2 fixes strict-aliasing undefined behavior exposed by GCC 16
  that could crash in `RasterizeTriangleBatch` when entering a dense exterior
  with occlusion culling enabled. Rebuild and reinstall the package before
  disabling culling as a workaround. Release 1 users can temporarily set
  `occlusion culling = false` if they cannot rebuild immediately.
- If objects disappear incorrectly, first use the conservative occluder tuning
  above. Set `occlusion culling = false` to establish whether FreeFPS culling
  is responsible.
- If performance gets worse, compare the same save, camera position, viewing
  distance, shadow settings, and frame cap. This is CPU-side culling, so a
  scene that has little hidden geometry can cost more to process than it saves.
- If only shadows flicker or lag, keep occlusion enabled and set
  `shadow update interval = 1`; the two optimizations are independent.
- If a Lua mod behaves differently, confirm `Lua 5.1-DW`, check `openmw.log`,
  and test `lua num threads = 0`. Do not install another LuaJIT over this
  package or preload one into it.
- To return to stock rendering without changing packages, set
  `occlusion culling = false`, `soft shadows = false`, and
  `shadow update interval = 1`.

## Validation

The package and all three OpenMW-oriented AUR dependencies were built from
scratch in an up-to-date Arch `base-devel` container with GCC 16.2.1 and CMake
4.4.2. The full 1,198-target Ninja build and LTO link completed, `namcap`
reported no errors, and an Xvfb smoke test returned OpenMW 0.51 revision
`5e3096851d` cleanly.

The occlusion fix was also tested against the read-only NEMAS Overhaul profile
by starting directly in Seyda Neen with reverse-Z, terrain occlusion, static
occlusion, and shadows enabled. The original build crashed deterministically
in MOC's AVX2 rasterizer; the fixed Release/LTO build ran for the full
90-second test window and shut down cleanly.

The final `openmw` ELF has exported Lua API symbols but no dynamic dependency on
`libluajit`; installing Arch's `luajit` beside the package was also tested. The
installed `resources/lua_libs/content.lua` is byte-identical to the tracked
Rubic0n source resource.
