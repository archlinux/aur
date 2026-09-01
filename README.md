# llama.cpp-hip-gfx1151

`llama.cpp-hip-gfx1151` is the HIP-only Strix Halo variant of
[`llama.cpp-gfx1151`](https://aur.archlinux.org/packages/llama.cpp-gfx1151).
It keeps the sibling package's build, service, and CPU/HIP tuning unless a
difference is listed here. This revision is intentionally two upstream build
tags ahead: the package is `b10731`, while the live sibling was still `b10729`
when this sync was finalized.

This package also carries an experimental patch stack for
Qwen3.8-Flash-Next MTP speculative decoding, SSD-backed PLE/engram lookup, and
fast QSA `TOP_K` on AMD GPUs. Those patches are pinned, checksum-verified
snapshots of work that had not all merged upstream when this package was
published. Treat MTP and the enhanced PLE loader as opt-in features, test them
on your workload, and keep a non-speculative baseline.

## What differs from llama.cpp-gfx1151

The comparison below is this package at `b10731` versus the live sibling at
`b10729`.

| Area | `llama.cpp-hip-gfx1151` | `llama.cpp-gfx1151` |
| --- | --- | --- |
| Package identity | `llama.cpp-hip-gfx1151`, ROCm description | `llama.cpp-gfx1151`, ROCm + Vulkan description |
| GPU backends | `GGML_HIP=ON`, `GGML_VULKAN=OFF` | `GGML_HIP=ON`, `GGML_VULKAN=ON` |
| Vulkan packages | Not required or provided | Depends on `vulkan-icd-loader`; builds with `shaderc`, `vulkan-headers`, and `spirv-headers`; provides Vulkan names |
| HIP headers | Keeps `rocm-hip-sdk` and adds an explicit `hipcub` build dependency for the carried hipCUB patch | Relies on `rocm-hip-sdk` for those headers |
| VMM policy | Explicit `GGML_HIP_NO_VMM=ON` | Does not override the upstream default; its `OFF` example is commented out |
| MFMA MMQ | Explicit `GGML_HIP_MMQ_MFMA=ON` | Uses the upstream default |
| Upstream tag | `b10731`; includes the two accepted Qwen changes described below | `b10729` at the time of comparison |
| Build identity | Pins the upstream `b10731` commit (`0eadefe`) and prevents CMake's Git probes from escaping the extracted source tree | Can report the enclosing AUR wrapper commit when built from a normal AUR Git clone |
| Extra source changes | Eleven remotely sourced functional patch files and two local, checksum-pinned adaptations, described below | No MTP/QSA/PLE/Strix safety patch stack |
| Package release | `pkgrel=1` | `pkgrel=1` at the time of comparison |

The HIP package hard-codes `_pkgname=llama.cpp`; stripping only `-gfx1151`
from its longer package name would incorrectly produce `llama.cpp-hip`. The
downloaded tarball's local alias also contains this package's name. Neither
mechanical naming difference changes the upstream source contents.

Everything else is intentionally synchronized, including:

- shared-library, LTO, RPC, and Web UI builds;
- `gfx1151` as the only HIP architecture;
- HIP graphs and MMQ, including all-quant Flash Attention kernels;
- the Zen 5-oriented HIP compiler flags;
- native CPU tuning for local builds and universal CPU variants in CI;
- the systemd service, `/etc/conf.d/llama.cpp`, system-user and tmpfiles
  definitions, and the Tailwind build workaround used by the sibling package.

The package still conflicts with Vulkan llama.cpp packages. This prevents two
packages that own the same binaries and libraries from being installed together;
it does not mean that this build contains a Vulkan backend.

## Carried patches

Patch order matters. Every remotely sourced functional patch is fetched from
an immutable commit/compare URL and pinned by SHA-256 in
[`PKGBUILD`](./PKGBUILD); every other package source is checksum-pinned as
well. GNU patch fuzz is explicitly disabled, and the filtered patches use
Git's exact-context application, so an ambiguous rebase fails preparation
instead of silently guessing at nearby code. The four service/config assets
retain the sibling package's mutable `refs/heads/main` URLs. Their hashes
prevent silent substitution, but an upstream asset change will make source
verification fail until the base package updates its checksum.

| Patch | Purpose | Review state and practical risk as of 2026-09-01 |
| --- | --- | --- |
| [Series ending at `1d8de7c`](https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af), from [llama.cpp PR #27836](https://github.com/ggml-org/llama.cpp/pull/27836) | Adds Qwen3.8-Flash-Next NextN/MTP tensor mappings, conversion, graph construction, recurrent state handling, and `draft-mtp` support. | Draft PR, not yet accepted upstream. The change is model-specific but substantial. Experimental; moderate correctness and maintenance risk. |
| [`57bb668`](https://github.com/rmonsurate/llama.cpp/commit/57bb668674d9fb0d382885e5b04911c6437f8e83), also proposed as [rmonsurate/llama.cpp PR #1](https://github.com/rmonsurate/llama.cpp/pull/1) | Keeps `model.hyper_connection_mixer.*` when `convert_hf_to_gguf.py --mtp` exports a detached sidecar. | One-line converter filter change. Low runtime risk; required for a valid standalone Qwen3.8 sidecar. |
| [`a82a58a`](https://github.com/crusaderky/llama.cpp/commit/a82a58a57fc307e5cec0dc68db64d143339be4f2) | Detects a detached head, makes absent trunk tensors optional only in that case, keeps the original trailing block number, and accepts either block-level or model-level head-mixer names. | Explicitly described by its author as unreviewed. It is narrowly contained in the Qwen3.8 loader, but malformed/novel GGUF layouts are the main risk. Experimental; moderate risk. |
| [`ea9f94f`](https://github.com/drluoto/llama.cpp/commit/ea9f94fc76259fa4addbd4993efc44ab5f09648e), adapted from the first revision of [llama.cpp PR #27941](https://github.com/ggml-org/llama.cpp/pull/27941), followed by the upstream series through [`868e2f5`](https://github.com/ggml-org/llama.cpp/compare/132832dc3a18674f2ffec37097efd4e78d3fb12e...868e2f52ff9a381b7594bace016b6f0f7527f2ba) | Preserves QSA indexer keys across sequence copies, separates blocks by sequence set, ranks M-RoPE image cells correctly, validates malformed metadata, avoids the 65,535-block launch limit, gives short QSA sequences a finite spare-block bias instead of producing NaNs, and restores saved M-RoPE coordinates to the indexer cache. | The PR remains unmerged. Its force-pushed `21c13c4` head now adds real PLE-backed state round-trip tests and stricter loader checks, but a maintainer has asked the author to find the underlying architecture-test failure instead of keeping an exception. This package intentionally freezes the previously validated functional subset rather than importing that disputed test workaround. The overall grouping rewrite remains substantial and experimental. |
| [Series ending at `757abc9`](https://github.com/ggml-org/llama.cpp/compare/9723942adc518b43c4b95dc4dce6906903eb5e09...757abc99b3afb357bc40da9d1fa97c2d2ac10028), from [llama.cpp PR #28068](https://github.com/ggml-org/llama.cpp/pull/28068) | Corrects Gated DeltaNet q/k normalization from `x / max(sqrt(sum(x²)), eps)` to the Qwen/FLA definition `x * rsqrt(sum(x²) + eps)`. It affects Qwen3.8 and the other GDN model graphs without changing `ggml_l2_norm` itself. | The formula is supported by Qwen FlashQLA, Transformers, vLLM, and SGLang, and its `rms_norm` plus scale construction is algebraically exact. Two maintainers have now approved the PR. The author's aggregate KLD changed only slightly; one synthetic Metal n=1 prompt improved, but its reporter explicitly cautioned that this is not proof. Treat it as a reviewed reference-correctness fix with moderate model-output risk, not a quality or speed claim. |
| [`13e4cfe`](https://github.com/ggml-org/llama.cpp/commit/13e4cfe53ff3dc2e786a9264ee552da53e0a41c4), from [llama.cpp PR #28007](https://github.com/ggml-org/llama.cpp/pull/28007) | When a hybrid target or draft cannot partially roll recurrent memory back far enough, clears both sequences and reprocesses the prompt instead of aborting or continuing with stale state. | One server file, one concrete Qwen hybrid+vision reproduction, and 136 reported server tests passed. It has no human approval yet and the expensive fallback is intentionally reachable only after rollback refusal. Low code-scope risk; moderate behavioral risk in complex prompt-cache/speculative flows. |
| [`181b199`](https://github.com/ggml-org/llama.cpp/commit/181b1999205fd0e7c3e0db2874856649a0612d3f), from [llama.cpp PR #25670](https://github.com/ggml-org/llama.cpp/pull/25670) | Rejects an invalid top-level RPC graph node before `ggml_hash_insert` and graph execution. Without it, an unauthenticated client can send a crafted `GRAPH_COMPUTE` request with node ID zero and crash `ggml-rpc-server` through a null dereference. | One fail-closed condition change, removal of a now-redundant null branch, and a loopback regression test that verifies both rejection and continued service. The crash was reproduced on current master and the normal multi-server test still passes. No human approval yet, but the scope is narrow and the package builds/installs RPC, so the denial-of-service reduction outweighs the low change risk. This does not make an Internet-exposed RPC server safe or authenticated. |
| [`rpc-graph-shape-validation-b10731.patch`](./rpc-graph-shape-validation-b10731.patch), based on [llama.cpp PR #26933](https://github.com/ggml-org/llama.cpp/pull/26933) at `04542c9` | Rejects RPC `SET_ROWS` and `GET_ROWS` graphs whose attacker-controlled shapes violate the public constructors' invariants, before backend execution. The reported consequences are an out-of-bounds write/selected-victim-buffer overwrite for `SET_ROWS` and out-of-bounds read/data disclosure for `GET_ROWS`. | Testing found the PR's two original comparisons bypassable, so the local no-fuzz patch mirrors the complete per-op shape/type/contiguity contract and adds regression coverage for the published cases and both ASan-confirmed bypasses. Valid constructor-built graphs still pass. The PR has no human review, and this does not validate every RPC op or authenticate RPC. Low code-scope risk; high value when RPC is enabled. |
| [`fdc1260`](https://github.com/Victor-Loos/llama.cpp/commit/fdc1260e99191717b0aa0a48117d4b758a24a513), from [llama.cpp PR #25863](https://github.com/ggml-org/llama.cpp/pull/25863) | Prevents direct computation on `ROCm_Host` buffers on integrated HIP GPUs while preserving pinned host allocation for staging. This avoids a scheduler write/read race seen on gfx1151. | Narrow backend capability change, independently reproduced, and approved by a HIP code owner. The PR is still open. Low change risk; high correctness and confidentiality value on an APU. |
| Series ending at [`861abb2`](https://github.com/ggml-org/llama.cpp/commit/861abb2b2e333744d565e07985de8f6f6feaff65), from [llama.cpp PR #26592](https://github.com/ggml-org/llama.cpp/pull/26592) | Enables CUB code paths on HIP through hipCUB for sorting, `TOP_K`, reductions, scans, and related operations. It enables them only with rocPRIM 4.4.0 or newer. | The current head only rebases the already-carried functional fix onto newer master. One approval remains alongside older unresolved change requests. rocPRIM 4.2 was proven unsafe; the version gate added in `527fcad` avoids that known path. Moderate backend/runtime risk. |
| [`c911e6b`](https://github.com/Aristo94/EngramHalo.cpp/commit/c911e6bb5eb956a759e740fb14db8ca639b7d3e7), plus [`qwen4exp-ple-row-prefetch-b10731.patch`](./qwen4exp-ple-row-prefetch-b10731.patch) | Tracks which tensors actually use b10731's lazy mapping, submits page-merged `WILLNEED` hints for selected PLE rows before graph execution, and adds a HIP/CUDA `GET_ROWS` path for 160-value IQ4_NL rows. | Fork-only and tested on one gfx1151 system. The small local shim only exposes b10731's created lazy tensors to the readahead code; it is byte-identical to the b10712 shim apart from its package filename. Lazy mode places the PLE on the CPU path, so the readahead is the SSD optimization while the GPU gather path mainly benefits non-lazy/resident placement. Readahead failure is non-fatal. |

The upstream native radix path and carried hipCUB patch are deliberately both
present:

- with `ROCPRIM_VERSION >= 400400`, the patch defines
  `GGML_CUDA_USE_CUB`. For `TOP_K`, a runtime without CCCL 3.2
  `DeviceTopK`—including the tested rocPRIM 4.6 nightly—uses bitonic argsort
  for small rows or hipCUB argsort for larger rows, then copies the first `k`
  indices;
- with older rocPRIM, hipCUB is not enabled and b10731's native HIP radix kernel
  keeps wide QSA `TOP_K` on the GPU. The native radix implementation is dormant
  whenever `GGML_CUDA_USE_CUB` is defined;
- without either change, Qwen3.8 QSA can fall back to the CPU once the row is
  wider than 1024, causing a sharp long-context slowdown.

The hipCUB patch is applied without its two upstream CI workflow edits and
without a test-file edit that only added commented stress-test examples. Runtime
code is not excluded. Package CI is not the same as llama.cpp upstream CI, and
the package builds with upstream tests disabled, as does `llama.cpp-gfx1151`.

Those filtered `git apply` calls set `GIT_CEILING_DIRECTORIES` to the makepkg
source directory. This is necessary in an AUR Git clone: the extracted source
is otherwise an untracked subdirectory of the parent checkout, and Git can
interpret `-C llama.cpp` as a repository subdirectory prefix and silently skip
every patch path. The ceiling makes the extracted tree the path root. A package
update is not considered prepared successfully unless the hipCUB include,
the reference GDN normalization helper, RPC invalid-node rejection,
recurrent-rollback fallback,
`lazy_tensors` tracking, row-prefetch methods, IQ4_NL gather changes, and the
upstream bounded sequence scan are all present after `makepkg -o`.

The CMake configure call uses the same Git ceiling and explicitly records the
short commit for the pinned upstream tag. Without both measures, llama.cpp's
build-info probe walks out of the source tarball into the enclosing AUR Git
checkout, and `llama-cli --version` misleadingly reports the package wrapper's
commit. The package records `build 10731, commit 0eadefe`; ggml's separate
source probe reports `unknown`, which is accurate for an extracted tarball.

### How the SSD-backed PLE patches fit together

Upstream b10731 provides the important mixed-load behavior itself. A tensor
marked lazy overrides the global load mode, gets a dedicated CPU context, and
is mapped even with `--load-mode none`. Dense tensors continue through their
ordinary non-mmap upload path. The package only adds row readahead on top:

| Stage | Package behavior |
| --- | --- |
| Mapping | The PLE remains an mmap alias of the GGUF on NVMe; it is not copied into a permanent 26.8 GiB RAM allocation. |
| Dense-weight load | With `-lm none`, other tensors use pinned staging buffers and asynchronous upload to their HIP buffers; they are not forced through the mmap path merely because the PLE is lazy. |
| PLE lookup | b10731 gathers a lazy tensor on the CPU. Before `GET_ROWS`, this package page-aligns and merges the selected row ranges and submits readahead hints so Linux can queue several NVMe reads in parallel. |

The PLE is still ordinary read-only model data. There is no background daemon,
private cache format, write-back, or model mutation. "SSD-backed" also does not
mean zero RAM use: Linux caches recently faulted PLE pages when memory is
available and can reclaim them under pressure. The resident amount therefore
depends on workload locality and memory pressure; the reported 1-1.5 GiB is an
observation, not a hard limit.

b10731 suppresses whole-file prefetch when the global mode is `none`; the lazy
ranges are brought in only on demand. It also excludes lazy ranges from bulk
prefetch when the global mode is `mmap`. Clean mapped pages remain reclaimable
under memory pressure.

### Why the old per-buffer mmap patch was removed

[llama.cpp PR #27837](https://github.com/ggml-org/llama.cpp/pull/27837) was
approved, merged, and has been present since b10705. It solves the reason this package carried
EngramHalo's `e5d8461` per-buffer mmap patch: dense weights no longer need the
global mmap mode to keep one lazy PLE tensor file-backed. Carrying both would
duplicate loader policy and the old patch no longer applies cleanly.

The recommended pair is therefore `-lm none -lzm on`. In the PR's direct-PCIe
test, that configuration kept the PLE on disk while matching a resident PLE's
prefill; another report found `none` about 15% faster than `mmap`. These are
individual systems, not guaranteed gfx1151 results, but the design is cleaner
and upstream-reviewed. This package retains only EngramHalo's batched row
readahead and the small b10731 bookkeeping hook.

### Why the integrated-GPU host-buffer patch matters

Strix Halo is reported as an integrated HIP GPU. In unpatched `b10731`, that
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

### Why the Qwen3.8 correctness follow-up matters

PR #27941 fixes paths that ordinary single-slot text tests do not exercise.
Before it, an OpenAI request using `n` could copy a sequence without copying
its QSA indexer keys, unified-KV blocks could combine cells belonging to
different sequence sets, and M-RoPE image tokens sharing one position could be
collapsed into the wrong pooled block. The same patch converts model-controlled
metadata assertions into load errors and reshapes the QSA selection launch so
the pooled-block count does not overflow `gridDim.y` near a 256K cache.

This package carries the MTP-adjusted copy that the published Strix branch
validated with arithmetic, tool use, and vision at 24K, plus the newer upstream
follow-ups. Those follow-ups keep the spare QSA block finite for sequences too
short to form a full pooled block and preserve all saved M-RoPE coordinates
when restoring the mirrored indexer cache. The upstream author reported
identical perplexity for the original rewrite, and no target or sidecar GGUF
reconversion is required. It is nevertheless a large QSA bookkeeping change;
short sequences, state save/restore, vision, `--np` above one, sequence copying,
and long context deserve explicit target-machine tests.

### Why native recurrent rollback matters for MTP

Speculative decoding asks the target to verify several proposed tokens, then
rolls back any rejected suffix. A transformer can trim its KV cache cheaply,
but Qwen4-Exp also carries recurrent DeltaNet and PLE convolution histories.
Before #28123, the generic safe path checkpointed the full recurrent state
through host memory before each speculative round. New #27836 measurements
showed that copy, rather than draft computation, dominating on several
backends; on gfx1151 Vulkan it reduced the MTP run to about 6.2 t/s.

#28123 teaches Qwen4-Exp to roll back natively. Each rollback slot snapshots
the small history needed by both the DeltaNet QKV convolution and the PLE
convolution, so a rejected suffix restores those histories without copying the
whole recurrent state. The reported gfx1151 Vulkan result was 43.6 t/s versus
32.4 t/s without drafting, but it remains a Vulkan result: HIP throughput and
long-run correctness still need the benchmark procedure below.

This does not make every state problem disappear. #28007 remains a generic
last-resort path: if a target or drafter still refuses the requested partial
rollback, the server clears both sequences and reprocesses the prompt instead
of aborting or continuing with stale memory. Persistent disk-slot state,
per-slot n-gram state, accepted tokens after EOG, and explicit cache reuse are
separate lifecycles covered in the watchlist and limitations.

### What is already upstream in b10731

The base tag already contains the merged Qwen3.8-Flash-Next implementation and
the important corrections made during its long review. They are not additional
package patches. These include synchronized QSA indexer/attention cache slots,
multi-stream QSA handling, indexer state save/restore, per-context PLE history
and sequence operations, correct short-history padding, dense fallback when a
compression ratio is absent, and related converter/quantization fixes.

The remaining HIP-specific performance problem identified after that merge was
wide QSA `TOP_K` falling back to the CPU. b10731 inherits the native HIP
radix fix from approved and merged
[PR #27466](https://github.com/ggml-org/llama.cpp/pull/27466); this package
therefore removed its byte-equivalent carried copy. The hipCUB patch above is
still selected on rocPRIM 4.4 or later. On the tested rocPRIM 4.6 stack it uses
the argsort-and-copy `TOP_K` branch because CCCL 3.2 `DeviceTopK` is absent;
the upstream native radix path remains the older-ROCm fallback. A separate
integrated-HIP host-buffer race was also
linked from the late discussion; the `fdc1260` patch addresses it without
changing the Qwen model implementation.

The tag contains the original lazy-read mechanism from
[PR #27794](https://github.com/ggml-org/llama.cpp/pull/27794) and its merged
loader redesign from [PR #27837](https://github.com/ggml-org/llama.cpp/pull/27837).
Qwen3.8's `per_layer_token_embd.weight` is architecture-marked. Lazy mode now
overrides global load mode for that tensor, uses a dedicated CPU context,
creates the required mapping even under `-lm none`, and ignores explicit tensor
buffer overrides for the lazy tensor. The command-line control was renamed by
[PR #27969](https://github.com/ggml-org/llama.cpp/pull/27969) to `-lzm` /
`--lazy-mode`; the environment name is now `LLAMA_ARG_LAZY_MODE`.

The base also includes the merged Qwen graph-split reduction from
[PR #27880](https://github.com/ggml-org/llama.cpp/pull/27880), lazy-mode support
in `llama-bench` from [PR #27881](https://github.com/ggml-org/llama.cpp/pull/27881),
the generic expert-count fast path from [PR #27978](https://github.com/ggml-org/llama.cpp/pull/27978),
and direct RDNA3 MMQ tuning from [PR #26284](https://github.com/ggml-org/llama.cpp/pull/26284).
That last change is directly relevant to gfx1151 and is inherited from the base
rather than duplicated as a package patch. A converter fix that avoids
materializing `LazyChunkedTensor` as a NumPy array is present as well.

b10712 introduced the bounded sequence scan from
[PR #28011](https://github.com/ggml-org/llama.cpp/pull/28011), so this package
removed its formerly carried copy. The change stops after finding every
sequence attached to a KV cell instead of always checking all 256 possible
IDs. Direct gfx1151 A/B results reported about +1.2% at 4K, +2.9% at 16K, and
+4.1% at 32K. The same base update brings
[PR #26500](https://github.com/ggml-org/llama.cpp/pull/26500), which prevents an
RPC server from serializing buffers owned by another server, and
[PR #28038](https://github.com/ggml-org/llama.cpp/pull/28038), which corrects an
allocation-size guard used by backends including HIP.

[PR #28032](https://github.com/ggml-org/llama.cpp/pull/28032) also landed in
b10712. Its Qwen3.8 wide-`TOP_K` implementation is Vulkan-only and therefore
does not replace the package's HIP radix/hipCUB patches. Its added backend
`TOP_K` cases are still valuable for validating the HIP paths on Strix Halo.
The remaining b10712 additions were upstream SWIGLU_CLAMP support, Metal tuning,
and a Hexagon fence fix; they required no package-specific adaptation.

b10729 additionally inherits
[PR #27991](https://github.com/ggml-org/llama.cpp/pull/27991), which batches
non-contiguous KV-state restore runs instead of issuing one copy per cell, and
the merged native HIP radix path above. The restore author measured a pathological
42,603-cell cache load falling from 25–63 seconds to 221–424 ms; this improves
state restore, not steady-state MTP decode. It also inherits the speculative
shared-source MoE fusion from
[PR #27621](https://github.com/ggml-org/llama.cpp/pull/27621). That CUDA/HIP
optimization is useful to speculative batches but has no isolated gfx1151
figure in its review, so the package makes no performance promise for it.

b10730 adds approved and merged
[PR #28023](https://github.com/ggml-org/llama.cpp/pull/28023), which sums QSA
indexer-head slices directly instead of materializing transpose, contiguous-copy,
and reduction nodes. Earlier reports showed up to about 9% prompt-processing
improvement, but the author's latest isolated Qwen4-Exp/DSV4 result was
effectively unchanged; treat it as an accepted graph simplification rather than
a promised gfx1151 speedup. The changed floating-point association can cause
tiny score differences and affect `TOP_K` only around near-ties; it is not a
memory-safety issue.

b10731 adds approved and merged
[PR #28123](https://github.com/ggml-org/llama.cpp/pull/28123), the native
Qwen4-Exp recurrent rollback described above. The live sibling was still b10729
during this sync, but the user explicitly authorized advancing this package to
the newest upstream build tag. These two changes are therefore inherited from
the archive, not separately fetched package patches.

### Safety scope of the patch review

The source review found no malicious payload, added runtime shell execution,
outbound runtime connection, credential handling, persistence, or model writes
in the eleven remotely sourced functional patch files or either local
adaptation. The RPC hardening patches necessarily change untrusted
network-input handling. Their two Python regressions launch the just-built RPC
server and use loopback only during tests; neither script is installed or run
by the packaged server. The PLE changes do
intentionally alter read-only GGUF mapping, readahead, and page-cache advice.
The important remaining risks are conventional native-code risks: incorrect
tensor-layout assumptions, an out-of-bounds GPU kernel bug, ROCm/hipCUB
incompatibility, excessive or ineffective readahead, numerical drift, or a
future upstream conflict.

RPC remains unauthenticated infrastructure intended for a trusted network.
The #25670 patch closes one proven crash, the local #26933-derived guard blocks
the two published unsafe row shapes and the two demonstrated bypass families,
and inherited #26500 improves cross-server buffer isolation. None is a general
security boundary or comprehensive validator for every graph op. Bind
`ggml-rpc-server` only to a protected interface and firewall it from untrusted
clients.

All 18 package sources passed their declared SHA-256 hashes, and the complete
stack applied to a clean `b10731` source tree without rejects or fuzzy hunks.
The clean Arch CPU build completed all 557 Ninja targets and passed 65/65
CTests with the Python Jinja dependency available; no Git-LFS fixture repair
was required. That set includes the normal multi-server RPC test, #25670's
invalid-node survival regression, the new row-shape validation regression,
recurrent rollback, fragmented state restore, thread safety, model-load
cancellation, and autorelease. The three focused RPC tests passed 3/3, and all
525 focused CPU `TOP_K` cases passed, including `k=2048`, `k=2051`, and very
wide rows.

A clean Arch Linux container also built and packaged this exact b10731 recipe
against `rocm-nightly-gfx1151-bin 10.1.0a20260901-1`: HIP 7.16.26346, AMD
Clang 24.0.0git, rocPRIM 4.6.0, and hipCUB 4.6.0. Its cache had HIP, graphs,
no-VMM, MFMA MMQ, forced MMQ, and all-quant Flash Attention enabled; Vulkan was
disabled and `gfx1151` was the only target. The 20,216,572-byte package has
SHA-256 `d0fff436dd82d2d3a8ad553464c82fc66d0aec7e2e819e57c97dfb69751a18b5`.
A fresh extraction contained 57 dynamic ELF objects with no unresolved
libraries, no Vulkan or NVIDIA dependency, and only base, CPU, HIP, and RPC
backends. LLVM found 181 HIP bundles and 181 matching host bundles; every HIP
bundle targeted only `amdgcn-amd-amdhsa--gfx1151`. `llama-cli` reported
`0.3.0-dev (build 10731, commit 0eadefe)`.

That nightly defines `GGML_CUDA_USE_CUB`, but hipCUB 4.6 lacks CCCL 3.2
`DeviceTopK`; the compiled `TOP_K` choice is therefore bitonic/hipCUB argsort
plus copy, not the native HIP radix branch. The builder exposed no `/dev/kfd`,
so these results prove compilation, packaging, linkage, and target selection—not
HIP kernel execution, graph capture, or performance.

For historical comparison, the previous b10712 package's clean Arch CPU build
completed all 556
Ninja build steps and passed 64/64 CTests, including recurrent rollback, fragmented state
restore, thread safety, model-load cancellation, autorelease, the inherited
two-RPC-server isolation test, and #25670's malformed-graph regression. Python
converter files compiled, and all 525 CPU `TOP_K` cases passed, including the
new b10712 shapes. Those CPU binaries reported `build 10712, commit daef7b6`.
The published sidecar bytes are unchanged, so its earlier structural inspection
remains applicable. The earlier 10-run `test-thread-safety` stress loop remains
evidence against the rejected drop-behind patch on b10688; it is not being
counted as a stress test of the current loader inherited since b10705.

A clean Arch Linux container also built and packaged the previous b10712
PKGBUILD against `rocm-nightly-gfx1151-bin 10.1.0a20260831-1`, HIP 7.16,
Clang 24.0.0, and rocPRIM 4.6, which activated the hipCUB path. Its CMake cache
had HIP enabled, Vulkan disabled, `GGML_HIP_NO_VMM=ON`, HIP graphs and MFMA
enabled, and `gfx1151` selected. LLVM offload-bundle inspection found only
`gfx1151` HIP device targets. A fresh extraction of the finished package had
57 dynamic ELF objects with no missing shared-library dependencies and no
Vulkan or CUDA/NVIDIA runtime dependency; `llama-cli` reported `build 10712,
commit daef7b6`. The builder had no GPU device, so this proves compilation,
packaging, and linkage—not kernel execution.

An earlier clean Arch build of the b10705-era HIP/PLE/QSA stack built,
packaged, installed, and linked against official ROCm 7.2.4 with Clang 22.0.0
and rocPRIM 4.2; its version gate kept the native radix fallback, and its cache
and device bundles passed the same backend checks. That historical run predates
the b10712 base changes, the newly carried #25670 RPC guard, and the then-later
#28068 normalization and #28007 rollback changes. An attempted official-SDK
rerun was stopped before compilation because its 30.6 GiB dependency expansion
would have exhausted the disposable builder's remaining disk. Do not interpret
the old result as a current-stack compile test with Clang 22.

There is one separate, inherited Web UI concern. b10731's package manifest,
lockfile, and npm configuration are byte-identical to b10705's. A fresh full
`npm audit` still reports Mermaid 11.15.0 advisories, including
[CSS injection](https://github.com/advisories/GHSA-6x64-9x62-f2gx), fixed in
11.16.1, plus a high-severity
[`nanoid` custom-generator denial of service](https://github.com/advisories/GHSA-2v37-7h3g-55p8),
fixed in 3.3.18. `nanoid` is transitive build tooling, while Mermaid is
lazy-loaded into the rendered Markdown UI, so model-generated diagram text
should still be treated as untrusted. This comes from the upstream/base UI,
not from a carried patch. Until the base lockfile updates, API-only deployments
can start `llama-server` with `--no-ui`; do not expose an unauthenticated server
to an untrusted network.

These are strong compile, package, and CPU checks, not an on-device safety
proof. The container host had no `/dev/kfd`, so real PLE I/O, GPU numerical
correctness, graph capture, concurrency, sustained generation, and VMM still
require testing on the 128 GiB Strix Halo machine.

## Build configuration

The important HIP options are:

```text
-DAMDGPU_TARGETS=gfx1151
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

`AMDGPU_TARGETS=gfx1151` mirrors the current sibling PKGBUILD. llama.cpp's HIP
CMake file forwards it to `CMAKE_HIP_ARCHITECTURES`, so the resulting package
still contains only gfx1151 device code.

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
[llama.cpp `b10731`](https://github.com/ggml-org/llama.cpp/blob/b10731/ggml/CMakeLists.txt#L218-L221).
This package spells it out so an upstream default change cannot silently alter
the allocator.

The sibling package's line showing `GGML_HIP_NO_VMM=OFF` remains commented out
and now notes that its maintainer has seen VMM work with a nightly. It therefore
still inherits upstream's no-VMM default today. This package pins that same
policy explicitly until an A/B test on the installed nightly shows a stable,
repeatable benefit.

The clean `10.1.0a20260901-1` nightly container build proves that the current
b10731 no-VMM package compiles and links with that stack. It does **not** show
that VMM is safe or faster: the test host exposed no `/dev/kfd`, so the
allocator could not be exercised. Do not flip the default solely because the
nightly build passed.

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
`hipblas`, `rocblas`, `hipcub`, `rocm-hip-sdk`, and the other ROCm component
names through `provides`, so it already satisfies this package's generic
runtime and build dependencies.

The exact b10731 package was compile-tested on 2026-09-01 with nightly
`10.1.0a20260901-1`: HIP 7.16.26346, AMD Clang 24.0.0git at compiler commit
`32fb458`, rocPRIM 4.6.0, and hipCUB 4.6.0. Its
1,963,679,628-byte `therock-dist-linux-gfx1151-10.1.0a20260901.tar.gz` payload
passed SHA-256
`f5ed5a7c92ad3aae7142fcc0becf57f6be00fe8b773e4e36c54b4ddcba1e3f4a`
and produced the expected `/opt/rocm` tree. The disposable builder unpacked
that payload without registering the monolithic AUR package in pacman's
database, so `makepkg` used `--nodeps`; this validates compilation against the
exact payload, not the provider metadata itself. The provider's declared
`provides` entries separately satisfy the generic dependencies above.
Nightlies are moving snapshots; this result does not automatically cover a
later date-stamped build.

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

### Packaged systemd service

The latest base package now installs matching sysusers and tmpfiles rules. The
unit runs as the unprivileged `llamacpp` user with `render` and `video` device
groups, no capabilities, a read-only system, protected home directories, and
writable state limited to `/var/lib/llama.cpp`, `/var/cache/llama.cpp`, and
`/run/llama.cpp`. `LLAMA_ARGS` is empty by default and an `ExecCondition`
prevents the server from starting until it is configured, so merely enabling
the unit does not publish an unauthenticated endpoint. This package inherits
the same service, config, system-user, and directory definitions as the base.

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

To inspect the actual device bundles rather than relying on embedded runtime
strings, locate ROCm's `llvm-objdump` and list the offload records:

```bash
llvm_objdump=$(find "$(hipconfig -R)" -path '*/bin/llvm-objdump' -print -quit)
"$llvm_objdump" --offloading /usr/lib/libggml-hip.so 2>&1 | \
  rg 'hip-amdgcn-amd-amdhsa--gfx' | sort -u
```

Every HIP entry should end in `--gfx1151`. Other architecture names can occur
as ordinary strings inside ROCm libraries, so `strings | rg gfx` is not a
reliable architecture audit.

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
TARGET_DIR="${HOME}/models/Qwen3.8-Flash-Next"
mkdir -p "${TARGET_DIR}"

HF_XET_HIGH_PERFORMANCE=1 hf download unsloth/Qwen3.8-Flash-Next-GGUF \
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

The pinned target revision predates the vision-projector upload. Text-only use
does not need a projector. For image input, download and verify the F16
projector separately from the reviewed newer revision:

```bash
VISION_REV=c8b5954a88c2775c546b92593eda40ea041d3176
VISION_FILE=mmproj-F16.gguf

HF_XET_HIGH_PERFORMANCE=1 hf download \
  unsloth/Qwen3.8-Flash-Next-GGUF \
  "${VISION_FILE}" \
  --revision "${VISION_REV}" \
  --local-dir "${TARGET_DIR}"

printf '%s  %s\n' \
  '1f7b7f0b984cf065c604360c29c8098362ed61b290db0ff12c6f360bb1a8a980' \
  "${TARGET_DIR}/${VISION_FILE}" | sha256sum -c -
```

The F16 projector is 904,004,000 bytes (0.84 GiB). The IQ4 target plus
projector downloads 88.09 GiB; adding the Q8_0 MTP sidecar brings the complete
text, vision, and MTP set to 91.95 GiB. The projector and MTP sidecar are
independent: `--mmproj` enables vision, while `-md` enables speculative decode.

This is the tuned, vision-capable single-slot starting command. It assumes the
F16 projector above and the Q8_0 sidecar documented below. Omit only the
`--mmproj` line for a text-only server:

```bash
ROCBLAS_USE_HIPBLASLT=1 \
llama-server \
  -m "${HOME}/models/Qwen3.8-Flash-Next/UD-IQ4_XS/Qwen3.8-Flash-Next-UD-IQ4_XS-00001-of-00003.gguf" \
  -md "${HOME}/models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf" \
  --mmproj "${HOME}/models/Qwen3.8-Flash-Next/mmproj-F16.gguf" \
  -ngl all \
  -fa on \
  -ctk q8_0 -ctv q8_0 \
  -lm none \
  -lzm on \
  -c 131072 \
  -b 8192 -ub 2048 \
  -t 4 \
  --np 1 \
  --jinja \
  --metrics \
  --spec-type draft-mtp,ngram-mod \
  --spec-draft-ngl all \
  --spec-draft-n-max 6 \
  --spec-draft-p-min 0.7 \
  --spec-ngram-mod-n-max 64 \
  --spec-ngram-mod-n-match 24
```

These interactive examples use `${HOME}/models`. The packaged systemd unit has
`ProtectHome=yes`, so it cannot use that path. For the service, place the files
under `/var/lib/llama.cpp` with ownership/read permissions for `llamacpp`, and
replace the model paths in `LLAMA_ARGS` accordingly.

This is a one-shot/throughput-oriented starting point, not a guarantee of fast
multi-turn slot reuse. Issue #28049 can leave accepted tokens after EOG inside
a hybrid model's server slot even though the client never sees them, forcing a
redundant re-prefill on the next turn. Client-side output truncation cannot
remove that hidden state. Until a server-side fix is reviewed, latency-sensitive
reused conversations should disable `draft-mtp` or clear/restart the affected
server-side slot state between turns.

Why these choices:

- `-lm none -lzm on` is the essential pair on b10731. `none` leaves dense
  weights on their normal asynchronous upload path, while explicit lazy mode
  still maps the architecture-marked PLE. `auto`, the default, also selects it
  because the tensor exceeds 4 GiB; spelling out `on` makes mistakes visible.
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
- The newest direct gfx1151 A/B found Q8_0 sidecar depth 6 with a 0.7
  probability floor faster than depth 3 on nearly every tested workload. Keep
  `draft-mtp,ngram-mod` for echo-heavy file rewrites; pure `draft-mtp` was 13%
  faster for a bugfix and for novel code at 24K because n-gram matches can
  displace higher-acceptance MTP drafts. The depth-2, floor-0 command later in
  this document remains the correctness-first baseline.
- `ROCBLAS_USE_HIPBLASLT=1` was enabled for the published ROCm measurements.
  Keep it only if the installed nightly supports it and an A/B run confirms a
  win; removing the variable is the fallback.

Avoid these combinations for the SSD-backed PLE profile:

- `-lm mmap+mlock` or `--mlock`: mapped model ranges become pinned and the OS
  cannot reclaim the intended memory saving;
- `-lm dio`: lazy tensor reads require mmap, and reported Strix runs showed
  direct-I/O host RSS ballooning;
- `-lm mmap` as the default: it still works, but it also chooses mmap for dense
  weights and can lose the asynchronous-upload advantage of `none`; keep it as
  an A/B comparison only;
- a broad CPU tensor override for the PLE: b10731 already forces lazy tensors
  into their dedicated CPU context and deliberately ignores such overrides.

`-lm none -lzm off` is the controlled resident-PLE comparison. The identical
global load mode makes the lazy-mode toggle, rather than an unrelated dense
loader change, the main difference.

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

On one published 96 GB Strix Halo system using the earlier per-buffer loader,
warm-cache SSD versus resident PLE cost about 5% in depth-0 prefill (468.1
versus 491.4 tokens/s), essentially nothing in ordinary decode (24.6 versus
24.7), and about 10% on a code-heavy MTP run (35.3 versus 39.3). b10731's
upstream loader has since matched resident prefill on one direct-PCIe system,
and one comparison found `-lm none` about 15% faster than `-lm mmap`. A cold or
low-locality workload still pays actual NVMe latency. The reward is roughly
26.8 GiB of reclaimable capacity and more context/application headroom.

One community report found `--lazy-mode on` hanging with native ROCm
7.2.4, `HSA_XNACK=1`, and `HSA_ENABLE_SDMA=0`; the EngramHalo author could not
reproduce it on a TheRock 7.14 stack. If a nightly hangs, first retry without
those environment overrides. Then use `--lazy-mode off` only as a
diagnostic, record the exact ROCm/rocPRIM versions and the last loader log, and
expect different peak-memory and first-prefill behavior. Do not silently keep
the fallback and assume the SSD-PLE path is still equivalent.

## Using the preconverted Q8_0 sidecar

The community sidecar is hosted at
[`drluoto/Qwen3.8-Flash-Next-MTP-GGUF`](https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF).
Use the immutable revision and verify the GGUF hash:

```bash
SIDECAR_REV=67de7592b670ef454a903574d5e2aa6c8e1d6b46
SIDECAR_FILE=mtp-Qwen3.8-Flash-Next-Q8_0.gguf
SIDECAR_DIR="${HOME}/models"
mkdir -p "${SIDECAR_DIR}"

HF_XET_HIGH_PERFORMANCE=1 hf download \
  drluoto/Qwen3.8-Flash-Next-MTP-GGUF \
  "${SIDECAR_FILE}" \
  --revision "${SIDECAR_REV}" \
  --local-dir "${SIDECAR_DIR}"

printf '%s  %s\n' \
  'b9880220df29fc224bbce408c867cd5d9c021263b754033ea624b669e374f4ec' \
  "${SIDECAR_DIR}/${SIDECAR_FILE}" | sha256sum -c -
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
  -m "${HOME}/models/Qwen3.8-Flash-Next-TARGET-00001-of-NNNNN.gguf" \
  -md "${HOME}/models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf" \
  --spec-type draft-mtp \
  --spec-draft-ngl all \
  --spec-draft-n-max 2 \
  --spec-draft-p-min 0 \
  -ngl all \
  -fa on \
  -ctk q8_0 -ctv q8_0 \
  -lm none \
  -lzm on \
  -c 32768 \
  --np 1 \
  --jinja \
  --metrics
```

Start with `--spec-draft-n-max 2`, then benchmark `3`, `4`, and `6`. Reports
across backends and workloads disagree on which is faster. For greedy decoding,
`--spec-draft-p-min 0` is a clear diagnostic baseline. Earlier long-depth Strix
measurements used `n-max 4` with `p-min 0.75`; the newer gfx1151 sweep found
`n-max 6` with `p-min 0.7` better on nearly every 8K/24K workload and adopted it
as the production default in the
[published gfx1151 sweep](https://github.com/ggml-org/llama.cpp/pull/27836#issuecomment-5463734527).
Depth 8 and above regressed in that sweep.

A newer Apple M5 report found depth 3 only marginal while depth 6 regressed and
showed deterministic greedy divergence. A dual-A6000 report likewise achieved
good acceptance while total throughput was roughly 2.2 times worse. The
discussion attributes much of the Apple cost to Metal small-batch kernel
coverage, so neither result predicts HIP performance. They are still useful
warnings: there is no backend-independent “best” draft depth, and coherent
output plus end-to-end latency matter more than draft acceptance alone.

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
- test draft depths 2, 3, 4, and 6, including both measured `4`/`0.75` and
  `6`/`0.7` candidates;
- compare F16 and Q8_0 target/draft KV caches using `-ctk`, `-ctv`, `-ctkd`,
  and `-ctvd`;
- compare SSD mode (`-lm none -lzm on`) with resident mode
  (`-lm none -lzm off`) only as a controlled memory/performance
  experiment; `mmap+mlock` and `dio` are not SSD-backed PLE configurations;
- measure the production context length and sampling settings, not only a short
  greedy prompt;
- keep `--spec-draft-backend-sampling` enabled unless isolating a regression.

RPC adds a synchronization hop to every draft step and has been a net loss in
published tests. Benchmark local HIP first.

### ROCm graph-capture troubleshooting

rocPRIM 4.2 was observed to segfault in the hipCUB path, so the pinned patch
enables hipCUB only with rocPRIM 4.4 or newer. That version gate does not prove
graph-capture safety: published ROCm 7.1 measurements still used
`GGML_CUDA_DISABLE_GRAPHS=1`, while the relevant capture guard was reported in
newer TheRock nightlies. When hipCUB is disabled at compile time, the inherited
native radix path keeps wide `TOP_K` on HIP.

If the installed nightly fails with `operation not permitted when stream is
capturing`, aborts inside rocPRIM, or hangs only with graphs enabled, test this
diagnostic workaround:

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
python - "${HOME}"/models/Qwen3.8-Flash-Next/UD-IQ4_XS/*.gguf \
  "${HOME}/models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf" <<'PY'
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
| D | `draft-mtp`, `--spec-draft-n-max 4 --spec-draft-p-min 0.75` | Earlier long-depth Strix candidate |
| E | `draft-mtp`, `--spec-draft-n-max 6 --spec-draft-p-min 0.7` | Newer gfx1151 production candidate |
| F | `draft-mtp,ngram-mod`, same settings as E | Workload-specific n-gram benefit or displacement |

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

Use naturally long code or prose rather than padding a prompt with repeated or
random-word filler. The EngramHalo measurements found that synthetic filler can
make generation degenerate into repetition, let the n-gram drafter approach
100% acceptance, and inflate reported decode speed by 2-3x. That is a benchmark
artifact, not an MTP improvement. Repeated requests also warm both the prompt
cache and n-gram history, so use fresh real prompts unless warm-repeat behavior
is the quantity being measured.

The correctness follow-up also needs coverage outside a single text sequence:

- send a vision request with a nontrivial image and inspect details across the
  full image, exercising M-RoPE cells that share a text position;
- repeat a deterministic request with OpenAI `n` greater than one and confirm
  every choice is coherent;
- run a separate `--np`-greater-than-one test with per-request nonces as
  described below;
- if 256K context is a goal, test close to that actual depth rather than
  extrapolating from 8K. The launch-shape fix removes a known 65,535-block
  limit, but does not prove that memory use and throughput are acceptable.

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

The prepared `b10731` source includes a dedicated speculative-decoding client at
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
  -m "${HOME}/models/Qwen3.8-Flash-Next-TARGET-00001-of-NNNNN.gguf" \
  --spec-type none \
  -ngl all -fa on -ctk q8_0 -ctv q8_0 \
  -lm none -lzm on \
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
-md "${HOME}/models/mtp-Qwen3.8-Flash-Next-Q8_0.gguf"
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

Repeat with draft depths 3, 4, and 6, both measured probability floors, and the
combined n-gram configuration. For a known long input length, repeat the client runs
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

## Upstream PR watchlist

These PRs and unresolved issues were reviewed through 2026-09-01 but are
intentionally not in the package. They remain interesting enough to revisit on
every base sync.

| PR or issue | Why it matters | Why it is not carried yet |
| --- | --- | --- |
| [#27977: Qwen3.8/QSA optimization umbrella](https://github.com/ggml-org/llama.cpp/pull/27977) | Its full five-change stack reported roughly +9% at 16K and +17% at 32K on gfx1151, and about +18% on one 24K MTP+n-gram file rewrite. | It is a draft whose author was asked to split the changes. The figures are for the combined stack, not every commit, and it now overlaps separate successor PRs. Carry reviewed splits instead of this umbrella. |
| [#27897: mixed external drafter plus MTP initialization](https://github.com/ggml-org/llama.cpp/pull/27897) | Fixes the draft-algorithm list when embedded `draft-mtp` is combined with `draft`, `draft-dflash`, or `draft-dspark` and `-md` selects an external drafter; its gfx1151 reproduction is fixed. | It is an unreviewed draft and does not affect the documented pure `draft-mtp` or `draft-mtp,ngram-mod` sidecar workflow. Carry it only if this package starts supporting a mixed external-drafter configuration. |
| [#27692: speculative prefill](https://github.com/ggml-org/llama.cpp/pull/27692) | Uses a small drafter to discard apparently unimportant prompt chunks before the target prefill. Strix Halo Vulkan reports claim roughly 2–2.3x lower time-to-first-token at moderate thresholds. | The pruning is intentionally lossy, the PR is 21 commits and roughly 3,300 added lines, and a new report says output stopped around 80K while the GPU kept working. Its MTP compatibility question is unanswered, prior draft-state bugs make it high risk, and there is no HIP result or approval. |
| [#27861: GPU-resident LRU MoE expert cache](https://github.com/ggml-org/llama.cpp/pull/27861) | Reports about 15–40% gains when selected experts would otherwise be CPU-offloaded to a discrete GPU. | `--fit` does not account for the cache; graph reallocation, in-flight upload, and shrink behavior remain unresolved; and the implementation bypasses every multi-token round, so MTP/speculative decode does not benefit. On a unified-memory Strix Halo with full GPU placement or SSD-backed PLE it may duplicate RAM without demonstrated gain. |
| [#27825: internal HIP AllReduce](https://github.com/ggml-org/llama.cpp/pull/27825) | Can improve exactly-two-GPU HIP inference when RCCL is disabled; one mixed-discrete-GPU test reported +15.9% prompt processing and +2.2% generation. | A single gfx1151 APU cannot benefit. There is no Strix Halo result, dual-R9700 testing with RCCL found no change, and the approximate sleep-based synchronization remains unapproved. Revisit only if this package later targets two local AMD GPUs; RPC across Strix nodes is a different path. |
| [#28040: logarithmic predecessor lookup](https://github.com/ggml-org/llama.cpp/pull/28040) | Reduces QSA predecessor lookup and reported NVIDIA decode gains from 74.5 to 77.6 t/s at 55K and 52.0 to 56.7 t/s at 132K. | It is still open and is an alternative to the earlier [#27992](https://github.com/ggml-org/llama.cpp/pull/27992), not a proven additive companion to #28011. The PR discussion reports that stacking both approaches can regress. Await review and gfx1151 isolation. |
| [#28128: flat QSA position scan](https://github.com/ggml-org/llama.cpp/pull/28128) | Replaces ordered-set predecessor lookup with a flat scan; a dual-A6000 130K result rose from 17.0 to 19.7 t/s. | It is an unreviewed draft with no gfx1151 isolation and is another alternative to #28040/#27992, not an established additive change. Its low-utilization trade-off needs review. |
| [#28130: sparse QSA gather](https://github.com/ggml-org/llama.cpp/pull/28130) / [Unsloth successor #165](https://github.com/unslothai/llama.cpp/pull/165) | Sparse gather was reported +41–45% at 129.6K on dual A6000 and about +75% when stacked with adjacent work. | Upstream #28130 was closed by a contributor-limit bot rather than technical review. The successor is broad, unreviewed, complex indexing code with no HIP/gfx1151 result or accepted provenance yet. |
| [#28055: remove Linux `MAP_POPULATE`](https://github.com/ggml-org/llama.cpp/pull/28055) | Could reduce blocking and unnecessary page-cache pressure during ordinary mmap loads. It supersedes the narrower, now-closed [#27928](https://github.com/ggml-org/llama.cpp/pull/27928). | It changes loader policy globally and lacks controlled model-level evidence for this mixed lazy/non-mmap profile. b10731 already avoids whole-model mmap in the recommended configuration. Its latest force-push is a patch-identical rebase, not new evidence. |
| [#28136: direct `pread` lazy PLE](https://github.com/ggml-org/llama.cpp/pull/28136) | Adds `--lazy-mode on-direct`, deduplicates/sorts PLE rows, and reads them in parallel. On one DGX Spark, cold diverse prompts rose from roughly 218–360 to 542–741 tokens/s and approached a 750–800 warm cache. | This is the highest-priority SSD-PLE experiment to watch, but it is 434 unreviewed lines, has no gfx1151 result, conflicts with this package's mmap/readahead path, reopens a path after validation, and needs stronger short-read/error, file-lifetime, multi-shard, alignment, thread-count, and path-race analysis. |
| [#28058: synchronize asynchronous graph inputs](https://github.com/ggml-org/llama.cpp/pull/28058) | Directly targets cross-request KV contamination on integrated GPUs; its first commit unconditionally synchronizes before graph-input mutation. A second commit now rejects impossible mid-range recurrent erases and disables `--cache-reuse` for memories that cannot perform them. If validated, the synchronization fix could replace the conservative #25863 host-buffer capability workaround. | It is a brand-new draft with no human review, and it currently bundles two logically separate fixes. Because the failure can cross request boundaries, it is security-relevant; do not replace a reproduced workaround until the commits are split or reviewed and HIP/gfx1151 concurrency, chunked-prompt, recurrent, and cache-reuse tests pass. |
| [#28061: avoid speculative replay livelock](https://github.com/ggml-org/llama.cpp/pull/28061) / [issue #28060](https://github.com/ggml-org/llama.cpp/issues/28060) | Prevents replayed accepted draft tokens from being verified a second time after checkpoint restore, avoiding a batch-shape-dependent speculative loop. | The PR was closed on 2026-08-31 because the submitter had not obtained the original author's permission, not because the diagnosis was disproved. The reproduction is Strix Halo Vulkan, not HIP, and the patch had no human technical review. Track issue #28060 for an authorized successor or a HIP reproduction. |
| [#28104: alternative Qwen4-Exp MTP port](https://github.com/ggml-org/llama.cpp/pull/28104) | Bundles replay handling, output gathering, and an on-device checkpoint experiment; one gfx1151 Vulkan 70K report claimed about +50%. | The draft is explicitly held for original-author permission. Its checkpoint work is superseded for Qwen4-Exp by merged #28123, and its other changes overlap this package's carried MTP stack. |
| [Issue #28049: accepted tokens after EOG](https://github.com/ggml-org/llama.cpp/issues/28049) | On a hybrid model, MTP tokens accepted after the first end-of-generation token can remain in the slot and force the previous answer to be prefetched again on reuse. A proposed internal truncation reportedly survived 19 generation rounds and 13 reuse runs. | This is separate from #28060/#28061. There is no owned PR, review, or broader recurrent and cache-reuse validation, so there is no immutable patch to carry yet. The extra tokens are hidden from the client, so application-side output truncation cannot fix server state. Disable MTP for affected reused conversations, clear/restart the server-side slot between turns, or accept the redundant prefill while awaiting an upstream fix. |
| [Issue #27852: stale per-slot draft state](https://github.com/ggml-org/llama.cpp/issues/27852) | Reports stale n-gram and analogous MTP draft state surviving slot reuse; an explicit reset changed one affected run from 16 to 87 t/s. | There is no upstream patch or complete lifecycle test. Reset/restart affected slots and benchmark multi-turn reuse; #28123 fixes recurrent rollback cost, not every per-slot drafter container. |
| [Issue #28139: empty-slot cache bypass](https://github.com/ggml-org/llama.cpp/issues/28139) | Selecting an empty `id_slot` can compute a 0/0 similarity, produce NaN, and skip an otherwise usable RAM prompt-cache entry. | It has no patch yet and primarily affects cache latency rather than model correctness. Track an owned fix and tests for empty, explicit, and automatic slot selection. |
| [#28039: redistribute oversized CUDA/HIP norm grids](https://github.com/ggml-org/llama.cpp/pull/28039) | Prevents a 65,536-grid-axis launch failure reported at an actual 262,144-token Qwen3.8 context; the author reports 156/156 norm tests and a successful model run. | This matters only near the extreme context limit, has no gfx1151 result, and still has unresolved review feedback. Its shared normalization-kernel launch change is not justified for ordinary 32K use until review settles. |
| [#26004: persist recurrent checkpoints in slot files](https://github.com/ggml-org/llama.cpp/pull/26004) | Allows hybrid-recurrent state restored from disk to resume from a checkpoint. A gfx1151 Vulkan report reduced first restore from 181.9 to 4.7 seconds. | It is an unreviewed roughly 195-line state-format change with corrupt/mismatched-file, restart, MTP-sidecar, multi-slot, multimodal, and version-compatibility surface. Closed #28074 was a narrower duplicate. This affects restore, not steady-state decode. |
| [#28092: persistent disk prompt cache](https://github.com/ggml-org/llama.cpp/pull/28092) | Adds `--cache-disk` so prompt state can survive RAM pressure and server restarts. | At roughly 1,599 new lines it is a large, unreviewed parser/file-format and state-lifetime security surface. Require format limits, corruption/fuzz, path/permission, atomic-write, compatibility, recurrent, MTP, and multi-slot review before packaging it. |
| [#28075: assign view-backed output ops to a compatible backend](https://github.com/ggml-org/llama.cpp/pull/28075) | Changes common scheduler placement when an op writes through a tensor view; the author says it lets Qwen4exp and three other previously skipped architectures pass `test-llama-archs` on WebGPU. | The force-pushed head remains a draft for WebGPU CI. It adds no focused HIP regression and provides no gfx1151 result while changing shared scheduler behavior for every backend. Keep it on watch until the failure is isolated, review settles, and HIP multi-backend/RPC and view-backed-output tests pass. |
| [#28097: alternate Unsloth MTP sidecar layout](https://github.com/ggml-org/llama.cpp/pull/28097) | Loads a different head-only layout without trunk or mixer tensors and includes a speculative-model path cleanup. | It is an unreviewed CPU-only draft, conflicts with the carried `a82a58a`/drluoto layout, and has no conversion/interoperability decision. The apparent path fix is not needed by current in-tree callers: both first convert base parameters to draft parameters. |
| [#28099: missing `block_count` guard](https://github.com/ggml-org/llama.cpp/pull/28099) | Fails cleanly instead of aborting when a malformed GGUF omits architecture block count. | The small fail-closed change looks reasonable, but it prevents a local model-load denial of service rather than a remote package threat and has no review or regression test. Prefer upstream acceptance. |
| [#28109: Gated DeltaNet batch-invariance test](https://github.com/ggml-org/llama.cpp/pull/28109) | Adds a regression that checks recurrent output is invariant to batch partitioning. | It is draft, CUDA-only test work and changes no runtime source. Use it as a future HIP validation reference rather than a package patch. |
| [#28117: keep draft KV on GPU](https://github.com/ggml-org/llama.cpp/pull/28117) | Separately offloads the drafter KV even when the target uses `--no-kv-offload`; RTX 5090 reports rose from 19.2 to 27.2 t/s at 65K and 13.3 to 21.1 at 123K. | It silently changes an explicit memory-placement policy and can OOM constrained systems. There is no review or HIP/unified-memory result. It needs an explicit drafter option and memory accounting. |
| [#28118: on-device recurrent checkpoints](https://github.com/ggml-org/llama.cpp/pull/28118) | Avoids copying full recurrent checkpoints through host memory and helps recurrent architectures without native rollback. | It is an unapproved draft, can hard-abort on fragmented recurrent ranges, and is superseded for Qwen4-Exp by merged #28123. Keep it as fallback research for other architectures only. |
| [#28146: fail cleanly on multimodal allocation errors](https://github.com/ggml-org/llama.cpp/pull/28146) | Propagates CLIP scheduler reserve/allocation failure instead of continuing into a later crash while encoding an image. | This backend-generic Qwen vision hardening is only 13 changed lines, but it is a new draft with no human review, focused regression, or HIP reproduction. Retry behavior after a failed reserve is also untested. It improves local OOM behavior rather than MTP/PLE performance; await upstream tests and review. |
| [#28003: RDNA3 MMVQ single-token fast path](https://github.com/ggml-org/llama.cpp/pull/28003) | Reports about 9.1% lower Q4_K GEMV time on gfx1100/RX 7900. | It is an unreviewed draft demonstrated on gfx1100 and Q4_K, not gfx1151 with the recommended UD-IQ4_XS mix. Architecture-specific kernel changes need direct validation. |
| [#28013: improve CUDA/HIP `IM2COL` access](https://github.com/ggml-org/llama.cpp/pull/28013) | Reads adjacent channels in one block and could speed the vision projector; its MI100 correctness run passed 92/92 cases and several gfx908/gfx1100 shapes improved. | The reported shape results are mixed, including regressions, and there is no gfx1151 or end-to-end Qwen3.8 vision result. Keep vision correctness more important than an unisolated micro-optimization. |
| [#27870: remove a divergent F16 Flash Attention barrier](https://github.com/ggml-org/llama.cpp/pull/27870) | Fixes a `__syncthreads()` reached by only part of a block in the shared CUDA/HIP F16 `FLASH_ATTN_EXT` kernel. CUDA compute-sanitizer reportedly fell from 3,232 errors to zero with effectively unchanged Qwen3.8-27B 100K speed. | This is a strong correctness candidate, but it has no review and all submitted validation is CUDA. The shared source also compiles for HIP, so require gfx1151 Flash Attention correctness, sanitizer where available, and sustained-runtime results before changing this package's `-fa on` path. |
| [#24546: routed-MoE MMQ width selection](https://github.com/ggml-org/llama.cpp/pull/24546) | New multi-GPU gfx1100/gfx1101 evidence reports roughly 39–42% prompt-processing gains by sizing RDNA3 tiles from typical expert width, with no token-generation regression. | A code owner has approved it, but the direct single-gfx1151 production-`ub 2048` result remained inside roughly 2% noise and was reverted. Await an isolated post-#26284 gfx1151 result before adding another architecture-specific kernel policy. |
| [#25952: fused MoE weighted reduction](https://github.com/ggml-org/llama.cpp/pull/25952) | Shared CUDA/HIP work reports about +6.6–7.4% GB10 prompt-processing improvement. | A formal change request remains after the latest rebase, which removed scratch allocation and registered dependencies. There is no gfx1151 measurement; await resolution and direct HIP testing. |
| [#27962: HIP IQ2/IQ3 SWAR intrinsics](https://github.com/ggml-org/llama.cpp/pull/27962) | Fixes the fallback `__vsub4` implementation and reports Qwen3.8 IQ3_S decode rising from 27.11 to 32.97 t/s on gfx1201. | These intrinsics serve IQ2/IQ3 only, so they do not affect the recommended UD-IQ4_XS target or Q8_0 draft. There is no gfx1151 result or approval yet; revisit if IQ3 becomes a supported recommendation or the fix merges. |
| [#27936: narrower hipCUB SUM/MEAN path](https://github.com/ggml-org/llama.cpp/pull/27936) | Reports 8.8x and 10.4x gfx1151 reduction microbench gains and is a smaller upstreamable subset of the broad hipCUB work. | The package's #26592 series already contains equivalent reduction routing, so applying both would conflict or duplicate code. Prefer this narrower successor when it merges and then shrink the carried #26592 patch. |
| [#28129: batch CCCL `DeviceTopK` calls](https://github.com/ggml-org/llama.cpp/pull/28129) | Routes prompt-sized batches to row-parallel argsort instead of serial per-row `DeviceTopK`; dual-A6000 Qwen3.8 prefill improved about 20–27% at 31K–130K. | The author self-closed it without technical review shortly after automated contribution-policy warnings; the same work remains bundled in [Unsloth #165](https://github.com/unslothai/llama.cpp/pull/165). The tested hipCUB 4.6 stack has no CCCL 3.2 `DeviceTopK`, so this package already compiles the argsort-and-copy branch and the patch is currently a no-op. Revisit an owned successor when a future ROCm stack exposes `DeviceTopK`. |
| [#27196: speculative logprobs correctness](https://github.com/ggml-org/llama.cpp/pull/27196) | Aligns speculative-server logprobs with the actually accepted target tokens. | It matters only when clients consume logprobs, remains unmerged, and has no MTP/gfx1151 validation. Track it as API correctness work rather than a performance patch. |
| [#28030: YaRN context autoscaling](https://github.com/ggml-org/llama.cpp/pull/28030) | Automatically scales YaRN when requested context exceeds the training context. | It is peripheral to MTP/PLE and changes model-quality semantics for manual context extension. Await review and architecture-specific perplexity/output testing. |

The carried-patch table is the source of truth for changes that crossed the
inclusion threshold. Approved and merged #28023 and #28123 are inherited by the
authorized b10731 version bump, so they add no package patch or separate remote
source. The RPC graph-shape guard is a local hardening based on #26933 and is
described with its narrower security scope there. The frozen #27941 functional
subset was deliberately not updated to the force-pushed test-exception tip.

Six previously watched items are now inherited. The lazy-loader follow-up
[#27837](https://github.com/ggml-org/llama.cpp/pull/27837) is approved, merged,
and has been in the baseline since b10705; it removed the need for the package's
per-buffer mmap patch. [#28011](https://github.com/ggml-org/llama.cpp/pull/28011)
is merged into b10712, so the formerly carried copy has been removed. Its
isolated gfx1151 improvement—about +1.2% at 4K, +2.9% at 16K, and +4.1% at
32K—is smaller than #27977's combined figures, which is exactly why the two
sets of numbers must not be compared as if they represented the same patch.
b10729 now also inherits #27466's native HIP radix path and #27991's batched
non-contiguous KV restore; both were therefore removed from the carried/watch
lists. b10730 and b10731 then add #28023 and #28123 respectively.

For historical clarity, [#27928](https://github.com/ggml-org/llama.cpp/pull/27928)
closed in favor of #28055, and [#27974](https://github.com/ggml-org/llama.cpp/pull/27974)
and [#27874](https://github.com/ggml-org/llama.cpp/pull/27874) are narrower or
closed hipCUB approaches already superseded by the broader
[#26592](https://github.com/ggml-org/llama.cpp/pull/26592).

The final scan covered upstream through #28146 and master b10731. It excluded
Metal-, Vulkan-, CUDA-SM120-, WebGPU-, SVE-, Nix-, container-, and
unrelated-model-only work. In particular, unfinished gfx1201-only rocWMMA
#28102 does not target gfx1151 and this package disables that path; #28131 only
hardens `gguf-py`, which this package does not install. Closed #28120 is
superseded by #28123. The only package-adjacent additions after the prior
#28139 cutoff, #28146 and closed #28129, are documented above. The scan also
rejected
[halo-box PR #8](https://github.com/halo-box/llama.cpp/pull/8): that fork's
`--ngram-on-disk` implementation has a separate gather path with
double-offset and null-`rows` bugs, while this package uses upstream lazy
tensors and preserves the I32 row-index input.

### Rejected load-time drop-behind patch

This package intentionally does **not** carry EngramHalo.cpp commit
[`5486559`](https://github.com/Aristo94/EngramHalo.cpp/commit/5486559c0eb59ca0f8bbacf785c5f4a1ee4294c6),
which unmaps copied dense-tensor ranges and asks the kernel to discard their
clean file-cache pages. It can lower peak pressure while a model loads, but it
failed the package safety audit.

On the earlier b10688 patch stack, llama.cpp's `test-thread-safety` loaded two
model objects with four contexts each. With the drop-behind patch it
segfaulted in 10 of 10 runs at its default mode and in 3 of 3 runs with
unmapping alone; with both behaviors disabled it passed 10 of 10 runs. Code
review suggests that one tensor can cause a source range to be unmapped while
a tied or duplicated tensor in another buffer context still aliases that
range. That explanation is an inference, but the repeatable test failure is
enough to reject the patch in a general llama.cpp package.

b10731 makes this experimental cleanup even less attractive: `-lm none` does
not map or populate the dense model at all, while the lazy PLE keeps its normal
mapping lifetime. Clean pages in that mapping remain reclaimable. The package
therefore accepts a potentially higher transient/warm-cache footprint instead
of adding unsafe range-lifetime logic.

## Known limitations and rollback

- All eleven remotely sourced functional patches are snapshots. Recheck their
  upstream PRs and fork commits when updating the llama.cpp tag; remove a
  package patch once an equivalent fix is upstream. Revalidate both local
  adaptations against the exact new base rather than allowing fuzzy patching.
- The MTP graph currently uses dense attention in the draft block. Draft cost
  therefore grows with context even though the target's QSA is sparse.
- Native recurrent rollback allocates and constructs `n_rs_seq + 1` state
  planes. Ordinary draft depths are small, but an absurd local
  `--spec-draft-n-max` can still exhaust memory; it is not remotely selected.
- Upstream issue #28049 reports that draft tokens accepted after the first EOG
  can survive in a hybrid slot and trigger a redundant re-prefill on reuse.
  They are not returned to the client, so client-side truncation cannot repair
  the slot. Until an owned fix is reviewed, disable MTP for affected reused
  conversations or clear/restart server-side slot state between turns, and test
  repeated slot reuse explicitly.
- Issue #27852 describes stale per-slot n-gram and MTP draft state that can
  survive reuse and collapse performance. Native recurrent rollback does not
  prove every drafter-owned cache is reset; include repeated slot reuse and
  explicit reset/restart comparisons in production validation.
- The detached loader recognizes the sidecar by missing trunk tensors. Only use
  sidecars from a trusted/pinned source with the expected metadata.
- The integrated-HIP host-buffer change is a conservative capability workaround,
  not the general scheduler synchronization fix. Retest chunked prompts and
  nonce-isolated concurrent requests after upstream scheduler changes.
- The two RPC guards cover specific invalid nodes and row-operation shape
  families; they are not authentication, authorization, bounds validation for
  every graph op, or a reason to expose RPC outside a protected network.
- New rocPRIM versions take a broader hipCUB path than old versions. Re-run
  `TOP_K`, `ARGSORT`, reduction, scan, graph, and long-generation tests after a
  nightly upgrade.
- PLE row readahead is fork work with no upstream review. The b10731 lazy loader
  itself is upstream, and the local shim only records created lazy tensors, but
  cold load, warm reload, cancellation, and a non-Qwen lazy model still deserve
  re-testing after every rebase.
- `GGML_HIP_NO_VMM=ON` is a reversible stability policy, not a claim that VMM
  can never work on Strix Halo.

The simplest runtime rollback is to omit `-md` and use `--spec-type none`. The
package then runs the ordinary target path while retaining the QSA GPU fixes.
That does not disable SSD-backed PLE. Use `-lm none -lzm off` for
a resident-PLE comparison. For a full source rollback, remove the added patch
sources and their `prepare()` applications, restore the sibling package's
dependencies/options, and increment `pkgrel`.

## Primary references

- [Qwen3.8-Flash-Next support, llama.cpp PR #27742](https://github.com/ggml-org/llama.cpp/pull/27742)
- [Qwen3.8 NextN/MTP, llama.cpp PR #27836](https://github.com/ggml-org/llama.cpp/pull/27836)
- [Working Strix Halo combination and sidecar comment](https://github.com/ggml-org/llama.cpp/pull/27836#issuecomment-5460955631)
- [Newer gfx1151 MTP depth and drafter sweep](https://github.com/ggml-org/llama.cpp/pull/27836#issuecomment-5463734527)
- [Qwen3.8 QSA, vision, metadata, and 256K correctness follow-up, llama.cpp PR #27941](https://github.com/ggml-org/llama.cpp/pull/27941)
- [Merged direct QSA indexer-head summation, llama.cpp PR #28023](https://github.com/ggml-org/llama.cpp/pull/28023)
- [Merged native Qwen4-Exp recurrent rollback, llama.cpp PR #28123](https://github.com/ggml-org/llama.cpp/pull/28123)
- [Reference GDN q/k normalization, llama.cpp PR #28068](https://github.com/ggml-org/llama.cpp/pull/28068)
- [Safe recurrent-memory rollback fallback, llama.cpp PR #28007](https://github.com/ggml-org/llama.cpp/pull/28007)
- [RPC invalid-graph-node denial-of-service fix, llama.cpp PR #25670](https://github.com/ggml-org/llama.cpp/pull/25670)
- [RPC row-operation graph-shape hardening basis, llama.cpp PR #26933](https://github.com/ggml-org/llama.cpp/pull/26933)
- [Integrated HIP host-buffer safety fix, llama.cpp PR #25863](https://github.com/ggml-org/llama.cpp/pull/25863)
- [Cross-request replay report on gfx1151, llama.cpp issue #25992](https://github.com/ggml-org/llama.cpp/issues/25992)
- [Qwen3.8 multi-segment corruption report on gfx1151, llama.cpp issue #27797](https://github.com/ggml-org/llama.cpp/issues/27797)
- [Native HIP wide radix `TOP_K`, llama.cpp PR #27466](https://github.com/ggml-org/llama.cpp/pull/27466)
- [hipCUB on HIP, llama.cpp PR #26592](https://github.com/ggml-org/llama.cpp/pull/26592)
- [Upstream lazy tensor reads, llama.cpp PR #27794](https://github.com/ggml-org/llama.cpp/pull/27794)
- [Qwen3.8 graph-split reduction, llama.cpp PR #27880](https://github.com/ggml-org/llama.cpp/pull/27880)
- [`llama-bench` lazy-mode support, llama.cpp PR #27881](https://github.com/ggml-org/llama.cpp/pull/27881)
- [Merged lazy-loader redesign, llama.cpp PR #27837](https://github.com/ggml-org/llama.cpp/pull/27837)
- [Lazy-mode CLI rename, llama.cpp PR #27969](https://github.com/ggml-org/llama.cpp/pull/27969)
- [Merged bounded sequence scan, llama.cpp PR #28011](https://github.com/ggml-org/llama.cpp/pull/28011)
- [Merged cross-RPC-server buffer isolation, llama.cpp PR #26500](https://github.com/ggml-org/llama.cpp/pull/26500)
- [Merged Vulkan Qwen3.8 `TOP_K` and backend tests, llama.cpp PR #28032](https://github.com/ggml-org/llama.cpp/pull/28032)
- [Draft Qwen/QSA optimization umbrella, llama.cpp PR #27977](https://github.com/ggml-org/llama.cpp/pull/27977)
- [Draft mixed external-drafter plus MTP initialization, llama.cpp PR #27897](https://github.com/ggml-org/llama.cpp/pull/27897)
- [Open speculative prefill, llama.cpp PR #27692](https://github.com/ggml-org/llama.cpp/pull/27692)
- [Draft GPU-resident MoE expert cache, llama.cpp PR #27861](https://github.com/ggml-org/llama.cpp/pull/27861)
- [Open internal HIP AllReduce, llama.cpp PR #27825](https://github.com/ggml-org/llama.cpp/pull/27825)
- [Open logarithmic predecessor lookup, llama.cpp PR #28040](https://github.com/ggml-org/llama.cpp/pull/28040)
- [Draft flat QSA position scan, llama.cpp PR #28128](https://github.com/ggml-org/llama.cpp/pull/28128)
- [Sparse QSA gather successor, Unsloth llama.cpp PR #165](https://github.com/unslothai/llama.cpp/pull/165)
- [Open Linux `MAP_POPULATE` removal, llama.cpp PR #28055](https://github.com/ggml-org/llama.cpp/pull/28055)
- [Open direct-read SSD PLE, llama.cpp PR #28136](https://github.com/ggml-org/llama.cpp/pull/28136)
- [Draft asynchronous graph-input synchronization, llama.cpp PR #28058](https://github.com/ggml-org/llama.cpp/pull/28058)
- [Closed speculative replay-livelock proposal, llama.cpp PR #28061](https://github.com/ggml-org/llama.cpp/pull/28061)
- [Speculative checkpoint-replay livelock, llama.cpp issue #28060](https://github.com/ggml-org/llama.cpp/issues/28060)
- [Draft alternative Qwen4-Exp MTP port, llama.cpp PR #28104](https://github.com/ggml-org/llama.cpp/pull/28104)
- [Accepted MTP tokens after EOG, llama.cpp issue #28049](https://github.com/ggml-org/llama.cpp/issues/28049)
- [Stale per-slot draft state, llama.cpp issue #27852](https://github.com/ggml-org/llama.cpp/issues/27852)
- [Empty explicit-slot prompt-cache bypass, llama.cpp issue #28139](https://github.com/ggml-org/llama.cpp/issues/28139)
- [Open oversized CUDA/HIP norm-grid fix, llama.cpp PR #28039](https://github.com/ggml-org/llama.cpp/pull/28039)
- [Merged batched non-contiguous KV restore, llama.cpp PR #27991](https://github.com/ggml-org/llama.cpp/pull/27991)
- [Open persistent recurrent disk-slot checkpoints, llama.cpp PR #26004](https://github.com/ggml-org/llama.cpp/pull/26004)
- [Open persistent disk prompt cache, llama.cpp PR #28092](https://github.com/ggml-org/llama.cpp/pull/28092)
- [Draft view-backed-output scheduler assignment, llama.cpp PR #28075](https://github.com/ggml-org/llama.cpp/pull/28075)
- [Draft alternate Unsloth MTP sidecar layout, llama.cpp PR #28097](https://github.com/ggml-org/llama.cpp/pull/28097)
- [Malformed-GGUF block-count guard, llama.cpp PR #28099](https://github.com/ggml-org/llama.cpp/pull/28099)
- [Draft recurrent batch-invariance test, llama.cpp PR #28109](https://github.com/ggml-org/llama.cpp/pull/28109)
- [Open separate draft-KV offload, llama.cpp PR #28117](https://github.com/ggml-org/llama.cpp/pull/28117)
- [Draft on-device recurrent checkpoints, llama.cpp PR #28118](https://github.com/ggml-org/llama.cpp/pull/28118)
- [Draft multimodal allocation-error handling, llama.cpp PR #28146](https://github.com/ggml-org/llama.cpp/pull/28146)
- [Draft RDNA3 MMVQ fast path, llama.cpp PR #28003](https://github.com/ggml-org/llama.cpp/pull/28003)
- [Open CUDA/HIP `IM2COL` access rewrite, llama.cpp PR #28013](https://github.com/ggml-org/llama.cpp/pull/28013)
- [Open divergent F16 Flash Attention barrier fix, llama.cpp PR #27870](https://github.com/ggml-org/llama.cpp/pull/27870)
- [Open routed-MoE MMQ width selection, llama.cpp PR #24546](https://github.com/ggml-org/llama.cpp/pull/24546)
- [Open fused MoE weighted reduction, llama.cpp PR #25952](https://github.com/ggml-org/llama.cpp/pull/25952)
- [Open HIP IQ2/IQ3 SWAR intrinsics, llama.cpp PR #27962](https://github.com/ggml-org/llama.cpp/pull/27962)
- [Open narrower hipCUB reductions, llama.cpp PR #27936](https://github.com/ggml-org/llama.cpp/pull/27936)
- [Closed batched `DeviceTopK` dispatch, llama.cpp PR #28129](https://github.com/ggml-org/llama.cpp/pull/28129)
- [Open speculative-logprobs correctness, llama.cpp PR #27196](https://github.com/ggml-org/llama.cpp/pull/27196)
- [Open YaRN context autoscaling, llama.cpp PR #28030](https://github.com/ggml-org/llama.cpp/pull/28030)
- [Closed global mmap-prefetch proposal, llama.cpp PR #27928](https://github.com/ggml-org/llama.cpp/pull/27928)
- [Per-tensor mmap feature request, llama.cpp issue #27766](https://github.com/ggml-org/llama.cpp/issues/27766)
- [Qwen PLE SSD-offload discussion](https://github.com/ggml-org/llama.cpp/discussions/27864)
- [EngramHalo.cpp Strix Halo tuning guide](https://github.com/Aristo94/EngramHalo.cpp/blob/e5d8461c128a215df2140eed5adf1b68e7d29b56/docs/strix-halo/README.md)
- [EngramHalo depth curves and synthetic-prompt warning](https://github.com/Aristo94/EngramHalo.cpp/commit/e4e0df920ea9644edb6143c5c011b57b558ec096)
- [PLE row readahead and IQ4_NL `GET_ROWS`](https://github.com/Aristo94/EngramHalo.cpp/commit/c911e6bb5eb956a759e740fb14db8ca639b7d3e7)
- [Related Unsloth batched-readahead PR](https://github.com/unslothai/llama.cpp/pull/137)
- [Audited and rejected UMA load-time page-cache drop-behind](https://github.com/Aristo94/EngramHalo.cpp/commit/5486559c0eb59ca0f8bbacf785c5f4a1ee4294c6)
- [llama.cpp speculative decoding documentation](https://github.com/ggml-org/llama.cpp/blob/b10731/docs/speculative.md)
- [llama.cpp SPEED-Bench documentation](https://github.com/ggml-org/llama.cpp/blob/b10731/tools/server/bench/speed-bench/README.md)
- [AMD HIP VMM API documentation for ROCm 7.2](https://rocm.docs.amd.com/projects/HIP/en/docs-7.2.0/doxygen/html/group___virtual.html)
- [Official Qwen3.8-Flash-Next checkpoint](https://huggingface.co/Qwen/Qwen3.8-Flash-Next)
- [Pinned Unsloth target GGUFs](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF/commit/2c41bd2a0b3f51c503c11f1c7ed2e6bb34036beb)
- [Pinned Unsloth F16 vision projector](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF/blob/c8b5954a88c2775c546b92593eda40ea041d3176/mmproj-F16.gguf)
- [Reviewed preconverted MTP sidecar](https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF)
- [`shard-scalpel`](https://github.com/drluoto/shard-scalpel)
