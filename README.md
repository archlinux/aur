# llama.cpp-hip-gfx1151

`llama.cpp-hip-gfx1151` is the HIP-only Strix Halo variant of
[`llama.cpp-gfx1151`](https://aur.archlinux.org/packages/llama.cpp-gfx1151).
It tracks the same llama.cpp release and keeps the sibling package's build,
service, and CPU/HIP tuning unless a difference is listed here.

This package also carries an experimental patch stack for
Qwen3.8-Flash-Next MTP speculative decoding, SSD-backed PLE/engram lookup, and
fast QSA `TOP_K` on AMD GPUs. Those patches are pinned, checksum-verified
snapshots of work that had not all merged upstream when this package was
published. Treat MTP and the enhanced PLE loader as opt-in features, test them
on your workload, and keep a non-speculative baseline.

## What differs from llama.cpp-gfx1151

The comparison below is for package version `b10666`.

| Area | `llama.cpp-hip-gfx1151` | `llama.cpp-gfx1151` |
| --- | --- | --- |
| Package identity | `llama.cpp-hip-gfx1151`, ROCm description | `llama.cpp-gfx1151`, ROCm + Vulkan description |
| GPU backends | `GGML_HIP=ON`, `GGML_VULKAN=OFF` | `GGML_HIP=ON`, `GGML_VULKAN=ON` |
| Vulkan packages | Not required or provided | Depends on `vulkan-icd-loader`; builds with `shaderc`, `vulkan-headers`, and `spirv-headers`; provides Vulkan names |
| HIP headers | Adds the `hipcub` build dependency | No explicit `hipcub` build dependency |
| VMM policy | Explicit `GGML_HIP_NO_VMM=ON` | Does not override the upstream default; its `OFF` example is commented out |
| MFMA MMQ | Explicit `GGML_HIP_MMQ_MFMA=ON` | Uses the upstream default |
| Extra source changes | Eight sourced functional patches, plus one local b10666 compatibility/policy shim, described below | No MTP/QSA/PLE/Strix safety patch stack |
| Package release | `pkgrel=5` | `pkgrel=2` at the time of comparison |

The HIP package hard-codes `_pkgname=llama.cpp`; stripping only `-gfx1151`
from its longer package name would incorrectly produce `llama.cpp-hip`. The
downloaded tarball's local alias also contains this package's name. Neither
mechanical naming difference changes the upstream source contents.

Everything else is intentionally synchronized, including:

- upstream llama.cpp tag `b10666`;
- shared-library, LTO, RPC, and Web UI builds;
- `gfx1151` as the only HIP architecture;
- HIP graphs and MMQ, including all-quant Flash Attention kernels;
- the Zen 5-oriented HIP compiler flags;
- native CPU tuning for local builds and universal CPU variants in CI;
- the systemd service, `/etc/conf.d/llama.cpp`, and the Tailwind build
  workaround used by the sibling package.

The package still conflicts with Vulkan llama.cpp packages. This prevents two
packages that own the same binaries and libraries from being installed together;
it does not mean that this build contains a Vulkan backend.

## Carried patches

Patch order matters. Every source URL, commit, and SHA-256 is pinned in
[`PKGBUILD`](./PKGBUILD).

| Patch | Purpose | Review state and practical risk as of 2026-08-29 |
| --- | --- | --- |
| [Series ending at `1d8de7c`](https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af), from [llama.cpp PR #27836](https://github.com/ggml-org/llama.cpp/pull/27836) | Adds Qwen3.8-Flash-Next NextN/MTP tensor mappings, conversion, graph construction, recurrent state handling, and `draft-mtp` support. | Draft PR, not yet accepted upstream. The change is model-specific but substantial. Experimental; moderate correctness and maintenance risk. |
| [`57bb668`](https://github.com/rmonsurate/llama.cpp/commit/57bb668674d9fb0d382885e5b04911c6437f8e83), also proposed as [rmonsurate/llama.cpp PR #1](https://github.com/rmonsurate/llama.cpp/pull/1) | Keeps `model.hyper_connection_mixer.*` when `convert_hf_to_gguf.py --mtp` exports a detached sidecar. | One-line converter filter change. Low runtime risk; required for a valid standalone Qwen3.8 sidecar. |
| [`a82a58a`](https://github.com/crusaderky/llama.cpp/commit/a82a58a57fc307e5cec0dc68db64d143339be4f2) | Detects a detached head, makes absent trunk tensors optional only in that case, keeps the original trailing block number, and accepts either block-level or model-level head-mixer names. | Explicitly described by its author as unreviewed. It is narrowly contained in the Qwen3.8 loader, but malformed/novel GGUF layouts are the main risk. Experimental; moderate risk. |
| [`fdc1260`](https://github.com/Victor-Loos/llama.cpp/commit/fdc1260e99191717b0aa0a48117d4b758a24a513), from [llama.cpp PR #25863](https://github.com/ggml-org/llama.cpp/pull/25863) | Prevents direct computation on `ROCm_Host` buffers on integrated HIP GPUs while preserving pinned host allocation for staging. This avoids a scheduler write/read race seen on gfx1151. | Narrow backend capability change, independently reproduced, and approved by a HIP code owner. The PR is still open. Low change risk; high correctness and confidentiality value on an APU. |
| [`7f48903`](https://github.com/ggml-org/llama.cpp/commit/7f489034b48051a02c38c2eab5988443b02db300), from [llama.cpp PR #27466](https://github.com/ggml-org/llama.cpp/pull/27466) | Adds a native HIP radix-selection kernel for `TOP_K` rows wider than 1024 columns, avoiding Qwen's long-context QSA fallback to the CPU. | Passed reported HIP `TOP_K` tests and long graph-capture runs on gfx1151; a HIP code owner approved the PR. Still unmerged and not broadly tested across AMD generations. Moderate portability risk, low security risk. |
| [`527fcad`](https://github.com/ggml-org/llama.cpp/commit/527fcad43d2c9ced9fd882a05d872db5647d8f69), from [llama.cpp PR #26592](https://github.com/ggml-org/llama.cpp/pull/26592) | Enables CUB code paths on HIP through hipCUB for sorting, `TOP_K`, reductions, scans, and related operations. It enables them only with rocPRIM 4.4.0 or newer. | One approval, but outstanding review history remains. rocPRIM 4.2 was proven unsafe during HIP graph capture; the pinned commit's version gate addresses that known failure. Moderate backend/runtime risk. |
| [Per-buffer mmap loader at `e5d8461`](https://github.com/Aristo94/EngramHalo.cpp/blob/e5d8461c128a215df2140eed5adf1b68e7d29b56/docs/strix-halo/llama-cpp-qwen38-per-buffer-mmap.patch), from the [EngramHalo.cpp Strix Halo work](https://github.com/Aristo94/EngramHalo.cpp/tree/e5d8461c128a215df2140eed5adf1b68e7d29b56/docs/strix-halo) | Records whether each per-shard destination aliases its mapping, lets dense tensors use asynchronous GPU upload even when global load mode is mmap, and suppresses eager whole-shard prefetch. This leaves the PLE tensor file-backed while dense weights become device allocations. | Used for the published Strix Halo measurements, but it is a standalone fork patch rather than an upstream PR. It changes the general mmap load path, not only Qwen. Moderate load-path and maintenance risk; steady-state tensor math is unchanged. |
| [`c911e6b`](https://github.com/Aristo94/EngramHalo.cpp/commit/c911e6bb5eb956a759e740fb14db8ca639b7d3e7), plus [`qwen4exp-ple-row-prefetch-b10666.patch`](./qwen4exp-ple-row-prefetch-b10666.patch) | Tracks which tensors really remain mmap-backed, submits page-merged `WILLNEED` hints for the selected PLE rows before graph execution, and adds a HIP/CUDA `GET_ROWS` path for 160-value IQ4_NL rows. | Fork-only and tested on one gfx1151 system. The local 43-line shim applies the commit's loader bookkeeping with b10666's older names and preserves normal bulk-prefetch behavior unless a lazy tensor was actually selected. Moderate performance/backend risk; readahead failure is non-fatal. |

The native radix and hipCUB patches are deliberately both present:

- with `ROCPRIM_VERSION >= 400400`, the hipCUB paths are selected;
- with older rocPRIM, hipCUB is not enabled and the native HIP radix kernel
  keeps wide QSA `TOP_K` on the GPU;
- without either change, Qwen3.8 QSA can fall back to the CPU once the row is
  wider than 1024, causing a sharp long-context slowdown.

The hipCUB patch is applied without its two upstream CI workflow edits and
without a test-file edit that only added commented stress-test examples. Runtime
code is not excluded. Package CI is not the same as llama.cpp upstream CI, and
the package builds with upstream tests disabled, as does `llama.cpp-gfx1151`.

### How the SSD-backed PLE patches fit together

Upstream b10666 can mark the large PLE tensor as lazy, but the enhanced path
also has to keep the rest of the model fast and avoid filling unified memory
during load:

| Stage | Package behavior |
| --- | --- |
| Mapping | The PLE remains an mmap alias of the GGUF on NVMe; it is not copied into a permanent 26.8 GiB RAM allocation. |
| Dense-weight load | Other tensors are read through pinned staging buffers and uploaded asynchronously to their HIP buffers even though the selected global load mode is mmap. |
| PLE lookup | Before `GET_ROWS`, selected row ranges are page-aligned, merged, and submitted as readahead hints so the kernel can service several NVMe faults in flight. |

The PLE is still ordinary read-only model data. There is no background daemon,
private cache format, write-back, or model mutation. "SSD-backed" also does not
mean zero RAM use: Linux caches recently faulted PLE pages when memory is
available and can reclaim them under pressure. The resident amount therefore
depends on workload locality and memory pressure; the reported 1-1.5 GiB is an
observation, not a hard limit.

When at least one tensor actually enters lazy mode, the package disables the
loader's initial bulk prefetch for that model. Ordinary mmap models, and a
resident comparison using `--tensor-read-lazy off`, retain b10666's original
prefetch policy. This is still a deliberate loader change and needs
target-machine load/reload testing in addition to model correctness testing.
b10666's existing conservative cleanup can unmap leading and trailing fragments
that no surviving mmap buffer uses; clean pages inside retained mappings remain
reclaimable under memory pressure.

### Why the newest open loader alternatives are not carried

[llama.cpp PR #27837](https://github.com/ggml-org/llama.cpp/pull/27837) is a
promising generic follow-up that makes a lazy tensor override the global load
mode and places it in a dedicated CPU context. It remains open and unreviewed,
and forcing the PLE gather onto the CPU would replace the device-accessible mmap
and HIP `GET_ROWS` path used for the published Strix Halo measurements. This
package therefore retains the measured path and requires explicit `-lm mmap`.

[llama.cpp PR #27928](https://github.com/ggml-org/llama.cpp/pull/27928) proposes
disabling mmap prefetch unconditionally, but its review already questions that
global policy and its interaction with lazy loading. The local b10666 shim is
narrower: it suppresses bulk prefetch only when at least one tensor really
entered lazy mode. A related, more generic batched-readahead implementation is
also still open as [Unsloth PR #137](https://github.com/unslothai/llama.cpp/pull/137).
Re-evaluate these choices once an upstream design is reviewed and merged.

### Why the integrated-GPU host-buffer patch matters

Strix Halo is reported as an integrated HIP GPU. In unpatched `b10666`, that
allows the scheduler to place compute directly on a `ROCm_Host` tensor. The
upstream sanitizer caught the CPU writing new input while the GPU still read the
same host range. Reported symptoms include ignored or corrupted long/system
prompts, repeated `/` or other characters, and, under multiple slots, a response
from one request being returned to another request. The last symptom is a
confidentiality problem, not merely bad model quality.

The `fdc1260` patch keeps the host-buffer factory and pinned staging/output
buffers, but returns false when the scheduler asks whether an integrated HIP
device can compute directly on that buffer type. Independent gfx1151 tests
reported that the corruption and cross-request replay stopped, while controlled
prompt-processing results stayed within normal run variance.

Only the first commit from PR #25863 is carried. Its second commit adds an
unused-parameter marker for non-HIP builds and accidentally marks
`ggml-cuda.cu` executable. This package always builds HIP, so neither part is
needed. `GGML_CUDA_NO_PINNED=1` remains a broader diagnostic fallback that
disables pinned host buffers entirely; it should not be necessary with this
patch and can reduce prompt-processing performance.

### What is already in b10666 from PRs #27742 and #27794

The base tag already contains the merged Qwen3.8-Flash-Next implementation and
the important corrections made during its long review. They are not additional
package patches. These include synchronized QSA indexer/attention cache slots,
multi-stream QSA handling, indexer state save/restore, per-context PLE history
and sequence operations, correct short-history padding, dense fallback when a
compression ratio is absent, and related converter/quantization fixes.

The remaining HIP-specific performance problem identified after that merge was
wide QSA `TOP_K` falling back to the CPU. The native radix and hipCUB patches
above address that backend gap. A separate integrated-HIP host-buffer race was
also linked from the late discussion; the `fdc1260` patch addresses it without
changing the Qwen model implementation.

The tag also contains the merged
[`TENSOR_READ_LAZY` implementation from PR #27794](https://github.com/ggml-org/llama.cpp/pull/27794).
It marks only architecture-selected tensors, skips eager loading for a marked
tensor above 4 GiB in `auto` mode, excludes that range from mmap prefetch, and
uses random-access advice. Qwen3.8's `per_layer_token_embd.weight` is explicitly
marked. The two PLE patches carried here build on that upstream mechanism;
they do not invent a second lazy-loading mode.

### Safety scope of the patch review

The source review found no added shell execution, network access, credential
handling, or persistence in the eight functional patches. The PLE loader patches
intentionally change read-only GGUF mapping, readahead, and page-cache advice;
they do not write to the model. The important risks are conventional
native-code risks: incorrect tensor-layout assumptions, an out-of-bounds GPU
kernel bug, ROCm/hipCUB incompatibility, excessive or ineffective readahead,
numerical drift, or a future upstream conflict.

All 12 package sources were checked against their declared hashes, and the
pinned stack applied cleanly to a fresh `b10666` tree. CPU builds of the unified
`llama` app, `llama-cli`, `llama-server`, and the selected tests completed.
Python converter files compiled; all 517 CPU `TOP_K` cases passed; model-load
cancellation and autorelease passed; and `test-thread-safety` passed 10
consecutive runs. The published sidecar also passed a structural GGUF
inspection. A real gfx1151 HIP build, real PLE load, and long-running GPU test
are still required on the target machine; CPU validation cannot prove a HIP
kernel safe.

## Build configuration

The important HIP options are:

```text
-DCMAKE_HIP_ARCHITECTURES=gfx1151
-DGGML_HIP=ON
-DGGML_HIP_GRAPHS=ON
-DGGML_HIP_NO_VMM=ON
-DGGML_HIP_MMQ_MFMA=ON
-DGGML_CUDA_FORCE_MMQ=ON
-DGGML_CUDA_FA_ALL_QUANTS=ON
-DHIP_PLATFORM=amd
-DGGML_VULKAN=OFF
```

`GGML_CUDA_*` names are not typos. llama.cpp's CUDA-family backend sources are
shared by CUDA and HIP, so several HIP controls retain their historical CUDA
names.

The package also passes:

```text
-mprefer-vector-width=512
-mllvm -inline-threshold=600
-mllvm -unroll-threshold=150
```

These are aggressive compiler choices aimed at the Zen 5/RDNA 3.5 Strix Halo
platform. They are not general ROCm portability settings.

### What `GGML_HIP_NO_VMM=ON` means

This is a double negative: `ON` means **do not use HIP Virtual Memory
Management for llama.cpp's device scratch allocator**. llama.cpp instead uses
its conventional cached `hipMalloc`-backed allocation pool.

It does not disable:

- Strix Halo's unified physical memory;
- GPU offload;
- GGUF file `mmap` or `--load-mode mmap`;
- HIP graphs;
- MTP or the detached sidecar;
- hipCUB or the native radix kernel.

The stability-first setting is justified because AMD still labels the HIP VMM
APIs as beta in the
[ROCm 7.2 documentation](https://rocm.docs.amd.com/projects/HIP/en/docs-7.2.0/doxygen/html/group___virtual.html),
and Strix Halo users have reported allocator instability in some ROCm/package
combinations. It is also the default in
[llama.cpp `b10666`](https://github.com/ggml-org/llama.cpp/blob/b10666/ggml/CMakeLists.txt#L218-L221).
This package spells it out so an upstream default change cannot silently alter
the allocator.

The sibling package's line showing `GGML_HIP_NO_VMM=OFF` is commented out. It
therefore also inherits the upstream no-VMM default today; this package differs
by pinning that policy explicitly, not by currently selecting a different
allocator.

#### Testing VMM with a newer ROCm nightly

A sufficiently new nightly may make VMM reliable on a particular kernel and
firmware combination. Test it as an A/B experiment, not as an assumed upgrade:

1. Record the ROCm package version, kernel, firmware, target GGUF, context,
   batch sizes, and exact server command.
2. Establish a stable `GGML_HIP_NO_VMM=ON` baseline with long context, HIP
   graphs, repeated model load/unload, and memory use close to the intended
   capacity.
3. Rebuild from a clean build directory with the appended override:

   ```bash
   LLAMA_BUILD_EXTRA_ARGS='-DGGML_HIP_NO_VMM=OFF' makepkg -Csfi
   ```

4. Confirm that the startup device line reports VMM as enabled. If it does not,
   the device/runtime rejected VMM regardless of the build option.
5. Repeat the same workload for several thousand generated tokens. Watch for
   HIP errors, hangs, corruption, allocation failures, rising memory use, and
   regressions in tokens/s and latency.
6. If anything is unstable, rebuild without the override. The package default
   remains `GGML_HIP_NO_VMM=ON`.

Do not combine the first VMM test with a ROCm upgrade, new model, new context,
and different batch settings: that makes the result uninterpretable.

### ROCm nightly dependency policy

[`rocm-nightly-gfx1151-bin`](https://aur.archlinux.org/packages/rocm-nightly-gfx1151-bin)
is a sensible choice for this machine, but it is intentionally not a hard
dependency. The monolithic nightly package advertises `hip-runtime-amd`,
`hipblas`, `rocblas`, `hipcub`, and the other ROCm component names through
`provides`, so it already satisfies this package's generic dependencies.

Keeping generic dependency names has three advantages:

- users can choose a known-good official or nightly ROCm build;
- an AUR package rename does not unnecessarily break this package;
- rolling nightly regressions do not become mandatory upgrades.

Install the nightly first if that is the desired provider, then build this
package. Rebuild `llama.cpp-hip-gfx1151` after a major ROCm/LLVM update because
HIP device code and linked ROCm libraries can change compatibility.

Useful version checks are:

```bash
pacman -Q rocm-nightly-gfx1151-bin
hipconfig --version
rocminfo | rg 'gfx1151'
pacman -Ql rocm-nightly-gfx1151-bin | rg 'rocprim_version.hpp$'
```

## Building and basic verification

From a clean AUR clone:

```bash
git clone https://aur.archlinux.org/llama.cpp-hip-gfx1151.git
cd llama.cpp-hip-gfx1151
makepkg -Csi
```

Then verify that the HIP device is visible:

```bash
llama-server --version
llama-server --list-devices
```

The package is intentionally compiled only for `gfx1151`. A binary from this
package is not expected to be portable to unrelated AMD GPU architectures.

## MTP in plain language

Multi-Token Prediction (MTP) uses the extra NextN head shipped in the official
Qwen3.8-Flash-Next checkpoint as a small draft model. The head proposes a short
run of future tokens. The full target model verifies those proposals in a batch
and accepts only the valid prefix.

This can reduce the number of expensive target-model decode steps, but it is
not free:

- the draft head has to run;
- this head reuses a large embedding/output projection, which is why the
  sidecar is about 4.14 GB even though it contains only one extra decoder block;
- acceptance depends on prompt, sampling, quantization, and numerical backend;
- a larger `--spec-draft-n-max` may lower performance when rejected proposals
  cost more than they save.

Correct speculative decoding never trusts an unverified draft token. A bad
sidecar should mainly reduce acceptance and speed. That safeguard does not make
the experimental loader and GPU code immune to bugs, so long-prompt output must
still be inspected.

### Compatibility rules

The sidecar documented below is only for `Qwen/Qwen3.8-Flash-Next` and GGUFs
converted from that exact model family. It is not a generic Qwen draft model.
The target quantization may differ from the sidecar quantization, but the model
architecture, vocabulary, tokenizer, hidden size, and MTP training lineage must
match.

For a sharded target GGUF, pass its first shard to `-m`; llama.cpp discovers the
remaining shards. Pass the single detached head to `-md`.

## Best SSD-backed PLE configuration on a 128 GB Strix Halo

The PLE/engram table is part of the **target** GGUF, not the MTP sidecar. In the
current Unsloth `UD-IQ3_XXS` and `UD-IQ4_XS` targets it is the same 26.82 GiB
IQ4_NL tensor with 160 values per row. Keeping that tensor file-backed changes
the useful memory comparison:

| Target | Whole target on disk | Approximate target excluding the 26.82 GiB PLE | With the 3.86 GiB Q8_0 sidecar |
| --- | ---: | ---: | ---: |
| `UD-IQ3_XXS` | 76.33 GiB | 49.51 GiB | 53.37 GiB plus KV/workspace |
| `UD-IQ4_XS` | 87.25 GiB | 60.43 GiB | 64.29 GiB plus KV/workspace |

These are planning numbers, not promised RSS or GTT allocations. HIP buffers,
KV caches, graph workspaces, the kernel, the desktop, filesystem cache, and
other applications all share physical LPDDR5X on Strix Halo.

With 128 GB and a machine that is not inference-dedicated, `UD-IQ4_XS` is the
quality-first default once this SSD path is installed. It retains materially
more headroom than its 87.25 GiB file size suggests and has better measured
perplexity than `UD-IQ3_XXS`. Use `UD-IQ3_XXS` instead when large desktop/VM
workloads stay resident, swap activity appears, or a larger context/slot count
matters more than the quality step. `UD-Q4_K_XL` remains a poor fit here: its
non-PLE weights alone consume most of the available memory.

Put every target shard on a fast local NVMe filesystem. The following pins the
reviewed [`unsloth/Qwen3.8-Flash-Next-GGUF`](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF)
revision and downloads all three IQ4 shards with the Hugging Face `hf` CLI:

```bash
TARGET_REV=2c41bd2a0b3f51c503c11f1c7ed2e6bb34036beb
TARGET_DIR=/models/Qwen3.8-Flash-Next

hf download unsloth/Qwen3.8-Flash-Next-GGUF \
  --revision "${TARGET_REV}" \
  --include 'UD-IQ4_XS/*.gguf' \
  --local-dir "${TARGET_DIR}"

cd "${TARGET_DIR}/UD-IQ4_XS"
sha256sum -c <<'EOF'
5ce89370720f8bf90890f439361282104c1aa1482d4013bb9a50923e758e71a4  Qwen3.8-Flash-Next-UD-IQ4_XS-00001-of-00003.gguf
577a38a2392b40ca2193cea502e1d92f60b8cd370675d308e0ec21885d9daaa7  Qwen3.8-Flash-Next-UD-IQ4_XS-00002-of-00003.gguf
d4634e6d84f0ebb0940be15c90d3790bf6464e3dea3a1cddc567dc0e83ad8833  Qwen3.8-Flash-Next-UD-IQ4_XS-00003-of-00003.gguf
EOF
```

This is the tuned single-slot starting command; it assumes the Q8_0 sidecar
documented below:

```bash
ROCBLAS_USE_HIPBLASLT=1 \
llama-server \
  -m /models/Qwen3.8-Flash-Next/UD-IQ4_XS/Qwen3.8-Flash-Next-UD-IQ4_XS-00001-of-00003.gguf \
  -md /models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf \
  -ngl all \
  -fa on \
  -ctk q8_0 -ctv q8_0 \
  -lm mmap \
  --tensor-read-lazy on \
  -c 131072 \
  -b 8192 -ub 2048 \
  -t 4 \
  --np 1 \
  --jinja \
  --metrics \
  --spec-type draft-mtp,ngram-mod \
  --spec-draft-ngl all \
  --spec-draft-n-max 4 \
  --spec-draft-p-min 0.75 \
  --spec-ngram-mod-n-max 64 \
  --spec-ngram-mod-n-match 24
```

Why these choices:

- `-lm mmap --tensor-read-lazy on` is the essential pair. `auto`, the default,
  also selects lazy mode because this marked tensor exceeds 4 GiB; spelling out
  `on` makes a configuration error visible.
- `q8_0` target KV was the best measured memory/performance tradeoff on this
  architecture. The MTP draft cache is left at its F16 default because the
  published tuned measurements did not validate a quantized draft cache.
- `-b 8192 -ub 2048 -t 4` is the measured Strix Halo SSD-mode working point.
  If it is unstable with a particular nightly, reduce `-ub` to 1024 before
  changing multiple knobs.
- `-c 131072` means one 131K slot because `--np 1` is used. SSD-mode MTP was
  measured through roughly 156K and validated with a 163,840-token slot on the
  reference system; 256K plus MTP was not validated. Increase context only
  after watching available memory and swap through a full-length request.
- Q8_0 sidecar, draft depth 4, and probability floor 0.75 were the best reported
  mixed code/prose production candidate in the Strix tuning runs. The simpler
  depth-2, floor-0 command later in this document remains the correctness-first
  baseline. Benchmark both on the real workload.
- `ROCBLAS_USE_HIPBLASLT=1` was enabled for the published ROCm measurements.
  Keep it only if the installed nightly supports it and an A/B run confirms a
  win; removing the variable is the fallback.

Do **not** combine SSD-backed PLE with any of the following:

- `-lm none` or `--no-mmap`: the PLE is read into an ordinary resident tensor;
- `-lm mmap+mlock` or `--mlock`: mapped model ranges become pinned and the OS
  cannot reclaim the intended memory saving;
- `-lm dio`: lazy tensor reads require mmap, and reported Strix runs showed
  direct-I/O host RSS ballooning;
- a broad CPU tensor override for the PLE: b10666 already assigns the input
  tensor appropriately, while an override can change scheduling and emits an
  mmap performance warning.

At startup, require a line containing both the real tensor name and `lazy read
enabled`:

```text
per_layer_token_embd.weight ... lazy read enabled
```

If that line is absent, stop: the PLE is not using the intended path. During a
request, the following provides a rough view of file-backed RSS:

```bash
LLAMA_PID=$(pgrep -n llama-server)
pmap -x "${LLAMA_PID}" | rg '\.gguf|total'
```

Cached PLE pages should grow with new row accesses and remain reclaimable;
expecting a permanently fixed 1 GiB value is incorrect. Watch `vmstat 1` as
well: sustained swap-in/swap-out means the chosen quant, context, or competing
workload still exceeds comfortable capacity.

On the one published 96 GB Strix Halo system, warm-cache mmap versus resident
PLE cost about 5% in depth-0 prefill (468.1 versus 491.4 tokens/s), essentially
nothing in ordinary decode (24.6 versus 24.7), and about 10% on a code-heavy MTP
run (35.3 versus 39.3). A cold or low-locality workload pays actual NVMe latency
and can be slower. The reward is roughly 26.8 GiB of reclaimable capacity and
much more context/application headroom.

## Using the preconverted Q8_0 sidecar

The community sidecar is hosted at
[`drluoto/Qwen3.8-Flash-Next-MTP-GGUF`](https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF).
Use the immutable revision and verify the GGUF hash:

```bash
SIDECAR_REV=67de7592b670ef454a903574d5e2aa6c8e1d6b46
SIDECAR_FILE=mtp-Qwen3.8-Flash-Next-Q8_0.gguf

curl --fail --location \
  --output "${SIDECAR_FILE}" \
  "https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF/resolve/${SIDECAR_REV}/${SIDECAR_FILE}?download=true"

printf '%s  %s\n' \
  'b9880220df29fc224bbce408c867cd5d9c021263b754033ea624b669e374f4ec' \
  "${SIDECAR_FILE}" | sha256sum -c -
```

Audited object facts:

| Property | Value |
| --- | --- |
| File size | 4,142,897,248 bytes |
| SHA-256 / Hugging Face LFS object ID | `b9880220df29fc224bbce408c867cd5d9c021263b754033ea624b669e374f4ec` |
| GGUF | Version 3, architecture `qwen4exp`, 37 tensors |
| Layout check | 32-byte-aligned, non-overlapping tensor ranges ending exactly at the declared file size |
| Claimed source | Official `Qwen/Qwen3.8-Flash-Next` checkpoint |

At the time of review, the repository contained only `.gitattributes`, a model
card, and this GGUF; it contained no Python or custom model code. Hugging Face's
security status for the large GGUF was still queued/unscanned. A GGUF is data,
not a script, but any malformed binary format can exercise bugs in its parser.
The exact hash proves which bytes were downloaded; it does not independently
prove who produced those bytes or that the conversion claim is true.

The practical verdict is: this exact object is reasonable to use for local
inference with this patched package after verifying the hash. No malicious
content or structural anomaly was found. Provenance is community-attested rather
than reproducibly signed, so users who need stronger assurance should recreate
the sidecar from the official checkpoint as described below.

### Start with pure MTP

Use a modest context first and keep all target and draft layers on the GPU:

```bash
llama-server \
  -m /models/Qwen3.8-Flash-Next-TARGET-00001-of-NNNNN.gguf \
  -md /models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf \
  --spec-type draft-mtp \
  --spec-draft-ngl all \
  --spec-draft-n-max 2 \
  --spec-draft-p-min 0 \
  -ngl all \
  -fa on \
  -ctk q8_0 -ctv q8_0 \
  -lm mmap \
  --tensor-read-lazy on \
  -c 32768 \
  --np 1 \
  --jinja \
  --metrics
```

Start with `--spec-draft-n-max 2`, then benchmark `3` and `4`. Reports across
backends and workloads disagree on which is faster. For greedy decoding,
`--spec-draft-p-min 0` is a clear diagnostic baseline. The later Strix tuning
found `n-max 4` with `p-min 0.75` substantially better for its Q8_0 sidecar,
especially on prose, but treat that as a separate production-candidate run.

After pure MTP is known-good, test the combined n-gram drafter:

```text
--spec-type draft-mtp,ngram-mod
--spec-ngram-mod-n-max 64
--spec-ngram-mod-n-match 24
```

Do not attribute the combined result to MTP alone. Repetitive code-editing
workloads can benefit greatly from n-gram drafting even without MTP.

Optional tuning, one change at a time:

- sweep `-ub 512`, `1024`, and `2048`, with `-b` at least as large as `-ub`;
- test draft depths 2, 3, and 4, including the measured `4`/`0.75` candidate;
- compare F16 and Q8_0 target/draft KV caches using `-ctk`, `-ctv`, `-ctkd`,
  and `-ctvd`;
- compare SSD mode (`-lm mmap --tensor-read-lazy on`) with resident mode
  (`-lm none --tensor-read-lazy off`) only as a controlled memory/performance
  experiment; `mmap+mlock` and `dio` are not SSD-backed PLE configurations;
- measure the production context length and sampling settings, not only a short
  greedy prompt;
- keep `--spec-draft-backend-sampling` enabled unless isolating a regression.

RPC adds a synchronization hop to every draft step and has been a net loss in
published tests. Benchmark local HIP first.

### ROCm graph-capture troubleshooting

ROCm 7.1/7.2 with rocPRIM 4.2 was observed to abort when a hipCUB segmented
radix sort ran inside HIP graph capture. The pinned hipCUB patch enables that
path only for rocPRIM 4.4 or newer; older installations should use the native
radix `TOP_K` path instead.

If a newer runtime still fails with `operation not permitted when stream is
capturing`, test this diagnostic workaround:

```bash
GGML_CUDA_DISABLE_GRAPHS=1 llama-server ...
```

The CUDA-named environment variable also controls graphs in the HIP backend.
Disabling graphs may reduce performance. It should not be the default with this
patch stack; report the exact rocPRIM/ROCm versions and reproduce before keeping
the workaround.

## Recreating the sidecar with shard-scalpel

The official checkpoint is roughly 360 GB. `shard-scalpel` reads its
safetensors index and shard headers, then uses HTTP Range requests to download
only selected tensor byte ranges. The MTP extraction is about 5.2 GB. It writes
a smaller, valid safetensors checkpoint directory that llama.cpp's lazy-loading
converter can consume.

Pin and verify the reviewed single-file tool:

```bash
git clone https://github.com/drluoto/shard-scalpel.git
cd shard-scalpel
git checkout --detach dca5067d933f5b82db97842ffc9f411168549763

printf '%s  %s\n' \
  'e0f33149c382f2158135e12fec852fd05c6d191cb58464c0a4fbc34089a6437c' \
  shard_scalpel.py | sha256sum -c -
```

Extract from an immutable official Qwen revision into a new directory:

```bash
./shard_scalpel.py Qwen/Qwen3.8-Flash-Next extracted-mtp/ \
  --revision de4b8e4d43b917e7706784d8bb445c9af86a3540 \
  --match '^mtp\.' \
  --take lm_head.weight \
  --take model.language_model.embed_tokens.weight \
  --match '^model\.language_model\.hyper_connection_mixer\.' \
  --rename 'model.language_model.:model.' \
  --aux config.json \
  --aux generation_config.json \
  --aux tokenizer.json \
  --aux tokenizer_config.json
```

The rename removes the `language_model` wrapper so the converter sees the names
expected by the text model. The model-level mixer is different from the MTP
block's own mixer; both are required by this detached layout.

Use the converter from the **prepared source of this package**, not an unpatched
upstream checkout. `makepkg -o` downloads the pinned sources and runs
`prepare()`, applying the complete package patch stack without compiling it:

```bash
git clone https://aur.archlinux.org/llama.cpp-hip-gfx1151.git package-src
cd package-src
makepkg -o

python src/llama.cpp/convert_hf_to_gguf.py \
  /absolute/path/to/shard-scalpel/extracted-mtp/ \
  --mtp \
  --outtype q8_0 \
  --outfile mtp-Qwen3.8-Flash-Next-Q8_0.gguf
```

If `BUILDDIR` is customized in `makepkg.conf`, the prepared llama.cpp source is
under that build directory instead of `package-src/src/llama.cpp`. Install the
converter's Python dependencies listed as this package's optional dependencies.

Finally inspect and hash the result before using it:

```bash
sha256sum mtp-Qwen3.8-Flash-Next-Q8_0.gguf
python src/llama.cpp/gguf-py/gguf/scripts/gguf_dump.py \
  mtp-Qwen3.8-Flash-Next-Q8_0.gguf
```

`shard-scalpel` itself is small, standard-library-only, and contains no
`eval`, subprocess, shell, or dynamic import. Its token is sent only as the
Hugging Face Authorization header and is not printed. It is a convenience tool,
not a hardened downloader:

- it trusts the remote index's shard paths and the requested auxiliary paths;
- it does not verify checkpoint hashes, `Content-Range`, or response length;
- writes are not atomic and there is no resume/retry mechanism;
- ranges are fetched sequentially and selected tensors are held in memory;
- rename collisions are not detected.

For the pinned official Qwen repository these limitations are manageable. Use a
new output directory, do not run the tool as root, keep the exact revision, and
do not reuse it blindly on an untrusted checkpoint index.

## Benchmarking MTP on Strix Halo

The benchmark must answer two separate questions:

1. Is generation still correct and useful at short and long prompt lengths?
2. Does speculative decoding improve end-to-end latency and decode throughput
   after paying for the draft head?

A high acceptance rate alone is not a win. A drafter can accept many tokens and
still be slower because its own attention and 248K-vocabulary output projection
are expensive.

SSD-backed PLE adds a second experimental axis: page-cache temperature. A
server restart resets llama.cpp state but does **not** evict clean GGUF pages
from Linux's filesystem cache. Choose and label one of these methods:

- steady-state: submit the same unrecorded warm-up request once, then record
  repeated requests whose PLE rows are likely cached;
- cold-ish: stop every process mapping the target, ask Linux to discard the
  clean pages for exactly those GGUF files, restart, and record the first
  request;
- mixed production: use distinct real prompts and report the sequence rather
  than reducing it to an unexplained median.

For a targeted, unprivileged, best-effort cold reset on Linux, pass only the
target shards and sidecar under test:

```bash
python - /models/Qwen3.8-Flash-Next/UD-IQ4_XS/*.gguf \
  /models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf <<'PY'
import os
import sys

for path in sys.argv[1:]:
    fd = os.open(path, os.O_RDONLY)
    try:
        os.posix_fadvise(fd, 0, 0, os.POSIX_FADV_DONTNEED)
    finally:
        os.close(fd)
PY
```

`posix_fadvise` is advisory, so label this cold-ish rather than guaranteed
cold. Do not use the system-wide root-only `drop_caches` control on a working
desktop merely to make a benchmark prettier.

### Controlled test matrix

Use the same target GGUF, prompt set, output length, context, batch/ubatch,
target and draft offload, KV types, sampling, server slots, and ROCm build for
every row.

| Run | Speculative settings | What it isolates |
| --- | --- | --- |
| A | `--spec-type none`, no `-md` | Target-only baseline |
| B | `draft-mtp`, `--spec-draft-n-max 2` | Conservative pure MTP |
| C | `draft-mtp`, `--spec-draft-n-max 3` | Extra draft depth |
| D | `draft-mtp`, `--spec-draft-n-max 4 --spec-draft-p-min 0.75` | Tuned Strix production candidate |
| E | `draft-mtp,ngram-mod`, same settings as D | Incremental n-gram benefit |

Run every row at least three times and compare medians. Restart the server
between configurations to reset allocator and speculative counters, then apply
the same page-cache method to every row. Keep the machine plugged in, use the
same power mode, and either hold competing memory pressure constant or record
it as part of the production test.

For correctness, include at least:

- a short prompt;
- a real prompt above 2,700 tokens;
- an 8K prompt;
- the longest production prompt you expect to use.

Long prompts matter: an earlier incorrect MTP implementation produced plausible
short output but degenerated into multilingual noise above about 2.6K tokens.
Read the output; tokens/s from corrupt text is not a valid result.

For greedy A/B checks, use temperature 0 and a fixed seed. Save the generated
text from both runs. Byte identity is ideal, but HIP floating-point differences
can make a correct run choose a different token near a tie. If outputs diverge,
verify that both remain coherent and compare target logits or token traces before
calling it corruption.

Create one reusable request from a real long prompt while the baseline server is
running:

```bash
jq --null-input --rawfile prompt long-prompt.txt \
  '{messages:[{role:"user",content:$prompt}],max_tokens:512,temperature:0,seed:1234,stream:false}' \
  > long-request.json

curl --fail --silent --show-error \
  --header 'Content-Type: application/json' \
  --data-binary @long-request.json \
  http://localhost:8080/v1/chat/completions \
  | tee baseline-long.json

jq -r '.choices[0].message.content' baseline-long.json > baseline-long.txt
jq '{usage,timings}' baseline-long.json
```

After restarting with MTP, submit the unchanged `long-request.json`, save it as
`mtp-long.json`, and extract `mtp-long.txt`. `cmp baseline-long.txt mtp-long.txt`
tests byte identity. If it differs, inspect both complete files instead of
judging only the first paragraph. The response's `timings.prompt_n` confirms the
actual tokenized prompt length.

### llama.cpp SPEED-Bench client

The prepared `b10666` source includes a dedicated speculative-decoding client at
`tools/server/bench/speed-bench`. Create a virtual environment and install its
three requirements:

```bash
LLAMA_SRC=/absolute/path/to/prepared/llama.cpp
python -m venv speed-bench-venv
source speed-bench-venv/bin/activate
python -m pip install -r "${LLAMA_SRC}/tools/server/bench/speed-bench/requirements.txt"
```

Start the baseline server in another terminal with the common model settings
and no draft model:

```bash
llama-server \
  -m /models/Qwen3.8-Flash-Next-TARGET-00001-of-NNNNN.gguf \
  --spec-type none \
  -ngl all -fa on -ctk q8_0 -ctv q8_0 \
  -lm mmap --tensor-read-lazy on \
  -c 32768 -b 2048 -ub 512 \
  --np 1 --jinja --metrics --port 8080
```

Run a quick, deterministic workload and save all per-request results:

```bash
python "${LLAMA_SRC}/tools/server/bench/speed-bench/speed_bench.py" \
  --url localhost:8080 \
  --bench qualitative \
  --category coding,math,reasoning \
  --osl 512 \
  --limit 8 \
  --concurrency 1 \
  --extra-inputs '{"temperature":0,"seed":1234}' \
  --output baseline.json
```

Stop the server, start it again with the same common arguments plus pure MTP:

```text
-md /models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf
--spec-type draft-mtp
--spec-draft-ngl all
--spec-draft-n-max 2
--spec-draft-p-min 0
```

Run the identical client command, changing only the output file to
`mtp-n2.json`, then compare:

```bash
python "${LLAMA_SRC}/tools/server/bench/speed-bench/speed_bench_compare.py" \
  --baseline baseline.json \
  --speculative mtp-n2.json
```

Repeat with draft depths 3 and 4, the 0.75 probability floor, and the combined
n-gram configuration. For a known long input length, repeat the client runs
with `--bench throughput_8k`. Increase `-c` so it exceeds input plus output
tokens. The SPEED-Bench script validates the available dataset configuration
names and will list them if a requested split is unavailable.

Match client concurrency to server slots: `--concurrency 1` with `--np 1`, or
the same larger value for a separate throughput-under-load experiment. Do not
compare a single-user baseline to a multi-slot MTP run.

When testing `--np` above 1, put a unique random nonce in every concurrent
prompt and require its own nonce in the response. Reject any response containing
another request's nonce. That specifically checks for recurrence of the
integrated-HIP host-buffer race that `fdc1260` prevents; ordinary quality scoring
can miss a plausible answer replayed from a different slot.

### Metrics to record

SPEED-Bench reports:

- prompt/prefill tokens per second;
- predicted/decode tokens per second;
- end-to-end request latency;
- `accepted / drafted` token acceptance rate;
- per-category and overall results.

Its comparison script calculates decode and latency speedups. Also retain:

- server startup and final timing logs;
- exact generated outputs for the long-prompt correctness cases;
- peak system/GPU memory and any swap use;
- whether the PLE run was cold-ish, warmed with the same prompt, or mixed;
- target-disk read bytes, latency/utilization, and GGUF file-backed RSS where
  available;
- target and draft model hashes;
- package commit, ROCm version, kernel, firmware, and full command line.

With `--metrics`, cumulative counters are available at:

```bash
curl --silent http://localhost:8080/metrics | \
  rg 'spec_decode_num_(draft_tokens|accepted_tokens|drafts)'
```

`accepted_tokens / draft_tokens` is acceptance rate.
`1 + accepted_tokens / drafts` is the average number of output tokens advanced
per target verification step. Reset the counters by restarting the server before
each measured configuration.

The final decision metric is production end-to-end latency or throughput, not a
single microbenchmark. A useful Strix Halo result should show coherent long
output, no graph-capture failure over thousands of tokens, no pathological
memory growth, and a repeatable speedup over run A.

### Rejected load-time drop-behind patch

This package intentionally does **not** carry EngramHalo.cpp commit
[`5486559`](https://github.com/Aristo94/EngramHalo.cpp/commit/5486559c0eb59ca0f8bbacf785c5f4a1ee4294c6),
which unmaps copied dense-tensor ranges and asks the kernel to discard their
clean file-cache pages. It can lower peak pressure while a model loads, but it
failed the package safety audit.

On the exact b10666 patch stack, llama.cpp's `test-thread-safety` loads two
model objects with four contexts each. With the drop-behind patch it
segfaulted in 10 of 10 runs at its default mode and in 3 of 3 runs with
unmapping alone; with both behaviors disabled it passed 10 of 10 runs. Code
review suggests that one tensor can cause a source range to be unmapped while
a tied or duplicated tensor in another buffer context still aliases that
range. That explanation is an inference, but the repeatable test failure is
enough to reject the patch in a general llama.cpp package.

The retained per-buffer patch already avoids eagerly prefetching every mmap
range during model load. It keeps b10666's conservative mapping cleanup, which
only unmaps leading and trailing fragments outside the range used by surviving
mmap buffers; clean pages in the retained range remain reclaimable. This trades
a potentially lower load-time peak for correct shared/tied-tensor lifetime and
a warm page cache for faster reloads.

## Known limitations and rollback

- All eight functional patches are snapshots. Recheck their upstream PRs and
  fork commits when updating the llama.cpp tag; remove a package patch once an
  equivalent fix is upstream.
- The MTP graph currently uses dense attention in the draft block. Draft cost
  therefore grows with context even though the target's QSA is sparse.
- The detached loader recognizes the sidecar by missing trunk tensors. Only use
  sidecars from a trusted/pinned source with the expected metadata.
- The integrated-HIP host-buffer change is a conservative capability workaround,
  not the general scheduler synchronization fix. Retest chunked prompts and
  nonce-isolated concurrent requests after upstream scheduler changes.
- New rocPRIM versions take a broader hipCUB path than old versions. Re-run
  `TOP_K`, `ARGSORT`, reduction, scan, graph, and long-generation tests after a
  nightly upgrade.
- The PLE row readahead and per-buffer mmap loader are fork work with no
  upstream review. Re-test cold load, warm reload, partial offload, model
  cancellation, and a non-Qwen mmap model after every rebase.
- `GGML_HIP_NO_VMM=ON` is a reversible stability policy, not a claim that VMM
  can never work on Strix Halo.

The simplest runtime rollback is to omit `-md` and use `--spec-type none`. The
package then runs the ordinary target path while retaining the QSA GPU fixes.
That does not disable SSD-backed PLE. Use `-lm none --tensor-read-lazy off` for
a resident-PLE comparison. For a full source rollback, remove the added patch
sources and their `prepare()` applications, restore the sibling package's
dependencies/options, and increment `pkgrel`.

## Primary references

- [Qwen3.8-Flash-Next support, llama.cpp PR #27742](https://github.com/ggml-org/llama.cpp/pull/27742)
- [Qwen3.8 NextN/MTP, llama.cpp PR #27836](https://github.com/ggml-org/llama.cpp/pull/27836)
- [Working Strix Halo combination and sidecar comment](https://github.com/ggml-org/llama.cpp/pull/27836#issuecomment-5460955631)
- [Integrated HIP host-buffer safety fix, llama.cpp PR #25863](https://github.com/ggml-org/llama.cpp/pull/25863)
- [Cross-request replay report on gfx1151, llama.cpp issue #25992](https://github.com/ggml-org/llama.cpp/issues/25992)
- [Qwen3.8 multi-segment corruption report on gfx1151, llama.cpp issue #27797](https://github.com/ggml-org/llama.cpp/issues/27797)
- [Native HIP wide radix `TOP_K`, llama.cpp PR #27466](https://github.com/ggml-org/llama.cpp/pull/27466)
- [hipCUB on HIP, llama.cpp PR #26592](https://github.com/ggml-org/llama.cpp/pull/26592)
- [Upstream lazy tensor reads, llama.cpp PR #27794](https://github.com/ggml-org/llama.cpp/pull/27794)
- [Open lazy-loader follow-up, llama.cpp PR #27837](https://github.com/ggml-org/llama.cpp/pull/27837)
- [Open global mmap-prefetch change, llama.cpp PR #27928](https://github.com/ggml-org/llama.cpp/pull/27928)
- [Per-tensor mmap feature request, llama.cpp issue #27766](https://github.com/ggml-org/llama.cpp/issues/27766)
- [Qwen PLE SSD-offload discussion](https://github.com/ggml-org/llama.cpp/discussions/27864)
- [EngramHalo.cpp Strix Halo tuning guide](https://github.com/Aristo94/EngramHalo.cpp/blob/e5d8461c128a215df2140eed5adf1b68e7d29b56/docs/strix-halo/README.md)
- [PLE row readahead and IQ4_NL `GET_ROWS`](https://github.com/Aristo94/EngramHalo.cpp/commit/c911e6bb5eb956a759e740fb14db8ca639b7d3e7)
- [Related Unsloth batched-readahead PR](https://github.com/unslothai/llama.cpp/pull/137)
- [Audited and rejected UMA load-time page-cache drop-behind](https://github.com/Aristo94/EngramHalo.cpp/commit/5486559c0eb59ca0f8bbacf785c5f4a1ee4294c6)
- [llama.cpp speculative decoding documentation](https://github.com/ggml-org/llama.cpp/blob/b10666/docs/speculative.md)
- [llama.cpp SPEED-Bench documentation](https://github.com/ggml-org/llama.cpp/blob/b10666/tools/server/bench/speed-bench/README.md)
- [AMD HIP VMM API documentation for ROCm 7.2](https://rocm.docs.amd.com/projects/HIP/en/docs-7.2.0/doxygen/html/group___virtual.html)
- [Official Qwen3.8-Flash-Next checkpoint](https://huggingface.co/Qwen/Qwen3.8-Flash-Next)
- [Pinned Unsloth target GGUFs](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF/commit/2c41bd2a0b3f51c503c11f1c7ed2e6bb34036beb)
- [Reviewed preconverted MTP sidecar](https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF)
- [`shard-scalpel`](https://github.com/drluoto/shard-scalpel)
