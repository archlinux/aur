# physx5-zluda — NVIDIA PhysX SDK 5 GPU simulation on AMD GPUs through ZLUDA

This is an Arch Linux `PKGBUILD` (plus a tiny LD_PRELOAD shim and a self-test) that builds the
open-source [NVIDIA PhysX SDK 5](https://github.com/NVIDIA-Omniverse/PhysX) **with its CUDA GPU
kernels** and runs them on an AMD GPU via [ZLUDA](https://github.com/vosen/ZLUDA).

Verified on: AMD Radeon RX 9070 XT (RDNA4, gfx1201), ROCm 10, `zluda-preview-bin 7.preview.13`,
PhysX 5.11.0 (commit `6dc53585`), kernel 7.3, Arch/CachyOS, 2026-10-14.

Tested with: `zluda-preview-bin` **7.preview.13 only**. The AUR now carries 7.preview.18, which has
not been re-verified; the package does not pin a ZLUDA version. After a ZLUDA update, run
`physx5-zluda-run gputest` once and check the `RESULT:` line.

Build details, the patch, the ZLUDA gaps and how they were found: [docs/DEVELOPER-NOTES.md](https://github.com/eugenesflanagin-spec/physx5-zluda/blob/master/docs/DEVELOPER-NOTES.md).

```
$ physx5-zluda-run gputest
PhysX 5.11.0 GPU functional test (GPU pipeline requested)
CUDA device      : AMD Radeon RX 9070 XT [ZLUDA]
broadphase type  : eGPU
stats            : activeDynamic=217 pairs=27 gpuMemHeap=65536 KiB (BP 9043, NP 357, solver 23997, sim 136)
RESULT: GPU PhysX ENGAGED  (bp=GPU, gpuHeap=yes, cudaErr=0, physxErrors=0, warnings=0, kernelsUnavailable=12)
```

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

## Files

| file | purpose |
|---|---|
| `PKGBUILD` | downloads PhysX + the CUDA redist tarballs, builds, installs to `/opt/physx5` |
| `physx5-zluda.patch` | PTX-only arch list, uncompressed fatbins, CUDA 13 `cuCtxCreate`, drop one broken snippet |
| `zluda-physx-shim.c` | the LD_PRELOAD shim described above |
| `physx5-gputest.cpp` | functional self-test |
| `physx5-zluda-run` | wrapper setting `LD_LIBRARY_PATH`, `LD_PRELOAD`, `PHYSX_GPU_DEVICE` |
| `*.desktop` | menu entries (demo + test) |
| `docs/DEVELOPER-NOTES.md` | how the build and the ZLUDA workarounds were worked out |

Licenses: PhysX is Apache-2.0 (NVIDIA). The CUDA toolkit components are downloaded at build time under
the NVIDIA CUDA EULA; only `libcudart.so.13` (an EULA-redistributable runtime) ends up in the package.
Nothing from the toolkit is checked into this repository.
