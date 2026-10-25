# physx5-zluda — NVIDIA PhysX SDK 5 GPU simulation on AMD GPUs through ZLUDA

This is an Arch Linux `PKGBUILD` (plus a tiny LD_PRELOAD shim and a self-test) that builds the
open-source [NVIDIA PhysX SDK 5](https://github.com/NVIDIA-Omniverse/PhysX) **with its CUDA GPU
kernels** and runs them on an AMD GPU via [ZLUDA](https://github.com/vosen/ZLUDA).

Verified on: AMD Radeon RX 9070 XT (RDNA4, gfx1201), ROCm 10, `zluda-preview-bin 7.preview.13`,
PhysX 5.11.0 (commit `6dc53585`), kernel 7.3, Arch/CachyOS, 2026-10-14.

Tested with: `zluda-preview-bin` **7.preview.13 only**. The AUR now carries 7.preview.18, which has
not been re-verified; the package does not pin a ZLUDA version. After a ZLUDA update, run
`physx5-zluda-run gputest` once and check the `RESULT:` line.

**New here? Read the [User Guide](https://github.com/eugenesflanagin-spec/physx5-zluda/blob/master/docs/USER-GUIDE.md)** — plain-words explanation, install,
every option, troubleshooting and a glossary. Build details, the patch, the ZLUDA gaps and how they
were found: [docs/DEVELOPER-NOTES.md](https://github.com/eugenesflanagin-spec/physx5-zluda/blob/master/docs/DEVELOPER-NOTES.md).

```
$ physx5-zluda-run gputest
PhysX 5.11.0 GPU functional test (GPU pipeline requested)
CUDA device      : AMD Radeon RX 9070 XT [ZLUDA]
broadphase type  : eGPU
stats            : activeDynamic=217 pairs=27 gpuMemHeap=65536 KiB (BP 9043, NP 357, solver 23997, sim 136)
RESULT: GPU PhysX ENGAGED  (bp=GPU, gpuHeap=yes, cudaErr=0, physxErrors=0, warnings=0, kernelsUnavailable=12)
```

## Install

You need an AMD GPU that ZLUDA/ROCm supports, and a ZLUDA package. Install ZLUDA **first** so the AUR
helper does not pick a provider for you:

```sh
yay -S zluda-preview-bin             # ZLUDA (provides libcuda.so.1)
```

Then one of:

```sh
# a) from the AUR (builds from source: ~100 MB of downloads, a few GB of disk, plenty of RAM)
yay -S physx5-zluda

# b) the ready-built package from the GitHub release page
#    https://github.com/eugenesflanagin-spec/physx5-zluda/releases
sha256sum -c SHA256SUMS --ignore-missing
sudo pacman -U physx5-zluda-5.11.0-3-x86_64.pkg.tar.zst

# c) by hand
git clone https://aur.archlinux.org/physx5-zluda.git && cd physx5-zluda && makepkg -si
```

Then check it:

```sh
physx5-zluda-run gputest             # exit 0 and "RESULT: GPU PhysX ENGAGED" = working
```

The first GPU start is slow (ZLUDA compiles the PTX kernels once and caches them in `~/.cache/zluda`).

> Do **not** install NVIDIA's `nvidia-utils` or `cuda` packages on the same machine: they provide their
> own `libcuda.so.1` and remove ZLUDA. This package needs neither.

Uninstall: `sudo pacman -R physx5-zluda` (optionally `rm -rf ~/.cache/zluda`).

## How it works

* **No NVIDIA driver / `cuda` package is installed.** `nvcc` and the CUDA headers come from NVIDIA's
  redistributable tarballs (`cuda_nvcc`, `cuda_cudart`, `cuda_crt`, `cccl`, `libnvvm` 13.4) extracted
  into the build directory only. `libcuda.so.1` on the system is ZLUDA's.
* **PTX only.** ZLUDA executes PTX, never SASS cubins, so the GPU library is compiled with
  `--generate-code=arch=compute_75,code=compute_75` only (`CMAKE_CUDA_ARCHITECTURES=75-virtual`).
  `libPhysXGpu_64.so` contains 61 PTX modules and zero cubins; ZLUDA JIT-compiles them with comgr on
  first use (cached in `~/.cache/zluda`). No `ZLUDA_CC` override is needed.
* **Host compiler** is `g++-14` (`gcc14` package): nvcc 13.4 rejects GCC 16, and the CUDA 12.9 headers
  do not compile against glibc 2.42 at all (`cospi`/`sinpi`/`rsqrt` `noexcept` clash), which is why
  CUDA 13.4 is used even though PhysX officially targets 12.8 (one-line `cuCtxCreate` patch).
* **`libzluda-physx-shim.so`** (preloaded by the wrapper) covers three ZLUDA 7.preview.13 gaps:
  1. `cuMemcpy3DAsync` returns `CUDA_ERROR_NOT_SUPPORTED` → falls back to the synchronous `cuMemcpy3D`
     (PhysX uses it for SDF collision textures).
  2. `cuMemcpyPeerAsync` returns 801 → `cuMemcpyDtoDAsync` for same-context copies.
  3. ZLUDA silently drops any kernel containing a `red.<space>.add.f32` reduction (nvcc emits `red`
     when the result of a float `atomicAdd` is unused). The shim rewrites the PTX text inside the
     fatbin to the equivalent `atom...f32 %zlred, ...` form before ZLUDA sees it (the fatbins are built
     uncompressed with `--compress-mode=none` so this is a plain text edit). Recovers 8 kernels.

## Known limitation

12 of PhysX's 488 GPU kernels use **indirect calls through function pointers** (`.callprototype`),
which ZLUDA cannot compile: the five `convexCore*Nphase_Kernel*` (collision for the new
`PxConvexCoreGeometry` cylinders/cones) and the seven `ps_*` particle-system collision kernels.
Rigid bodies, joints, articulations, deformable volumes/surfaces, SDF meshes and the direct-GPU API
do not depend on them; particle-system (PBF) and ConvexCore scenes will report errors. PhysX logs these
once at start-up as `Could not find CUDA module containing function '...'`.

## Usage

```
physx5-zluda-run --list                 # installed snippets
physx5-zluda-run gputest                # headless functional check (exit 0 = GPU engaged)
physx5-zluda-run SnippetHelloGRB        # 8,400-body GPU rigid-body demo (GLUT window)
physx5-zluda-run --debug SnippetSDF     # log every shim fallback / PTX rewrite
physx5-zluda-run --cpu-only HelloGRB    # same snippet on the CPU pipeline, for comparison
physx5-zluda-run --cpu-only gputest     # CPU reference run of the self-test scene (adds the test's --cpu)
```

Everything lives in `/opt/physx5` (`lib/`, `include/`, `bin/`, `lib/cmake/PhysX` for CMake consumers;
link your own programs against `/opt/physx5/lib` and run them with the same `LD_LIBRARY_PATH`/`LD_PRELOAD`
the wrapper sets).

## Troubleshooting

| symptom | what to do |
|---|---|
| `RESULT: no usable CUDA context manager` | ZLUDA is missing or cannot see the GPU. `pacman -Qo /usr/lib/libcuda.so.1` should name your ZLUDA package; your user may need the `render` and `video` groups. |
| The test picks the integrated GPU | `PHYSX_GPU_DEVICE=1 physx5-zluda-run gputest` (or the right device number). |
| Exactly 12 `Could not find CUDA module containing function` lines | Expected — see *Known limitation*. Many more than 12 means the shim was not loaded: run through `physx5-zluda-run`. |
| `error while loading shared libraries: libPhysX_64.so` | The program was started outside the wrapper; use `physx5-zluda-run ./program` or set `LD_LIBRARY_PATH=/opt/physx5/lib`. |
| `GPU PhysX NOT engaged`, `cudaErr` not 0 | Run with `--debug`, delete `~/.cache/zluda` once and retry. After a ZLUDA update, re-run the test. |
| Build fails with `unsupported GNU version` | `gcc14` missing; install it and rebuild with `makepkg -Cf`. |
| Build killed / PC freezes while building | `cudafe++`/`ptxas` ran out of memory: close programs or add swap. |
| ZLUDA vanished after an update | Something pulled in `nvidia-utils`/`cuda`; remove it and reinstall ZLUDA. |

More cases in the [User Guide](https://github.com/eugenesflanagin-spec/physx5-zluda/blob/master/docs/USER-GUIDE.md#8-troubleshooting).

## Files

| file | purpose |
|---|---|
| `PKGBUILD` | downloads PhysX + the CUDA redist tarballs, builds, installs to `/opt/physx5` |
| `physx5-zluda.patch` | PTX-only arch list, uncompressed fatbins, CUDA 13 `cuCtxCreate`, drop one broken snippet |
| `zluda-physx-shim.c` | the LD_PRELOAD shim described above |
| `physx5-gputest.cpp` | functional self-test |
| `physx5-zluda-run` | wrapper setting `LD_LIBRARY_PATH`, `LD_PRELOAD`, `PHYSX_GPU_DEVICE` |
| `*.desktop` | menu entries (demo + test) |
| `docs/USER-GUIDE.md` | user guide: install, usage, every option, troubleshooting, glossary |
| `docs/DEVELOPER-NOTES.md` | how the build and the ZLUDA workarounds were worked out |
| `CREDITS.md`, `LICENSE` | sources this builds on, and the licence of this project's own files |
| `packaging/` | clean-container build (`build.sh`) and install test (`test-in-container.sh`) used for releases |
| `.github/workflows/release.yml` | on a `v<pkgver>-<pkgrel>` tag: build, install-test, publish the GitHub release |
| `docs/release-notes/` | notes for each release |

## Credits and licence

- **[NVIDIA PhysX SDK 5](https://github.com/NVIDIA-Omniverse/PhysX)** © NVIDIA Corporation, Apache-2.0.
  Built from source; `physx5-zluda.patch` modifies four things (PTX-only arch list, uncompressed fatbins,
  CUDA 13 `cuCtxCreate`, one snippet dropped). The patched files stay Apache-2.0.
- **CUDA Toolkit 13.4 redistributables** © NVIDIA Corporation, NVIDIA CUDA EULA. Downloaded at build time and
  used only to compile; only the redistributable `libcudart.so.13` is packaged. Nothing from the toolkit is
  in this repository.
- **[ZLUDA](https://github.com/vosen/ZLUDA)** by Andrzej Janik (vosen) and contributors — runtime dependency,
  not included. **ROCm** © AMD.
- This project's own files (PKGBUILD, shim, self-test, wrapper, menu entries, docs): MIT, © Eugene Flanagin
  ([LICENSE](https://github.com/eugenesflanagin-spec/physx5-zluda/blob/master/LICENSE)). Full list with licences: [CREDITS.md](https://github.com/eugenesflanagin-spec/physx5-zluda/blob/master/CREDITS.md).

NVIDIA, PhysX and CUDA are trademarks of NVIDIA Corporation; AMD, Radeon and ROCm of Advanced Micro Devices,
Inc. Not affiliated with NVIDIA, AMD or the ZLUDA project.
