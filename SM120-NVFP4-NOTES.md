# SM120 NVFP4 inference on RTX 5090 / RTX PRO 6000 — full stack notes

A complete debug log of getting `RedHatAI/gemma-4-31B-it-NVFP4` running coherently
on consumer Blackwell (SM 12.0a) with sglang. Recorded 2026-05-09 after ~25 hours
of step-by-step debugging.

## Fresh-box checklist

```
1. paru -S sglang-git python-sgl-kernel-git python-flashinfer \
          python-nvidia-cudnn-frontend python-compressed-tensors-git \
          cuda gcc15 cutlass

2. sudo cp /usr/share/doc/sglang-git/gemma_4_31b_nvfp4.env.example \
           /etc/sglang/gemma_4_31b_nvfp4.env

3. sudo systemctl start sglang@gemma_4_31b_nvfp4
   # First start downloads ~30 GB of NVFP4 weights from HF.

4. Find the snapshot hash:
   ls /var/lib/sglang/hub/models--RedHatAI--gemma-4-31B-it-NVFP4/snapshots/

5. sudo sed -i 's|<snapshot-hash>|<actual-hash>|' \
        /etc/sglang/gemma_4_31b_nvfp4.env
   sudo systemctl restart sglang@gemma_4_31b_nvfp4

6. Smoke-test:
   curl -s http://127.0.0.1:30000/v1/chat/completions \
     -H 'content-type: application/json' \
     -d '{"model":"RedHatAI/gemma-4-31B-it-NVFP4","messages":[{"role":"user","content":"What is 2+2?"}],"temperature":0,"max_tokens":16}'
   # Expect "4" in the content. If garbled, see failure mode chronology below.
```

The **working configuration** for sglang-git ≥ r12451 with this AUR package's
patches applied:

```ini
# /etc/sglang/gemma_4_31b_nvfp4.env
LD_PRELOAD=/usr/lib/libcuda.so.1
LD_LIBRARY_PATH=/usr/lib/python3.14/site-packages/tvm_ffi/lib:/usr/lib
SGLANG_OPTS="--port 30000 --fp4-gemm-backend=cutlass --chat-template /var/lib/sglang/hub/models--RedHatAI--gemma-4-31B-it-NVFP4/snapshots/<snapshot-hash>/chat_template.jinja"
```

Result on RTX 5090: **~47 tok/s** for 300-token streaming generation. Coherent text.

## Stack components

| Component | Version | Notes |
|---|---|---|
| RTX 5090 / SM 12.0a | — | "Blackwell consumer" |
| CUDA toolkit | 13.2.78 | nvcc 13.2 |
| nvidia driver | 595.71.05 | provides `/usr/lib/libcuda.so.1` |
| GCC (system) | 16.x | too new for nvcc 13.2 — see below |
| `gcc15` (AUR sidecar) | 15.x | nvcc host compiler via `CUDAHOSTCXX=/usr/bin/g++-15` |
| python-pytorch | ≥ 2.11 with CUDA 13 wheels | |
| python-flashinfer | 0.6.9 | ships SM120 NVFP4 cuDNN + CUTLASS kernels in `data/include/flashinfer/...` |
| python-compressed-tensors-git | ≥ 0.15.0 | knows the `scale_dtype: torch.float8_e4m3fn` field RedHatAI's recipe sets |
| python-nvidia-cudnn-frontend | 1.22.1 | needed for flashinfer's cuDNN FP4 path even when not using it |
| cutlass | 4.3.5 (headers-only) | local `~/aur/cutlass/PKGBUILD` patched to install just `include/cutlass`, `include/cute`, `tools/util/include/cutlass/util/` to `/usr/include/` |
| sglang-git | this package | patches in `wjh-fp4-3d-reshape.patch` |

## Failure mode chronology

Each row is a distinct error mode that fired during debug. Order = encounter
order. Useful as a bisection ladder for future debugging.

| # | Error / symptom | Root cause | Resolution |
|---|---|---|---|
| 1 | `cudafe++` errors on `<type_traits>` headers (`char8_t undefined`, `requires` not a type, etc.) | CUDA 13.2's cudafe++ doesn't parse GCC 16's libstdc++ | Install `gcc15` AUR pkg; set `CUDAHOSTCXX=/usr/bin/g++-15` in PKGBUILD `build()` (already in `python-sgl-kernel-git/PKGBUILD`) |
| 2 | `Module 'sgl-kernel' is installed with version 0.4.1.post1, which is less than the minimum required version 0.4.2` | sglang master bumped the kernel pin | Rebuild `python-sgl-kernel-git` (pulls master) |
| 3 | `gpasswd -a will audio` style auth failures on `arecord` | Not in audio group | NA for sglang; just for mic later |
| 4 | sglang-git AUR rebuild via paru clobbers our local `_models` array additions | paru runs from its own clone of the AUR package, not our `~/aur/sglang-git/` clone | Push local changes to AUR before pulling, or pacman -U the locally-built pkg explicitly |
| 5 | `pydantic ValidationError: 2 errors for QuantizationArgs ... scale_dtype, zp_dtype` | python-compressed-tensors 0.12.x doesn't know about double-quant scale_dtype | Upgrade to `python-compressed-tensors-git` ≥ 0.15.0 (or wait for upstream stable bump) |
| 6 | `JIT compile fails: cutlass/arch/barrier.h: No such file or directory` | flashinfer 0.6.9 requires cutlass headers but doesn't bundle them | Install AUR `cutlass` (headers-only patch — see below) |
| 7 | `cuDNN is not available. Please install cuDNN to use FP8 GEMM functions` | python frontend missing | `paru -S python-nvidia-cudnn-frontend` |
| 8 | `cudnnGraphNotSupportedError: No execution plans support the graph` (cuDNN backend, CUDA graph capture) | cuDNN's NVFP4 graph-capture has dynamic-shape limitations on SM120 | Switch backend: `--fp4-gemm-backend=cutlass` (see below) |
| 9 | `mm_fp4 accepts 2d tensors, got torch.Size([1, 2520, 576]) and torch.Size([576, 3456])` | sglang's CUDA-graph-capture path passes 3D `[1, max_seq, K]` activations to flashinfer's mm_fp4, which has a 2D contract | Patch `apply()` / `apply_weights()` to flatten leading dims and reshape on return (`wjh-fp4-3d-reshape.patch`) |
| 10 | After (9) fixed: model loads, serves HTTP, but every chat returns `<pad><pad><pad>...` | sglang auto-matches the in-built broken `gemma-4-it` flat chat template (uses `<\|turn\|>assistant\n`) instead of the upstream jinja (uses `<\|turn\|>model\n`) | `--chat-template /var/lib/sglang/hub/.../chat_template.jinja` |
| 11 | After (10) fixed: chat returns multilingual gibberish at temp=0 | SM120 CUTLASS FP4 GEMM produces NaN when an E4M3 scale-factor byte equals 0x7f. Per sglang upstream PR #22927 | Same patch: clamp raw scale bytes to 0x7e in the cutlass branch of `fp4_gemm()`. Also need `--fp4-gemm-backend=cutlass` (sglang's own JIT, NOT `flashinfer_cutlass`) since PR 22927 targets sglang's kernel |
| 12 | `RuntimeError: Cannot find CUTLASS headers required for JIT compilation. Please install flashinfer or deep_gemm with CUTLASS headers.` | sglang's JIT discovery only checks `flashinfer/data/cutlass/include` and `deep_gemm/include`, ignores `/usr/include/cutlass/` | Same patch: extend `get_cutlass_include_paths()` to fall back on `/usr/include/cutlass/` |
| 13 | `Rank 0 scheduler died during initialization (exit code: 127)` followed by `symbol lookup error: ... undefined symbol: cuDriverGetVersion` and `libtvm_ffi.so => not found` | sglang's JIT-compiled `.so` doesn't link `-lcuda` (libcuda not in DT_NEEDED) and tvm_ffi's lib dir is not on the loader path | Set `LD_PRELOAD=/usr/lib/libcuda.so.1` (force-loads libcuda with global symbol scope) and `LD_LIBRARY_PATH=/usr/lib/python3.14/site-packages/tvm_ffi/lib:/usr/lib` in env file |

After all 13 fixes: coherent text, **47 tok/s** (vs Allen Kuo's vLLM 34 tok/s
on RTX PRO 6000).

## Patches in this AUR package

`wjh-fp4-3d-reshape.patch` covers four files:

1. **`python/sglang/srt/layers/quantization/modelopt_quant.py`** — clamp inside
   the cutlass branch of `fp4_gemm()` (replaces the old conditional view
   block); 3D-aware `output_shape` and `.view → .reshape` in
   `ModelOptFp4LinearMethod.apply()`.
2. **`python/sglang/srt/layers/quantization/compressed_tensors/schemes/compressed_tensors_w4a4_nvfp4.py`**
   — same 3D reshape for the compressed-tensors NVFP4 path
   (`CompressedTensorsW4A4Fp4.apply_weights`).
3. **`python/sglang/jit_kernel/nvfp4.py`** — 3D handling in
   `cutlass_scaled_fp4_mm()` (flatten activations *and* matching block
   scales; restore on return).
4. **`python/sglang/jit_kernel/utils.py`** — `/usr/include/cutlass/`
   fallback in `get_cutlass_include_paths()` for system cutlass installs.

Tracks sglang upstream PR #22927 plus the system-include-path extension.
Drop the patch when (#22927 + equivalent JIT include patch) lands upstream.

## Cutlass headers-only PKGBUILD patch

The AUR `cutlass` 4.3.5 PKGBUILD wants to compile cutlass kernels for
SM 75/80/86/89/90/90a — multi-hour build, and we don't need any compiled
artefacts (flashinfer JIT and sglang JIT only consume cutlass *headers*).

Patched local `~/.cache/paru/clone/cutlass/PKGBUILD` to a minimal
`package()` that installs just:
- `include/cutlass/` → `/usr/include/cutlass/`
- `include/cute/` → `/usr/include/cute/`
- `tools/util/include/cutlass/util/` → `/usr/include/cutlass/util/` (this third
  tree is what ships `cutlass/util/command_line.h` — flashinfer needs it,
  initially missed it)

Result: `cutlass-4.3.5-1-any.pkg.tar.zst` builds in seconds (1.6 MB).

## Why `--fp4-gemm-backend=cutlass` not `flashinfer_cutlass`

Two distinct CUTLASS code paths:
- `cutlass` → sglang's own JIT kernel `cutlass_scaled_fp4_mm` in
  `jit_kernel/nvfp4.py`. **This is what PR #22927 fixes.**
- `flashinfer_cutlass` → flashinfer's `mm_fp4(backend="cutlass")` —
  separate kernel implementation, not patched by PR #22927.

In auto-dispatch sglang picks `flashinfer_cudnn` on SM120 (per
`fp4_utils.py:60-78` comment about flashinfer_cutlass NaN with
heterogeneous batches). For our case (batch=1), `cutlass` (sglang JIT,
post-patch) is what works.

**Sanity check after install**: ensure the JIT cache shows
`cutlass_scaled_fp4_mm`, not flashinfer's mm_fp4. The cutlass-branch
gate in `modelopt_quant.py:fp4_gemm()` is
`if fp4_backend.is_cutlass() and cutlass_fp4_gemm is not None`. If
`cutlass_fp4_gemm` failed to import (try/except in modelopt_quant.py:96-100),
sglang silently falls through to flashinfer with backend="cutlass" — same
code path that produced gibberish during debug. Verify with:

```sh
python -c "from sglang.srt.layers.quantization.modelopt_quant import cutlass_fp4_gemm; print(cutlass_fp4_gemm)"
# Should print a real function object, not None.
```

## Why `LD_PRELOAD` + `LD_LIBRARY_PATH`

The sglang JIT-compiled `.so` (at runtime, in
`/var/lib/sglang/.cache/tvm-ffi/sgl_kernel_jit_*/`) does **not** properly
link against:
- `libcuda.so.1` — needed for `cuDriverGetVersion` symbol. Not in
  DT_NEEDED at all. `LD_PRELOAD` forces the lib to load with global symbol
  scope so dlsym at .so init can find the symbol.
- `libtvm_ffi.so` — IS in DT_NEEDED but `/usr/lib/python3.14/site-packages/tvm_ffi/lib`
  isn't on the default loader path. `LD_LIBRARY_PATH` fixes this.

Cleaner fix would be to teach sglang's JIT to add the right link flags
(`-lcuda`, `-Wl,-rpath,<tvm_ffi-lib-dir>`). Not yet done; flagged as a
follow-up upstream issue worth filing.

## Performance baseline

| Test | tok/s | Mode |
|---|---|---|
| `RedHatAI/gemma-4-31B-it-NVFP4` on sglang+cutlass+CUDA-graphs (this) | **46.9** | streaming, 300 tokens |
| Allen Kuo's vLLM on RTX PRO 6000 (NVFP4-cutlass) | 34 | comparable setup, different framework |
| `gemma_4_31b_nvfp4` cuDNN backend pre-patch (gibberish output) | 50 | tok/s number was vacuous — outputs broken |
| Same model with `--disable-cuda-graph` | 21.5 | eager mode, ~2.3× slowdown |

GPU memory: ~25 GB resident (19.71 GB weights + 4.98 GB KV cache + CUDA context).
Sglang `mem_fraction_static=0.82` allocates ~26 GB total. Leaves ~6–7 GB free,
roughly the size of Parakeet TDT 0.6B.

## Co-residency with Parakeet ASR (untested, future work)

To run NeMo Parakeet alongside sglang for the mic→ASR→LLM loop:
- `--mem-fraction-static 0.65` (reduces sglang's arena from ~26 to ~21 GB)
- Leaves ~10-11 GB for Parakeet's ~7 GB working set + KV cache headroom
- Parakeet should load second so it allocates from the remaining pool

## Open follow-ups

- File upstream sglang issue for the JIT-compiled .so missing `-lcuda` link
  (would obsolete the LD_PRELOAD).
- File upstream sglang issue for `get_cutlass_include_paths()` ignoring
  `/usr/include/cutlass/` — distros that ship cutlass headers as a system
  package (Arch's `cutlass` here, also Fedora) should be discoverable.
- Watch sglang PR #22927 — when merged, drop the patch hunks for files 1, 3.
- Watch sglang PR #21952 follow-ups for Gemma 4 chat-template fixes — may
  obsolete the `--chat-template` override.
- Newton (RTX 2060 Super × 2, sm_75): not tested with NVFP4. SM75 doesn't
  have FP4 tensor cores; would need a different quantisation entirely.
