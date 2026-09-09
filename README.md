# llama.cpp-hip-gfx1151

`llama.cpp-hip-gfx1151` is the HIP-only Strix Halo variant of
[`llama.cpp-gfx1151`](https://aur.archlinux.org/packages/llama.cpp-gfx1151).
It keeps the sibling package's build, service, and CPU/HIP tuning unless a
difference is listed here. This revision pins upstream `b10872`; the live
sibling is at `b10867` (2026-09-09 review).

The sibling update changes only version/archive-checksum metadata, not its
dependencies, assets, or build configuration. This package is five upstream
commits further; none warrants another experimental MTP backport.
`b10872` was the latest tag when the 2026-09-09 review began. Later tags
warrant another pass only if something materially relevant lands.

Since the previous `b10853` package, the interesting changes are:

- inherited [#28302](https://github.com/ggml-org/llama.cpp/pull/28302), which
  preserves useful recurrent checkpoints in short conversations and can avoid
  unnecessary prompt reprocessing; it does not establish a fix for concurrent MTP;
- inherited [#28604](https://github.com/ggml-org/llama.cpp/pull/28604), disabling
  unsafe direct host-buffer compute on HIP. The redundant #25863 patch is removed;
- inherited [#28326](https://github.com/ggml-org/llama.cpp/pull/28326): lazy mode
  `auto` now switches off when a selected device reports `mmap_support=false`,
  including HIP on Strix Halo. **Keep explicit `--lazy-mode on` for SSD-backed PLE.** The
  proposed `on`→`all` rename was withdrawn before merge;
- inherited [#28390](https://github.com/ggml-org/llama.cpp/pull/28390)'s draft
  device/Meta selection fix (the projector also follows explicit device
  selection), specialized chat-parser refactoring, and a Jinja null-lookup
  fix among 19 upstream commits;
- new native gfx1151 MMVQ/SWAR candidates, progress on adaptive/probabilistic MTP,
  and an approved MMQ successor that still excludes RDNA3.5. These remain on
  the watchlist, along with SSD-PLE direct I/O awaiting post-refactor review.

No additional unmerged runtime patch is introduced in this revision. The
retained MTP/PLE/hipCUB pins are functionally unchanged; freshly generated
GitHub diff headers require checksum updates, not code changes.

The source versions are llama.cpp 0.4.0 / ggml 0.23.0. The validation and
remaining security/runtime limits are documented below.

This package also carries an experimental patch stack for
Qwen3.8-Flash-Next MTP speculative decoding, SSD-backed PLE/engram lookup, and
fast QSA `TOP_K` on AMD GPUs. Those patches are pinned, checksum-verified
snapshots of work that had not all merged upstream when this package was
published. Treat MTP and the carried PLE row-readahead extension as opt-in
features, test them on your workload, and keep a non-speculative baseline.

## What differs from llama.cpp-gfx1151

The comparison below is this package at `b10872` versus the live sibling at
`b10867`.

| Area | `llama.cpp-hip-gfx1151` | `llama.cpp-gfx1151` |
| --- | --- | --- |
| Package identity | `llama.cpp-hip-gfx1151`, ROCm description | `llama.cpp-gfx1151`, ROCm + Vulkan description |
| GPU backends | `GGML_HIP=ON`, `GGML_VULKAN=OFF` | `GGML_HIP=ON`, `GGML_VULKAN=ON` |
| Vulkan packages | Not required or provided | Depends on `vulkan-icd-loader`; builds with `shaderc`, `vulkan-headers`, and `spirv-headers`; provides Vulkan names |
| HIP headers | Keeps `rocm-hip-sdk` and adds an explicit `hipcub` build dependency for the carried hipCUB patch | Relies on `rocm-hip-sdk` for those headers |
| VMM policy | Explicit `GGML_HIP_NO_VMM=ON` | Does not override the upstream default; its `OFF` example is commented out |
| Upstream tag | `b10872`, the latest tag when this review began | `b10867`; the package is five upstream commits ahead as described above |
| Build identity | Pins the upstream `b10872` commit (`b31b71f`) and prevents CMake's Git probes from escaping the extracted source tree | Can report the enclosing AUR wrapper commit when built from a normal AUR Git clone |
| Installed RUNPATH | Suppresses CMake-generated RPATHs so amdclang leaves only the absolute `/opt/rocm/lib` entry on the HIP DSO | Does not override CMake's RPATH policy |
| Extra source changes | Ten remotely sourced functional patch files and four local, checksum-pinned adaptations, described below | No MTP/PLE/Strix safety patch stack |
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

On September 9, GitHub regenerated `index` headers from 11- to 12-character
object IDs in nine retained remote diffs; #28549 is byte-identical. Comparing
each fresh file with the previously verified copy after removing only those
headers confirms identical patch bodies. Their immutable commits are unchanged.
All 19 current sources are checksum-pinned. The four renamed local adaptations
only change their first-line base-version comments.

| Patch | Purpose | Review state and practical risk as of 2026-09-09 |
| --- | --- | --- |
| [Series ending at `33ed435`](https://github.com/ggml-org/llama.cpp/compare/dbeb37548e25abc6e54961c4c99e63f191367809...33ed43518d078174b895a5b459a8f7018e433916), from [#28549](https://github.com/ggml-org/llama.cpp/pull/28549) | Gives MTP's output-producing and no-output prefill/catch-up graphs separate persistent metadata arenas, avoiding repeated capture when their graph-cache keys collide. An active-arena pointer prevents reusing allocations from the wrong graph. | A maintainer approved the implementation; the final revision only makes the requested catch-up-to-prefill identifier rename, verified functionally equivalent. Both owned arenas are reset on scheduler/memory changes, and the non-owning pointer is cleared before rebuild/failure paths. HIP uses the same graph-cache mechanism. Extra graph metadata/cache retention is a memory tradeoff; the reported 4–5% Qwen3.6 gain is Windows/RTX 5090 only. No local gfx1151 speed or MTP-quality claim. |
| [Series ending at `1d8de7c`](https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af), from [llama.cpp PR #27836](https://github.com/ggml-org/llama.cpp/pull/27836), plus [`qwen4exp-mtp-b10872.patch`](./qwen4exp-mtp-b10872.patch) | Adds Qwen3.8-Flash-Next NextN/MTP tensor mappings, conversion, graph construction, recurrent state handling, `draft-mtp`, and detached-head loading. The remote series is applied to every non-overlapping file; the local exact-context patch rebases its `qwen4exp.cpp` changes plus detached-head commit [`a82a58a`](https://github.com/crusaderky/llama.cpp/commit/a82a58a57fc307e5cec0dc68db64d143339be4f2) onto the merged #27941 and generic NextN loaders. | #27836 remains a draft and `a82a58a` is explicitly unreviewed. The rebase preserves the merged PLE-row and tensor-array rules. It replaces the new generic `nextn > block_count` assertion with a catchable load error while retaining Qwen4-Exp's stricter `nextn >= block_count` and one-layer checks. This is still substantial model-specific code; experimental, with moderate correctness and maintenance risk. |
| [`qwen4exp-mtp-mixed-f16-b10872.patch`](./qwen4exp-mtp-mixed-f16-b10872.patch), based on the [new #27836 mixed-type report](https://github.com/ggml-org/llama.cpp/pull/27836#issuecomment-5508708675) | Casts hyper-connection and MTP hidden-state gamma tensors to the activation type only when they differ. This prevents valid integrated heads with F16 norms from entering unsupported F32×F16 CPU dispatch or the shared HIP/CUDA path that otherwise treats F16 `src1` as `float`. | Two exact-context expressions in the model graph, with no extra node for same-type tensors. The published drluoto Q8_0 sidecar's relevant norms were independently verified as F32, so its normal graph is unchanged. The report reproduced the failure and fix on CPU/CUDA rather than HIP and has no owned upstream patch or review; low code-scope risk, but on-device HIP validation is still required. The package deliberately does not broaden generic binary-op dispatch. |
| [`7abbba2`](https://github.com/ggml-org/llama.cpp/commit/7abbba20a8ac5bf32477bfd7cd6fa6061067e590), from [llama.cpp PR #28333](https://github.com/ggml-org/llama.cpp/pull/28333) | Clears a slot's pending MTP carrier when a new sequence begins at position zero, so a completed earlier request cannot influence the first proposal of a fresh request. | Five lines in the MTP drafter. The author reproduced a deterministic `--np 1` first-response mismatch after a priming request and obtained matching hashes in five patched repetitions. It has no human review yet, but adds no allocation, I/O, or new indexing and fails toward a zero initial state. Low code-scope risk and direct correctness/confidentiality value. It does not resolve the simultaneous multi-slot contamination in #28286, so `--np 1` remains mandatory. |
| [`b12a411`](https://github.com/ggml-org/llama.cpp/commit/b12a411b43aa1e2f7f5856c876817f7ae2d2a770), from [llama.cpp PR #28330](https://github.com/ggml-org/llama.cpp/pull/28330) | Prevents Qwen4-Exp's private indexer cache from allocating a V cache that the indexer never reads. The reported saving is about 48 MiB at 8K context and scales to roughly 1.5 GiB at 256K. | Four lines set MLA marker dimensions only on the private copied hparams. Current KV-cache construction uses that marker to omit V while retaining the already configured full K width. One reviewer approved the exact head while preferring a future explicit API flag; the requested code-owner review is still outstanding. Low risk; memory-capacity improvement rather than a throughput promise. |
| [`57bb668`](https://github.com/rmonsurate/llama.cpp/commit/57bb668674d9fb0d382885e5b04911c6437f8e83), also proposed as [rmonsurate/llama.cpp PR #1](https://github.com/rmonsurate/llama.cpp/pull/1) | Keeps `model.hyper_connection_mixer.*` when `convert_hf_to_gguf.py --mtp` exports a detached sidecar. | One-line converter filter change. Low runtime risk; required for a valid standalone Qwen3.8 sidecar. |
| [`13e4cfe`](https://github.com/ggml-org/llama.cpp/commit/13e4cfe53ff3dc2e786a9264ee552da53e0a41c4), from [llama.cpp PR #28007](https://github.com/ggml-org/llama.cpp/pull/28007) | When a hybrid target or draft cannot partially roll recurrent memory back far enough, clears both sequences and reprocesses the prompt instead of aborting or continuing with stale state. | One server file, one concrete Qwen hybrid+vision reproduction, and 136 reported server tests passed. It has no human approval yet and the expensive fallback is intentionally reachable only after rollback refusal. Low code-scope risk; moderate behavioral risk in complex prompt-cache/speculative flows. |
| [`0a2e89a`](https://github.com/ggml-org/llama.cpp/commit/0a2e89adb99d86cf11d694327b942e9408a1b769), from [llama.cpp PR #27200](https://github.com/ggml-org/llama.cpp/pull/27200) | Divides block-quantized element counts before multiplying by block size, preventing the demonstrated pre-division size wrap that can turn a malicious GGUF into a heap out-of-bounds access. | Approved by a maintainer and only reorders two integer expressions; valid divisible shapes are unchanged. Low risk and useful defense-in-depth, but it is deliberately narrow: it does not add checked arithmetic to every later stride product or addition. |
| [`181b199`](https://github.com/ggml-org/llama.cpp/commit/181b1999205fd0e7c3e0db2874856649a0612d3f), from [llama.cpp PR #25670](https://github.com/ggml-org/llama.cpp/pull/25670) | Rejects an invalid top-level RPC graph node before `ggml_hash_insert` and graph execution. Without it, an unauthenticated client can send a crafted `GRAPH_COMPUTE` request with node ID zero and crash `ggml-rpc-server` through a null dereference. | One fail-closed condition change, removal of a now-redundant null branch, and a loopback regression test that verifies both rejection and continued service. The crash was reproduced on current master and the normal multi-server test still passes. No human approval yet, but the scope is narrow and the package builds/installs RPC, so the denial-of-service reduction outweighs the low change risk. This does not make an Internet-exposed RPC server safe or authenticated. |
| [`rpc-graph-shape-validation-b10872.patch`](./rpc-graph-shape-validation-b10872.patch), based on [llama.cpp PR #26933](https://github.com/ggml-org/llama.cpp/pull/26933) at `04542c9` | Rejects RPC `SET_ROWS` and `GET_ROWS` graphs whose attacker-controlled shapes violate the public constructors' invariants, before backend execution. The reported consequences are an out-of-bounds write/selected-victim-buffer overwrite for `SET_ROWS` and out-of-bounds read/data disclosure for `GET_ROWS`. | Testing found the PR's two original comparisons bypassable, so the local no-fuzz patch mirrors the complete structural per-op shape/type/contiguity contract—including the `SET_ROWS` view now allowed by inherited #27199—and adds regression coverage for the published cases and both ASan-confirmed bypasses. Valid constructor-built graphs still pass. It does not inspect the values inside a valid-shaped row-index tensor. The PR has no human review, and this does not validate every RPC op or authenticate RPC. Low code-scope risk; high value when RPC is enabled. |
| Series ending at [`861abb2`](https://github.com/ggml-org/llama.cpp/commit/861abb2b2e333744d565e07985de8f6f6feaff65), from [llama.cpp PR #26592](https://github.com/ggml-org/llama.cpp/pull/26592) | Enables CUB code paths on HIP through hipCUB for sorting, `TOP_K`, reductions, scans, and related operations. It enables them only with rocPRIM 4.4.0 or newer. | The current PR head `f969e23` only rebases the work: its nine production-file changes are byte-equivalent to this already-audited immutable pin. One approval remains alongside an older change request. rocPRIM 4.2 was proven unsafe; the version gate added in `527fcad` avoids that path. Moderate backend/runtime risk. |
| [`c911e6b`](https://github.com/Aristo94/EngramHalo.cpp/commit/c911e6bb5eb956a759e740fb14db8ca639b7d3e7), plus [`qwen4exp-ple-row-prefetch-b10872.patch`](./qwen4exp-ple-row-prefetch-b10872.patch) | Tracks which tensors actually use b10872's lazy mapping, submits page-merged `WILLNEED` hints for selected PLE rows before graph execution, and adds a HIP/CUDA `GET_ROWS` path for 160-value IQ4_NL rows. | Fork-only and tested on one gfx1151 system. The small local shim has exact current context so preparation fails on drift. The fork's rewritten `e8e8f9d` is only a loader-API rebase of the same functional hunks, already represented by this immutable pin plus the local shim, so its hash is deliberately not chased. Lazy mode places the PLE on the CPU path; readahead failure is non-fatal. |

The upstream native radix path and carried hipCUB patch are deliberately both
present:

- with `ROCPRIM_VERSION >= 400400`, the patch defines
  `GGML_CUDA_USE_CUB`. For `TOP_K`, a build whose hipCUB compatibility surface
  lacks CCCL 3.2 `DeviceTopK`—including this rocPRIM 4.6 / hipCUB 4.7 nightly—uses
  bitonic argsort for small rows or hipCUB argsort for larger rows, then copies
  the first `k` indices;
- with older rocPRIM, hipCUB is not enabled and b10872's native HIP radix kernel
  keeps wide QSA `TOP_K` on the GPU. New two-node gfx1151 testing on issue
  #27021 passed 500/500 CPU-reference comparisons and every formerly skipped
  row wider than 1024. The native radix implementation is dormant whenever
  `GGML_CUDA_USE_CUB` is defined;
- native #27466 covers wide `TOP_K`, not wide `ARGSORT`. Qwen3.8-Flash-Next has
  [248,320 vocabulary entries](https://huggingface.co/Qwen/Qwen3.8-Flash-Next/blob/de4b8e4d43b917e7706784d8bb445c9af86a3540/config.json), so ordinary backend sampling can still
  fall back to CPU even at the first token when hipCUB is unavailable. The
  broader #26592 series covers both operations. Without either GPU `TOP_K`
  route, QSA itself falls back to CPU above width 1024 and long-context speed
  collapses.

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
recurrent-rollback fallback, `lazy_tensors` tracking, row-prefetch methods,
and IQ4_NL gather changes are all present after `makepkg -o`. It also checks
the inherited #27870 common barrier and #28387 removed capacity-only split,
and #28549's distinct MTP prefill arena with active-arena reuse checks. The same check
also requires #28333's fresh-sequence carrier reset, #28330's omitted indexer
V cache, the now-inherited #28040 indexed predecessor lookup, #27200's
divide-before-multiply size expressions, #27483's largest-first staged load and
per-tensor read-buffer lifetime, and a direct `pwa-assets-generator` command
with no `npx` fallback.

The CMake configure call uses the same Git ceiling and explicitly records the
short commit for the pinned upstream tag. Without both measures, llama.cpp's
build-info probe walks out of the source tarball into the enclosing AUR Git
checkout, and `llama-cli --version` misleadingly reports the package wrapper's
commit. The package records `build 10872, commit b31b71f`; ggml's separate
source probe reports `unknown`, which is accurate for an extracted tarball.

### How the SSD-backed PLE patches fit together

Upstream b10872 provides the important mixed-load behavior itself. A tensor
marked lazy overrides the global load mode, gets a dedicated CPU context, and
is mapped even with `--load-mode none`. Dense tensors continue through their
ordinary non-mmap upload path. The package adds row readahead to the
SSD-backed lazy path and an IQ4_NL `GET_ROWS` GPU kernel for resident placement:

| Stage | Package behavior |
| --- | --- |
| Mapping | The PLE remains an mmap alias of the GGUF on NVMe; it is not copied into a permanent 26.8 GiB RAM allocation. |
| Dense-weight load | With `-lm none`, other tensors use pinned staging buffers and asynchronous upload to their HIP buffers; they are not forced through the mmap path merely because the PLE is lazy. |
| PLE lookup | b10872 gathers a lazy tensor on the CPU. Before `GET_ROWS`, this package page-aligns and merges the selected row ranges and submits readahead hints so Linux can queue several NVMe reads in parallel. |

The PLE is still ordinary read-only model data. There is no background daemon,
private cache format, write-back, or model mutation. "SSD-backed" also does not
mean zero RAM use: Linux caches recently faulted PLE pages when memory is
available and can reclaim them under pressure. The resident amount therefore
depends on workload locality and memory pressure; the reported 1-1.5 GiB is an
observation, not a hard limit.

b10872 suppresses whole-file prefetch when the global mode is `none`; the lazy
ranges are brought in only on demand. It also excludes lazy ranges from bulk
prefetch when the global mode is `mmap`. Clean mapped pages remain reclaimable
under memory pressure.

### Why the old per-buffer mmap patch was removed

[llama.cpp PR #27837](https://github.com/ggml-org/llama.cpp/pull/27837) was
approved, merged, and has been present since b10705. It solves the reason this package carried
EngramHalo's `e5d8461` per-buffer mmap patch: dense weights no longer need the
global mmap mode to keep one lazy PLE tensor file-backed. Carrying both would
duplicate loader policy and the old patch no longer applies cleanly.

The SSD-backed starting pair is therefore `-lm none -lzm on`. In the PR's
direct-PCIe test, that configuration kept the PLE on disk while matching a
resident PLE's prefill; another report found `none` about 15% faster than
`mmap`. However, new
[issue #28160](https://github.com/ggml-org/llama.cpp/issues/28160) bisects an
approximately 429-to-216 t/s prefill regression on gfx1151 Vulkan to #27837,
with `--lazy-mode off` restoring about 406 t/s; a GB10 UMA/CUDA report describes
a similar roughly 73% loss. Neither result proves that HIP has the same
regression, but they make an on-device `on`/`off` A/B mandatory before calling
this the fastest configuration. This package retains only EngramHalo's batched
row readahead and the small b10872 bookkeeping hook.

### Why direct HIP host-buffer compute stays disabled

Strix Halo is reported as an integrated HIP GPU. In unpatched `b10853`, that
allows the scheduler to place compute directly on a `ROCm_Host` tensor. The
upstream sanitizer caught the CPU writing new input while the GPU still read the
same host range. Reported symptoms include ignored or corrupted long/system
prompts, repeated `/` or other characters, and, under multiple slots, a response
from one request being returned to another request. The last symptom is a
confidentiality problem, not merely bad model quality.

The former `fdc1260` patch refused direct integrated-HIP host-buffer compute
while keeping pinned staging/output buffers. Upstream now provides the same
compute exclusion through [#28604](https://github.com/ggml-org/llama.cpp/pull/28604),
which leaves its internal direct-host capability marker false on HIP. The
public device-type query can still correctly identify an integrated GPU; this
is a compute-placement policy, not a claim that Strix Halo has discrete VRAM.
Pinned staging allocation remains available. #25863 itself has not merged:
its patch is removed here because the safety workaround is redundant, not
because the broader scheduler race has been solved.

New [issue #28211](https://github.com/ggml-org/llama.cpp/issues/28211) gives a
second direct gfx1151/ROCm case: prompts longer than `n_ubatch` silently produce
wrong logits, and the proposed AMD-fork remedy is the same integrated-HIP
host-buffer exclusion now inherited here. It strengthens the reason to keep
this policy; it does not require another patch.

Removing #25863 also drops its ancillary host-buffer-factory environment check;
upstream's pinned allocator still honors `GGML_CUDA_NO_PINNED=1`. That variable
remains a broader diagnostic fallback and can reduce prompt-processing speed.
Do not set it as a routine workaround with this package. The unfinished
scheduler ring-buffer PR #27311 is not a prerequisite for safe placement under
the inherited policy, and its author-reported pipeline-parallel fix still
needs independent review. Neither policy resolves #28286's separate MTP
cross-slot contamination; keep `--np 1`.

### Why the RDNA3.5 MoE-fusion guard was removed

Upstream [#27621](https://github.com/ggml-org/llama.cpp/pull/27621) widened the
quantized `MUL_MAT_ID` fusion from a single token to small multi-token batches,
which is particularly useful when the target verifies several MTP proposals.
This package briefly carried a conservative RDNA3.5-only restriction after
[issue #28113](https://github.com/ggml-org/llama.cpp/issues/28113) attributed
repeated-punctuation output to that path.

On 2026-09-04 the reporter withdrew that attribution and closed the issue after
clean isolation builds: #27621 alone, the native radix change alone, both
together, and the separate weighted-expert fusion all worked. The reporter
concluded that their own tuning patches had collided. With no independent
gfx1151 reproduction, disabling upstream multi-token fusion would retain a
known MTP performance cost without an evidence-backed correctness benefit, so
the local guard and its package source were removed. Output-coherence checks
remain part of the benchmark procedure; upstream dispatch has been restored
since this package's `b10796` revision and remains in `b10872`.

### Why the Qwen3.8 correctness follow-up matters

PR #27941 fixes paths that ordinary single-slot text tests do not exercise.
Before it, an OpenAI request using `n` could copy a sequence without copying
its QSA indexer keys, unified-KV blocks could combine cells belonging to
different sequence sets, and M-RoPE image tokens sharing one position could be
collapsed into the wrong pooled block. The same patch converts model-controlled
metadata assertions into load errors and reshapes the QSA selection launch so
the pooled-block count does not overflow `gridDim.y` near a 256K cache.

b10872 inherits the complete, reviewed, and merged #27941 series, including its
PLE-backed state round-trip tests, stricter loader checks, finite short-sequence
spare-block bias, full saved M-RoPE coordinate restore, and the decision to
disable unsupported tensor splitting for Qwen4-Exp. It is no longer a package
patch. The local MTP rebase changes only the overlapping Qwen runtime/loader
code needed by #27836 and detached heads while preserving those merged loader
and PLE-row rules. The upstream author reported identical perplexity for the
original QSA rewrite, and no target or sidecar GGUF reconversion is required.
Short sequences, state save/restore, vision, sequence copying, and long context
still deserve explicit target-machine tests because the MTP overlay itself
remains experimental. MTP itself must currently run with `--np 1`; multi-slot
testing is unsafe for the separate reason documented below.

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

### What is already upstream

The September 9 baseline adds #28302 (short-conversation checkpoint retention),
#28326 (lazy `auto` disabled when a device lacks `mmap_support`), #28390 (draft device
selection/Meta wrapping), and #28604 (HIP direct-host compute disabled).
These are inherited, not new downstream patches. The precision API in #26675
adds explicit accumulator/source-type declarations while retaining the old
enum values and deprecated entry points; it is not an automatic lower-precision
inference setting. #27764 splits specialized chat parsers into separate files,
and #28620 fixes Jinja membership tests with a null left operand.

The following older entries remain inherited from b10853 and earlier:

The base tag already contains the merged Qwen3.8-Flash-Next implementation and
the important corrections made during its long review. They are not additional
package patches. These include synchronized QSA indexer/attention cache slots,
multi-stream QSA handling, indexer state save/restore, per-context PLE history
and sequence operations, correct short-history padding, dense fallback when a
compression ratio is absent, and related converter/quantization fixes.

The remaining HIP-specific performance problem identified after that merge was
wide QSA `TOP_K` falling back to the CPU. b10853 inherits the native HIP
radix fix from approved and merged
[PR #27466](https://github.com/ggml-org/llama.cpp/pull/27466); this package
therefore removed its byte-equivalent carried copy. The hipCUB patch above is
still selected on rocPRIM 4.4 or later. On the compiled rocPRIM 4.6 / hipCUB 4.7 stack
it uses the argsort-and-copy `TOP_K` branch because hipCUB does not expose the
CCCL 3.2 `DeviceTopK` API;
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
Qwen4-Exp recurrent rollback described above. b10737 then adds the complete
reviewed and merged [PR #27941](https://github.com/ggml-org/llama.cpp/pull/27941)
correctness series described above.

The b10751 archive additionally introduced:

- [#28159](https://github.com/ggml-org/llama.cpp/pull/28159), which reads
  NextN metadata before architecture handlers, together with
  [#28173](https://github.com/ggml-org/llama.cpp/pull/28173), which restores
  `n_layer_all` sizing for per-layer arrays after breakage was reported in
  Qwen3.8, GLM5 Next, and Step3.5;
- [#28183](https://github.com/ggml-org/llama.cpp/pull/28183), the corresponding
  Gemma4 Assistant fixes. Equality between NextN and block count remains valid
  for that architecture, while the local Qwen4-Exp rebase still rejects it;
- merged [#28030](https://github.com/ggml-org/llama.cpp/pull/28030), which
  automatically applies YaRN scaling when requested context exceeds training
  context;
- approved and merged [#28040](https://github.com/ggml-org/llama.cpp/pull/28040),
  the logarithmic QSA predecessor lookup formerly carried by this package; and
- approved and merged [#25952](https://github.com/ggml-org/llama.cpp/pull/25952),
  which fuses the shared CUDA/HIP weighted-expert reduction. Its reported GB10
  prompt-processing gain was about 6.6–7.4%; there is no isolated gfx1151
  result, so this is an inherited optimization to validate rather than a local
  performance promise.

A new nine-MI50 GLM4.7 report on #25952 measures a prefill regression with that
fusion enabled (93 versus 325 t/s), while decode is unchanged. That is not a
gfx1151 result and does not justify disabling fusion here. If a local regression
appears, `GGML_CUDA_DISABLE_FUSION=1` is a diagnostic A/B control, not the
recommended default; it disables more than this one optimization.

Open [#28192](https://github.com/ggml-org/llama.cpp/pull/28192) is not required
on top of this pair: it moves NextN reads back into only three Qwen handlers and
would leave other existing NextN architectures—including the carried Qwen4-Exp
MTP path—with zero NextN layers. It is therefore watched as a possible future
redesign, not applied as a regression fix.

`b10778` adds the approved non-mmap peak-RAM reduction from
[#27483](https://github.com/ggml-org/llama.cpp/pull/27483). It loads staged
tensors largest-first and limits the ordinary read buffer to one tensor. The
package therefore removed its formerly carried copy after verifying the same
logic in the archive. `b10796` adds approved
[#28323](https://github.com/ggml-org/llama.cpp/pull/28323), whose
`n_expert_used_max()` checks correctly cover heterogeneous per-layer expert
counts instead of consulting only the default layer.

The `b10796`→`b10853` update additionally inherits #28270's no-`npx`
build command and #28271's backend-path error handling. #27870's F16 barrier
correction, #28387's growing-input scheduler fix, and #28068's reference GDN
normalization are now merged too. Stable patch IDs match their former carries,
so the extra sources and applications have been removed. The normalization is
`x * rsqrt(sum(x²) + eps)`, matching the reference GDN definition rather than
`x / max(sqrt(sum(x²)), eps)`; it is a correctness change, not a quality promise.

Since the interrupted `b10819` checkpoint, 34 further
commits bring direct CMake Web UI embedding (#28445), faster UI rendering,
model-router LRU queue recovery (#28539), explicit Qwen recurrent-layer
conversion metadata (#28208), opt-in fused-QKV conversion (#22780), and
Kimi-K3 rollback (#28466). The new converter option is not enabled by default.
The shared Q4_K/Q5_K branchless unpack from #26705 can affect HIP, but its
DGX Spark L2 prefetch does not. #28475's synchronization helper is a no-op on
HIP; it must not be advertised as fixing the separate ROCm wrong-logit reports.
#24546's routed-MoE tile tuning was merged and then reverted, so is not active.
The #28552 successor remains under review and does not target RDNA3.5 in its
current selection condition.

The earlier part of the update introduces llama.cpp 0.4.0 / ggml 0.23.0,
generated ggml version headers, Gemma4 vision and HY4 Preview support, and Web
UI export/MCP image fixes. The explicit upstream build identity remains needed.
No local MTP/PLE adaptation needs a functional change for the new baseline.

The previous review's sibling snapshot was `b10852-1` at AUR commit
`20172ecdffed203277b64c20b1e9878787c882b7`; its
[immutable PKGBUILD](https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=llama.cpp-gfx1151&id=20172ecdffed203277b64c20b1e9878787c882b7)
has SHA-256 `7392f43174550f097434ce971909a5d77bd228a5d59545d6be62f2916329532e`.
The September 9 comparison instead uses Orion's live `b10867-1`
[source PKGBUILD](https://github.com/Orion-zhen/aur-packages/blob/main/packages/llama.cpp-gfx1151/PKGBUILD).
Assets, dependency policy, and compiler options remain unchanged. See the
[19-commit update](https://github.com/ggml-org/llama.cpp/compare/b10853...b10872)
and [five commits beyond the sibling](https://github.com/ggml-org/llama.cpp/compare/b10867...b10872).
The reviewed `b10867` recipe's SHA-256 is
`5bc23b0577766fb9d86e5421ecd3e90591253b323cc8192374210d111842f7ab`.

### Safety scope of the patch review

The September 9 audit covers b10872's ten remote patches, four local
adaptations, package/build changes, and the relevant upstream delta. No new
unmerged runtime code was added. #25863 was removed only after checking that
upstream #28604 makes direct HIP host-buffer compute unavailable while keeping
pinned staging. The retained patch bodies are unchanged; their current
interaction with the new source is checked again rather than inferred from
successful compilation alone. All 19 source hashes and exact-context patch
application passed. The independent pristine/prepared inventory contains 36
changed text files (1,142 additions, 128 removals), including the two existing
RPC regression scripts. No binary payloads, unexpected source deletions,
symlinks, executable-bit changes, or runtime network/process/persistence
additions were found. Extraction removes group-write permission through the
builder's umask; this is not a patch mode change. Python syntax-only compilation
passed for 115 converter/GGUF/RPC files without importing or running them.
An independent prepare inside an AUR-style parent Git checkout produced
byte-identical source files with no rejects or backup hunks, confirming that
the Git discovery ceiling still prevents silently skipped patches.

The new upstream model-loader policy resolves `auto` before tensor creation,
so explicit lazy PLE still reaches the carried `lazy_tensors`/row-readahead
path. The MTP arena ownership/reset rules, fresh-sequence carrier reset,
catchable detached-head metadata errors, mixed-F16 casts, indexer K-only cache,
recurrent rollback fallback and RPC row-shape guards remain present. #28302's
checkpoint eviction change is separate from the carried rollback failure path.
The precision API preserves the old entry points and numeric values; it does
not inject lower-precision defaults into the carried kernels. No new static
integration blocker or malware indicator was found. This is not proof that
the experimental native code is vulnerability-free.

Fresh September 9 validation of this exact stack:

- **64/64 normal CTests passed** in a fresh CPU/shared/RPC build, including
  recurrent state, chat parsing and the new Jinja tests. Existing verified
  vocabulary payloads were reused. The two malformed-input RPC scripts were
  syntax-checked but not executed.
- **623/623 CPU ARGSORT/TOP_K cases passed**, plus six valid loopback-RPC
  scheduler cases with 31, 64 and 128 inputs.
- The valid synthetic Qwen3.5 MTP regression again produced **2,304 identical
  finite logits** with graph reuse enabled/disabled, nine versus zero graph
  reuses, and distinct stable output/prefill metadata addresses over three
  clear/new-sequence rounds. This is not a Qwen3.8 acceptance/quality test.
- A complete **Arch `CI=1` HIP package and Web UI build passed** using the
  retained September 7 `rocm-nightly-gfx1151-bin` payload described below.
  Artifact inspection found **67 ELF files and 182 HIP bundles, all gfx1151**,
  resolved dependencies, no CUDA/Vulkan linkage and no unsafe filesystem
  entries. The only RUNPATH is the HIP module's absolute `/opt/rocm/lib`.
  Its TOP_K object references bitonic/hipCUB argsort and `hipMemcpy2DAsync`,
  not `DeviceTopK` or the dormant native radix route.
- Disposable-container installation passed: **127 files, zero altered** in
  `pacman -Qkk`; CLI/server report `build 10872, commit b31b71f`; the service
  remains disabled. The installed help still accepts `--lazy-mode on`.

The test artifact is 24,576,991 bytes, SHA-256
`c9a94b0ce1c53bb115f7f3977bf826a20a3b8939f165895b655f673e11d49afa`.
This identifies one build, not a reproducible-build guarantee. Existing GCC/LTO
warnings remain. `bash -n` passes; ShellCheck still reports inherited packaging
conventions and intentional word splitting, not a new injection path. Neither
container has a usable ROCm GPU, so real HIP graph/numerical behavior, SSD-PLE
performance, large-model memory peaks and VMM reliability remain untested.

**Dependency audit exception:** fresh `npm audit --package-lock-only
--ignore-scripts` now flags **19 affected packages: nine high, nine moderate,
one low, zero critical** (22 distinct advisory URLs, including transitive
attribution). The lockfile is byte-identical to b10853; these are newly reported
advisories, not new dependencies or malware introduced by this sync. Newly
flagged areas include [Sharp/libheif](https://github.com/advisories/GHSA-rgj7-g3m4-5g8c)
in PWA asset generation, [js-yaml](https://github.com/advisories/GHSA-2883-xcg3-v3hh)
under ESLint, [Vitest's mock server](https://github.com/advisories/GHSA-82fw-gwwq-j7x9),
baseline-browser-mapping, and Hono under the MCP SDK. Package presence alone
does not demonstrate exploitability in the shipped static UI or C++ server.
The previously flagged Mermaid browser renderer remains relevant to untrusted
model-generated diagrams. No `npm audit fix --force` or dependency downgrade
was applied; UI dependency remediation needs its own tested lockfile update.
API-only deployments can use `--no-ui` to remove that browser rendering surface.

Residual limitations remain: RPC must stay trusted/firewalled; row-index
values are not comprehensively validated; PLE readahead has no second local
range/overflow guard; MTP must stay at `--np 1`; and an unsafe external
`LD_LIBRARY_PATH` can override safe artifact paths. Details and previous
evidence follow. **No malware found does not mean no known vulnerabilities.**

#### Previous b10853 validation (September 8)

The previous audit covered the complete `b10853` recipe on 2026-09-08:
eleven remotely sourced functional patches and four local adaptations.
Static source review found no malicious payload, added runtime shell execution,
outbound runtime connection, credential handling, persistence, or inference-time
model writes in those changes. This is an evidence-based review, not a guarantee
that native code contains no vulnerabilities. PLE intentionally changes read-only
GGUF mapping, readahead, and page-cache advice; RPC intentionally changes
network-input handling.

An independent pristine-versus-prepared inventory found **36 changed text files,
1,158 additions, and 123 removals**: 34 modified source files and two added
executable RPC regression scripts. There are no binary blobs, deleted or renamed
files, new symlinks or special files, changed existing source modes, or unexpected
top-level payloads. The intentional empty `.git` directory only stops Tailwind
from searching above the extracted source boundary. All four local `b10853`
adaptations differ from their committed `b10796` predecessors only in their
first-line base-version comments.

All **20 final package sources** passed independent SHA-256 verification:
the archive, eleven remote patches, four local adaptations, and four service
assets. Retained remote diffs have unchanged functional content; GitHub's
regenerated `index` header abbreviations account for the checksum differences
from the September 5 checkpoint. The complete stack applied independently to a
clean `b10853` extraction without fuzzy hunks, rejects, or `.orig` files.
Shell syntax and prepared-tree whitespace checks passed.

The newly included [#28549](https://github.com/ggml-org/llama.cpp/pull/28549)
was reviewed in the final prepared source. Its second, owned graph-metadata
arena separates MTP batches with no outputs from output-producing draft batches,
giving the shared HIP/CUDA graph cache stable, distinct keys. A non-owning
active-arena pointer prevents stale reuse after scheduler allocation changes;
reserve, memory-update, and optimizer paths invalidate it, and it is set only
after allocation succeeds. Existing synchronization precedes arena replacement
or context destruction. It adds metadata/cache memory, not a device kernel or
new I/O. The final revision only renames the field requested in the maintainer's
review. No static ownership/lifetime blocker was found, but the upstream runtime
result is on an RTX 5090, not gfx1151, and this is not a concurrent-slot fix.

The upstream [`b10819`→`b10853` delta](https://github.com/ggml-org/llama.cpp/compare/6a1a922d269908a29cbd4b49c27e6a8e7fd10fae...9dcf84e5ae2718947188b539aab8b9c2b15d3ba1)
contains 34 commits changing 152 files by 4,883 additions and 1,342 removals.
Relevant native, converter, build, and UI changes showed no malicious behavior.
The new CMake UI embedder generates byte arrays from build assets; it replaces
a build-time helper and keeps the existing provisioning policy. Release-workflow
registry checks are not package runtime code. The hipCUB patch's upstream CI
package-manager hunks remain excluded by `prepare()`. The UI lockfile is
unchanged. The new optional `--fuse-qkv` conversion flag remains disabled by
default; do not enable it for the experimental Qwen4-Exp MTP path without
separate validation.

The remaining PLE hardening opportunity is a second local bounds/overflow check
on readahead ranges. These calls advise the operating system rather than
dereference the ranges, but invalid hints can waste page-cache and I/O work.
Continue to treat arbitrary GGUFs as hostile input. The carried size-arithmetic
correction is likewise narrow, not comprehensive checked arithmetic throughout
ggml.

RPC remains unauthenticated infrastructure for a trusted network. The carried
node and row-shape guards improve rejection of invalid graphs but are not a
general graph-operation or tensor-value validator. They do not make untrusted
RPC clients safe. Bind `ggml-rpc-server` only to a protected interface and
firewall it from untrusted clients. The two malformed-input regression scripts
were statically inspected and syntax-compiled only; **neither was executed**.
They select the CMake-provided server directly without a shell, use loopback,
are gated to Unix test builds, and are not installed.

MTP remains experimental. The carried #28333 reset improves sequential slot
reuse but does not resolve [#28286](https://github.com/ggml-org/llama.cpp/issues/28286)'s
reported concurrent cross-slot contamination. Keep `--np 1` and client
concurrency one.

Prepared-source Python syntax compilation passed for **121 files**: four root
converters, 92 conversion modules, 23 GGUF Python files, and both RPC scripts.
Compilation was in memory, without imports or script execution. Fresh CPU
and HIP checks on this exact stack also passed:

- A fresh CPU Release/shared/RPC build passed all **64 normal CTests**. One
  vocabulary test initially received Git LFS pointers instead of payloads; it
  passed after restoring six fixtures verified against their exact LFS SHA-256
  IDs. The two malformed-input RPC tests were excluded, as described above.
- Explicit CPU `ARGSORT`/`TOP_K` tests passed **623/623 cases**. Six valid
  CPU/loopback-RPC scheduler executions also passed with growing input counts.
- A bounded Qwen3.5 synthetic one-head MTP test alternated output/no-output
  batches through three clear/new-sequence rounds: **2,304 finite logits were
  numerically identical** with graph reuse on and off, with nine actual reuses
  versus zero. Sampled prefill/output metadata addresses stayed distinct and
  stable. This exercises CPU context lifetime, not HIP capture or Qwen3.8
  model quality, acceptance, or simultaneous slots.
- A fresh `CI=1` Arch package build passed with the exact September 7 nightly
  payload described below. The resulting package contains **67 ELF files** and
  **182 HIP device bundles, all gfx1151**. Dependencies resolve, no CUDA/Vulkan
  linkage appears, and there are no unsafe symlinks, special files, set-ID bits,
  or world-writable entries. `TOP_K`'s compiled object references bitonic/hipCUB
  argsort and `hipMemcpy2DAsync`, not `DeviceTopK` or the dormant native radix.
- Disposable-container installation passed; `pacman -Qkk` reports **127 files,
  zero altered**. CLI and server identify `build 10853, commit 9dcf84e`, and
  the service remains disabled. Systemd hooks note that the container is not
  booted; this is not an end-to-end systemd service test.

The inspected artifact is 24,568,488 bytes with SHA-256
`65243b1a534e8cbac2812e713edec7ff1effef11911b894778ed2e579b4ca89a`.
This identifies that test build, not a reproducibility guarantee. Compilation
still emits GCC/LTO and enum warnings, and 40 ELF files retain source-path
diagnostic strings; these are not dynamic-loader search paths. Earlier b10819
CPU tests and b10796 artifact audits remain historical evidence only.

The package retains `CMAKE_SKIP_RPATH=ON`, which previously removed an empty
CMake RUNPATH placeholder while preserving AMD Clang's absolute ROCm path.
Fresh inspection confirms that only the HIP module has a RUNPATH, exactly
`/opt/rocm/lib`, with no empty or relative components. There is also a separate
environment issue in the
[current nightly provider's profile](https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=rocm-nightly-gfx1151-bin&id=9b450245593211621c0a5ff6451509f517872d07):
its unconditional `LD_LIBRARY_PATH=$ROCM_PATH/lib:$LD_LIBRARY_PATH` creates
a trailing empty component when the previous value is unset. An empty component
means the current directory, and `LD_LIBRARY_PATH` takes precedence over
DT_RUNPATH. See [the dynamic loader documentation](https://man7.org/linux/man-pages/man8/ld.so.8.html).
An absolute artifact RUNPATH does not neutralize an unsafe environment. Inspect
and remove empty components, or unset this variable when the provider's
absolute `ld.so.conf.d` paths suffice. This review does not change that
separate provider package.

Two inherited local build trust points remain. If `ROCM_PATH` is unset, the
PKGBUILD sources `/etc/profile`, executing administrator-controlled profile
fragments. `LLAMA_BUILD_EXTRA_ARGS` undergoes shell word splitting and glob
expansion when appended to CMake arguments; it is not passed through `eval`
or remotely populated here. The existing `npm ci` step downloads
lockfile-pinned packages and may run lifecycle scripts. Inherited #28270 removes
only the additional `npx` fallback lookup.

A fresh script-disabled lockfile audit on 2026-09-08
(`npm audit --package-lock-only --ignore-scripts`) still reports **six vulnerable
packages: zero critical, three high, two moderate, and one low**: Browserslist,
fast-uri, Nano ID, Mermaid, qs, and postcss-selector-parser. This check did not
install or fix dependencies or execute their lifecycle scripts. These are
inherited UI dependencies, not malware findings in the carried patches.

Mermaid remains the browser-runtime priority because it is lazy-loaded into
rendered Markdown; treat model-generated diagram text as untrusted. npm's
development-only classification does not prove that a dependency is absent from
the browser bundle. API-only deployments can use `llama-server --no-ui`; do
not expose an unauthenticated server to an untrusted network.

The builder has no `/dev/kfd` or `/dev/dri`. Static review, compilation, and
CPU tests cannot establish HIP numerical correctness, graph-capture safety,
real SSD-backed PLE behavior, MTP quality or acceptance, concurrency safety,
sustained generation performance, or VMM reliability. Those still require
testing on the 128 GiB Strix Halo machine.

## Build configuration

The important HIP options are:

```text
-DAMDGPU_TARGETS=gfx1151
-DGGML_HIP=ON
-DGGML_HIP_GRAPHS=ON
-DGGML_HIP_NO_VMM=ON
-DGGML_CUDA_FORCE_MMQ=ON
-DGGML_CUDA_FA_ALL_QUANTS=ON
-DHIP_PLATFORM=amd
-DGGML_VULKAN=OFF
-DCMAKE_SKIP_RPATH=ON
```

`GGML_CUDA_*` names are not typos. llama.cpp's CUDA-family backend sources are
shared by CUDA and HIP, so several HIP controls retain their historical CUDA
names.

Keep the runtime environment variable `GGML_CUDA_ENABLE_UNIFIED_MEMORY`
completely **unset** on Strix Halo—not even `GGML_CUDA_ENABLE_UNIFIED_MEMORY=0`.
Two independent gfx1151 reports on
[#27797](https://github.com/ggml-org/llama.cpp/issues/27797) found multi-segment
prompt corruption when the variable merely existed and clean output when it
was absent; the working hypothesis is an unsuitable managed/coarse-grained
memory route. This package does not need that variable: Strix Halo's shared
physical memory and normal HIP offload continue to work without it. Check with
`env | grep '^GGML_CUDA_ENABLE_UNIFIED_MEMORY='`; a successful check prints
nothing.

`GGML_HIP_MMQ_MFMA` remains effectively `ON`: that is b10872's upstream
default, inherited by both packages. An earlier sync removed the redundant explicit
flag so the PKGBUILD stays aligned with the sibling without changing the
configured value.

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

`CMAKE_SKIP_RPATH=ON` is a packaging hardening difference. On the tested ROCm
nightly, CMake's build-tree placeholder and amdclang's implicit ROCm path would
otherwise combine into an installed `RUNPATH` with a leading empty component,
which means current-directory lookup. Suppressing CMake RPATHs leaves the HIP
DSO's safe absolute `/opt/rocm/lib` entry and does not alter its device code.

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
[llama.cpp `b10872`](https://github.com/ggml-org/llama.cpp/blob/b10872/ggml/CMakeLists.txt).
This package spells it out so an upstream default change cannot silently alter
the allocator.

The sibling package's line showing `GGML_HIP_NO_VMM=OFF` remains commented out
and now notes that its maintainer has seen VMM work with a nightly. It therefore
still inherits upstream's no-VMM default today. This package pins that same
policy explicitly until an A/B test on the installed nightly shows a stable,
repeatable benefit.

The current validation uses the exact `10.1.0a20260907-1` nightly payload and
the b10872 no-VMM configuration. A successful compile/link does **not** show
that VMM is safe or faster: the test host exposes no `/dev/kfd`, so the
allocator cannot be exercised. Do not flip the default solely because a
nightly build passes.

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

The b10853 validation on September 8 and b10872 validation on September 9 use
the same retained nightly
`10.1.0a20260907-1`: HIP 7.16.26354, AMD Clang 24.0.0git at compiler commit
`064f1a2`, rocPRIM 4.6.0, and hipCUB 4.7.0. Its
`therock-dist-linux-gfx1151-10.1.0a20260907.tar.gz` payload passed SHA-256
`b007159c4f50dc3e877fdbd773abc6e5164cde9d663a092a327c6e37ea39c61b`
and produced the expected `/opt/rocm` tree. The disposable builder unpacked
that payload without registering the monolithic AUR package in pacman's
database, so `makepkg` and the disposable package-install check skipped
dependency resolution; this validates compilation and installation against the
exact payload, not the provider metadata itself. The provider's declared
`provides` entries separately satisfy the generic dependencies above.
Nightlies are moving snapshots; this result does not automatically cover a
later date-stamped build.

The provider's live recipe is now `10.1.0a20260908-1`. Its declared dependency
provides remain compatible, but that newer SDK payload was not installed or
compiled in this review. Do not interpret the September 9 package build as
runtime validation of the September 8 nightly.

Also inspect the nightly's shell profile: its unconditional `LD_LIBRARY_PATH`
append can leave an empty entry, which means current-directory library lookup.
The standard package also registers `/opt/rocm/lib` and `/opt/rocm/lib64` with
`ldconfig`, so an environment without that variable can normally resolve its
libraries. Remove empty entries, or use `env -u LD_LIBRARY_PATH llama-server`
when no other custom library directory is needed. This is separate from this
package's safe absolute RUNPATH; see the audit's environment warning.

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
llvm_objdump="$(hipconfig -l)/llvm-objdump"
hip_library=$(pacman -Ql llama.cpp-hip-gfx1151 | \
  awk '$2 ~ /\/libggml-hip\.so(\.[0-9]+)*$/ { print $2; exit }')
test -n "$hip_library" && test -f "$hip_library" || exit 1
task_bundle_dir=$(mktemp -d)
cp --dereference -- "$hip_library" "${task_bundle_dir}/libggml-hip.so"
"$llvm_objdump" --offloading "${task_bundle_dir}/libggml-hip.so" 2>&1 | \
  rg 'hip-amdgcn-amd-amdhsa--gfx' | sort -u
```

Use the temporary copy: the tested AMD `llvm-objdump --offloading` also creates
extracted bundle files beside its input. This keeps inspection from writing
into `/usr/lib`; the temporary directory is disposable after inspection.
Querying the package also covers CI/universal builds whose loadable HIP module
is installed under `/usr/bin` instead of the ordinary shared-library directory.

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

The carried [#28549](https://github.com/ggml-org/llama.cpp/pull/28549) gives
the draft's catch-up and token-proposal graphs separate cache identities, so
alternating between them need not repeatedly replace the same captured graph.
Its reviewed implementation also reaches HIP graphs, but the published gain
is CUDA-only: about 4.4% prediction throughput on an RTX 5090, with unchanged
acceptance. It adds a bounded metadata arena and can retain another
backend graph. It changes neither the sidecar format nor the single-slot rule;
measure actual gfx1151 throughput and total memory before claiming a gain.

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
workloads stay resident, swap activity appears, or a larger context or
non-MTP, target-only slot count matters more than the quality step.
`UD-Q4_K_XL` remains a poor fit here: its non-PLE weights alone consume most of
the available memory.

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
F16 projector above and the Q8_0 sidecar documented below. **Keep `--np 1`
whenever `draft-mtp` is enabled.** Issue
[#28286](https://github.com/ggml-org/llama.cpp/issues/28286) demonstrates that
`draft-mtp` with more than one parallel slot can mix plausible content between
concurrent requests on gfx1151, even with HIP graphs disabled. That is a
confidentiality failure, not a benchmark curiosity. Omit only the `--mmproj`
line for a text-only server:

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

This is a one-shot/single-slot starting point, not a guarantee of fast or correct
multi-turn slot reuse. Issue #28049 can leave accepted tokens after EOG inside
a hybrid model's server slot even though the client never sees them, forcing a
redundant re-prefill on the next turn. Client-side output truncation cannot
remove that hidden state. The earlier short-output report
[#28266](https://github.com/ggml-org/llama.cpp/issues/28266) was withdrawn by its
author on September 4 without identifying a cause or fix; it no longer provides
a current reproduction. Continue testing the full expected conversation length.
For conversations affected by the unresolved EOG/slot-state problems, disable
`draft-mtp` or clear/restart the affected server-side slot state between turns.

Why these choices:

- `-lm none -lzm on` is the essential pair for the SSD-backed mode on b10872.
  It is not yet proven to be the fastest HIP mode because of issue #28160.
  `none` leaves dense
  weights on their normal asynchronous upload path, while explicit lazy mode
  still maps the architecture-marked PLE. **Do not rely on `auto`: inherited
  #28326 now disables it on HIP's integrated GPUs**. Their `mmap_support`
  capability is false; this is distinct from `buffer_from_host_ptr`, which is
  false even on discrete HIP devices. Explicit `on` still overrides the default.
  New 128 GiB Strix Halo reports show resident-target OOMs with `auto`, even at
  small context, while `on` loads successfully. This is not a guarantee that
  every quant/context fits; retain desktop and peak-load memory headroom.
- `q8_0` target KV was the best measured memory/performance tradeoff on this
  architecture. The MTP draft cache is left at its F16 default because the
  published tuned measurements did not validate a quantized draft cache.
  [PR #28378](https://github.com/ggml-org/llama.cpp/pull/28378) also documents
  that draft-cache quantization can enlarge compute buffers enough to increase
  total memory: one CUDA Qwen3.8-27B run used about 138 MiB more overall.
  Measure total memory, not just KV size, before adding `-ctkd`/`-ctvd`.
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
- a broad CPU tensor override for the PLE: b10872 already forces lazy tensors
  into their dedicated CPU context and deliberately ignores such overrides.

`-lm none -lzm off` is the controlled resident-PLE comparison. The identical
global load mode makes the lazy-mode toggle, rather than an unrelated dense
loader change, the main difference.

`--lazy-mode on-direct` is not present in this package. On September 8,
[PR #28136](https://github.com/ggml-org/llama.cpp/pull/28136) still has the same
reader-refactor head and no post-refactor approval. Its cold-cache evidence has
strengthened: earlier direct gfx1151 tests found +20–32% prefill, corrected
Windows tests found +91–133%, and Linux/Blackwell tests ranged from +167%
at 3K to +11% at 200K. A newer 24K Linux/Blackwell comparison reports about
2.07x cold prefill, while a Windows 25K real-prompt test reports +272% cold,
−4% warm, and +40% when accessing different PLE rows. Its MTP variant improved
cold prefill but left warm prefill and decode slightly slower. These are
non-HIP measurements, not a universal speed improvement or an A/B against
this package's carried prefetch implementation.

Memory headroom may also improve: an M5 Max 105K run accumulated about 232 MiB
of PLE page-ins instead of mmap's roughly 11 GiB burst. Conversely, a GB10
comparison favored threaded mmap+`WILLNEED` at both 37K and 140K. None of these
comparisons uses this exact page-merged readahead implementation. The reader
still recreates workers per gather and reopens model paths without identity/size
checks, so review and hardening remain necessary. If tested locally, disable
the carried prefetch call and compare separate builds to avoid duplicate I/O.
Its `pread` is buffered and still uses the kernel page cache despite the name;
it does not guarantee that PLE data will occupy no RAM.

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
24.7), and about 10% on a code-heavy MTP run (35.3 versus 39.3). The inherited
upstream loader later matched resident prefill on one direct-PCIe system,
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

## Experimental alternative target: Q4_K_XL-DN4

[`bitlamas/Qwen3.8-Flash-Next-Q4_K_XL-DN4`](https://huggingface.co/bitlamas/Qwen3.8-Flash-Next-Q4_K_XL-DN4/tree/374ee5752a4e5dd2b98ca76eafaec6e3b7af3105)
is a community alternative, not an updated Unsloth IQ4_XS release. The
September 8 review examined revision
`374ee5752a4e5dd2b98ca76eafaec6e3b7af3105`. It requantizes 48 expert-down
tensors from Unsloth's Q4_K_XL to IQ4_NL while retaining the other tensors,
including the same PLE table. Its four shards total **102.47 GB / 95.43 GiB**,
about **8.8 GB / 8.19 GiB more** than the recommended IQ4_XS target.

The publisher reports Wikitext-2 perplexity of 2.9165, versus 2.998 for IQ4_XS
and 2.9117 for Q4_K_XL, in a 24-chunk Windows/Vulkan comparison. Those numbers
are promising but do not establish better coding/reasoning or HIP performance.
It is a requantization of quantized weights, not a new BF16-derived calibration.
The author has requested an official intermediate quant in
[Unsloth discussion #67](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF/discussions/67);
there was no reply at this review.

Treat this as an optional quality/memory A/B candidate. Keep IQ4_XS as the
default for a non-dedicated 128 GB machine; SSD-backed PLE does not remove the
extra non-PLE weight cost. The target itself uses existing tensor formats, so
FR-Spec loader patches are unrelated to loading it. Compatibility and throughput
with this package still need local testing; no DN4 payload was downloaded or
audited here.

If evaluating it, pin the revision above, keep all four shards together in a
separate directory, and verify the publisher's hashes against Hugging Face
metadata. Retain the current F16 projector and full-vocabulary drluoto Q8_0
sidecar as the comparison configuration. Do not copy the model card's shared
Q4_K_M sidecar command: it uses another fork's tensor-sharing loader, which
this package does not carry. Hold prompt, cache types, MTP settings, context,
and PLE policy constant, and measure output quality as well as speed and RAM.

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

At the pinned `67de759` revision, the repository contained only `.gitattributes`,
a model card, and this GGUF; it contained no Python or custom model code. Newer
revisions add BF16, Q4_K_M, and the experimental FR-Spec sidecar below; the
original Q8_0 object remains unchanged. At its original audit, Hugging Face's
security status for the large GGUF was still queued/unscanned. A GGUF is data,
not a script, but any malformed binary format can exercise bugs in its parser.
The exact hash proves which bytes were downloaded; it does not independently
prove who produced those bytes or that the conversion claim is true.

The practical verdict is: this exact object is reasonable to use for local
inference with this patched package after verifying the hash. No malicious
content or structural anomaly was found. Provenance is community-attested rather
than reproducibly signed, so users who need stronger assurance should recreate
the sidecar from the official checkpoint as described below.

Do not substitute Unsloth's newer `*-shared-Q8_0.gguf` object. That smaller
layout borrows tensors from the target model and requires the still-unmerged
tensor-sharing loader in Unsloth [PR #144](https://github.com/unslothai/llama.cpp/pull/144).
[PR #142](https://github.com/unslothai/llama.cpp/pull/142) closed on September 8
in favor of that larger successor; it did not merge. This package does not carry that
loader, and review of the current implementation found a cross-device scheduler
ownership problem. Unsloth's self-contained Q8_0 sidecar is a separate format
candidate, but it is not yet a documented replacement here because it has not
passed this package's loader/hash/long-prompt smoke test. The pinned drluoto
object above remains the compatible default. Upstream draft
[#28243](https://github.com/ggml-org/llama.cpp/pull/28243) now pursues a similar
shared-tensor design, but new fitting, crash, acceptance, and output-identity
reports keep it below this package's inclusion threshold.

### Experimental FR-Spec 65K sidecar: not enabled in this package

The same [drluoto repository](https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF/tree/922dc15f622e301c29abcbcd49c1eaf937ae5230)
now publishes `mtp-Qwen3.8-Flash-Next-Q8_0-frspec-65k.gguf`, added September 6.
It retains the MTP head but reduces its output projection from 248,320 tokens
to 65,536 frequency-selected tokens. A `d2t` tensor maps each compact output
row back to the target vocabulary. The proposed graph restores full-vocabulary
logits, assigning negative infinity to omitted draft candidates. The target
still verifies proposals over its full vocabulary; it is not vocabulary-pruned.
Acceptance and performance remain workload-dependent, and this does not by
itself guarantee identical generated text under every sampler or backend.

| Artifact property | Value |
| --- | --- |
| Reviewed HF revision | `922dc15f622e301c29abcbcd49c1eaf937ae5230` |
| File size | 3,639,245,152 bytes, 3.64 GB / 3.39 GiB |
| SHA-256 / LFS object ID | `c9c505c1f68f008827a29733d5d2fe40a8170c324c676168831798b05217df4f` |
| Saving versus the current full Q8_0 sidecar | 503,652,096 bytes, about 0.50 GB / 0.47 GiB |
| Required fork | [`drluoto/llama.cpp:frspec-qwen4exp-strix`](https://github.com/drluoto/llama.cpp/tree/frspec-qwen4exp-strix), reviewed at `fb367b8cf2cf439326c8f77477ff65d01ba4816f` |

There is an additional format difference beyond vocabulary trimming. Read-only
HTTP-range inspection of the two pinned GGUF headers found:

| MTP layout | Current full Q8_0 (`b988022…`) | Published FR-Spec (`c9c505c…`) |
| --- | --- | --- |
| Tensor count | 37 | 36 |
| Input projection | Fused `blk.48.nextn.eh_proj.weight` | Separate `blk.48.nextn.fc_embd.weight` and `fc_hidden.weight` |
| Head mixer | `blk.48.nextn.hc_head_*` plus model-level `output_hc_*` | `blk.48.nextn.hc_*`, without the model-level mixer |
| Output projection | Q8_0, 248,320 rows of width 2,560 | Q8_0, 65,536 rows of width 2,560 |
| Vocabulary map | None | I64 `d2t`, 65,536 entries |

Our loader requires the fused projection and recognizes the current mixer
names. **Adding only the vocabulary-map hunks would not load the published
FR-Spec file.** A compatible trimmed copy generated from our pinned full
sidecar would preserve its existing layout and have a different hash and size.
The saving above compares the published artifacts, which also differ in layout.

The downloaded `d2t` payload contains 65,536 distinct, ordered IDs within the
248,320-token vocabulary. It matches the pinned producer's selection: 33,762
frequency-ranked IDs followed by 31,774 additional low IDs. This checks the
actual map, not just the model-card claim. Only metadata prefixes and the
524,288-byte mapping were inspected; the whole 3.64 GB file was not downloaded,
rehashed, executed, or subjected to a complete weight-content audit.

The publisher's same-stack Strix Halo **Vulkan**, Q5_K-target comparison reports
warm decode increasing from 27.4 to 29.9 t/s, cold decode changing from 29.3 to
28.9 t/s, and acceptance from 0.78 to 0.81. The larger 33.1 t/s figure also
includes other changes and is not the trimming-only gain. No matching HIP A/B
was published. These are reported measurements, not local validation.

**Do not substitute this file in the package's current commands.** The necessary
Qwen4-Exp loader/graph support is not carried. A smaller download is not an
automatic upgrade, and the author's multi-slot Vulkan command does not relax
this package's mandatory `--np 1` rule. The full Q8_0 sidecar remains the
compatible default; Unsloth's separate `*-shared-*` format is another feature
and is not required for FR-Spec.

#### Backport assessment: feasible, but not a straight cherry-pick

There is no inherent ROCm API blocker. b10853 already has `LLM_TENSOR_D2T`,
model storage for the mapping, and an analogous scatter in the EAGLE3 graph.
The Qwen port uses ordinary F32 fill/reshape/`SET_ROWS` operations supported by
the shared HIP backend, not `DeviceTopK` or a new custom kernel. Static review
found no added runtime network/shell activity in the trimming changes.

Reasons to adapt and validate the work before carrying it:

1. **Preserve this package's MTP implementation.** The fork uses the alternate
   split projection/mixer layout above. Its first trimming commit
   [`7a3aa1d`](https://github.com/drluoto/llama.cpp/commit/7a3aa1dd59f904d8f624afb13460715169838b65)
   does not apply cleanly to our prepared source. Its original scatter also
   went into the target graph; follow-up
   [`ebb3def`](https://github.com/drluoto/llama.cpp/commit/ebb3def772fe153b963f9be48cb81e0208a081f9)
   moves it into `graph_mtp`. Our port must use the MTP graph's selected output
   head while preserving `t_h_nextn`, mixed-F16 handling, and #28549 graph reuse.
   Importing the whole fork would pull in unrelated Vulkan/allocator changes.
2. **Validate the mapping at load time.** The fork primarily relies on shape
   checks and assertions; it does not validate every mapping value or duplicate
   destination before backend indexing. A packaged loader should check integer
   type, dimensions, output-row agreement, bounded vocabulary size, and unique
   in-range destination IDs, returning load errors rather than aborting. The
   valid published map above does not make arbitrary future maps safe. Keep
   this separate from RPC row-shape checks, which do not validate model maps.
3. **Avoid the ambiguous extra format.** The fork also treats a `d2t` whose
   length equals the full vocabulary as an inverse `t2d` gather map. That
   length-based convention is unnecessary for the published I64 forward-map
   file. A first backport can support only explicitly validated forward maps;
   an inverse format needs an unambiguous discriminator and its own checks.
4. **Separate the lifetime workaround.** Commit
   [`ff14610`](https://github.com/drluoto/llama.cpp/commit/ff146108d95b63edd345d0fc20970188cc37ce72)
   also marks MTP inputs as outputs to prevent allocator reuse. It affects
   untrimmed heads too and can increase memory retention. Its comment asserts
   HIP/Vulkan failures, but it is not independent evidence of the same failure
   in our current graph/scheduler stack. Establish whether that change is needed
   rather than bundle it as a mandatory part of vocabulary trimming.
5. **Measure the actual HIP tradeoff.** The graph still fills and produces
   full-vocabulary logits; only the expensive output projection is narrowed.
   Scattering, allocation, and possible backend transfers can erode the gain.
   Removing draft candidates also renormalizes their probabilities, so the same
   `--spec-draft-p-min` is not an identical confidence cutoff. Test multilingual,
   code, long-context, repeated-request, graph-on/off, and non-greedy workloads;
   do not infer universal output identity from a small greedy Vulkan benchmark.

The recommended next implementation is a **small opt-in forward-map backport
plus a trimmed derivative of the existing fused-layout sidecar**, not adoption
of the entire fork or an automatic switch to the published file. Preserve all
non-output tensors byte-for-byte and verify them. The supplied trimming script
also needs portable paths, input/type/count validation, and protection against
overwriting its input; it is developer tooling, not a ready packaged converter.
Then test valid graph reconstruction on CPU, retain unchanged behavior without
`d2t`, build HIP, and measure on gfx1151 before recommending the new artifact.
No runtime patch or provider change was made for this documentation/review.

### Start with pure MTP

Use a modest context first and keep all target and draft layers on the GPU.
`--np 1` is a required safety setting for MTP, not merely a starter value:

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
- for issue #28160, record first-prefill and steady-state decode separately,
  verify the startup buffer type, and repeat the `on`/`off` pair after a warm
  page-cache run; the reported regressions affected prefill while decode was
  unchanged;
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

python -c 'import numpy; print("NumPy", numpy.__version__); assert numpy.__version__.split(".")[0] == "2", "Use NumPy 2 for this conversion"'

python src/llama.cpp/convert_hf_to_gguf.py \
  /absolute/path/to/shard-scalpel/extracted-mtp/ \
  --mtp \
  --outtype q8_0 \
  --outfile mtp-Qwen3.8-Flash-Next-Q8_0.gguf
```

If `BUILDDIR` is customized in `makepkg.conf`, the prepared llama.cpp source is
under that build directory instead of `package-src/src/llama.cpp`. Install the
converter's Python dependencies listed as this package's optional dependencies.
Use **NumPy 2** for this local conversion, and check the interpreter used by the
converter rather than assuming the system package is active in a virtual
environment. [Issue #28438](https://github.com/ggml-org/llama.cpp/issues/28438)
reports sign corruption during large Q8_0/TQ1_0/TQ2_0 conversions with NumPy 1.x;
the reporter says NumPy 2 is unaffected. Current Arch supplies NumPy 2, so no
quantizer patch is carried. This report does not establish corruption in the
pinned preconverted sidecar and does not affect native inference of existing
GGUF files.

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
target and draft offload, KV types, sampling, `--np 1`, and ROCm build for every
row. Do not use multi-slot MTP numbers: #28286 shows that they can represent
cross-request state contamination rather than legitimate throughput.

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

For a fast developer A/B of #28040's context-scaling behavior, the roughly
324 MB random-weight [`Lynxpda/micro-qwen4exp`](https://huggingface.co/Lynxpda/micro-qwen4exp)
fixture discussed after #27977 is useful: it makes long-cache profiling and
deterministic byte-for-byte comparisons cheap. It cannot measure language
quality, MTP acceptance, or production throughput because its weights are
random. Keep the real target/sidecar matrix above as the decision benchmark.

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

The correctness follow-up also needs coverage outside plain short text:

- send a vision request with a nontrivial image and inspect details across the
  full image, exercising M-RoPE cells that share a text position;
- keep OpenAI `n=1` for the supported MTP path. If validating inherited QSA
  sequence copying with `n` greater than one, do it separately with
  `--spec-type none` and confirm every choice is coherent;
- exercise many sequential turns on the same single slot and investigate any
  unexplained output-length collapse; #28266 was withdrawn and is historical
  context rather than a current reproduction;
- monitor memory after many independent requests as well as one long chat.
  The now-closed issue #28436 reported gradual HIP memory growth even with
  speculation off, but closed for contribution-policy reasons without an
  isolated cause or technical fix. Confirm that ordinary allocator warmup
  reaches a stable plateau;
- when using video, verify that two different clips with the same textual
  instruction produce answers about the correct clip. Issue #28580 reports
  decoded video frames sharing an empty cache identity and reusing another
  request's visual prefix. No reviewed fix is available; avoid video prefix
  reuse in affected workflows and do not assume the text-only MTP reset fixes it;
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

The prepared `b10872` source includes a dedicated speculative-decoding client at
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
with `--bench throughput_8k --category all`, replacing the qualitative category
selection too: throughput splits use different categories. Increase `-c` so it exceeds input plus output
tokens. The SPEED-Bench script validates the available dataset configuration
names and will list them if a requested split is unavailable.

Use `--concurrency 1` with `--np 1` for every MTP measurement. Do not run a
multi-slot MTP throughput experiment: #28286 reproduced valid-looking content
from one request in another slot, and disabling HIP graphs did not stop it. To
measure non-speculative server throughput under load, remove `-md`, use
`--spec-type none`, and treat that as a separate target-only experiment rather
than an MTP comparison.

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

These proposals and issue reports were reviewed through 2026-09-09. They are
not additional package patches: some remain open, while closed, superseded,
or already-covered items are retained to explain earlier decisions. Revisit
the applicable open items on every base sync.

| PR or issue | Why it matters | Why it is not carried yet |
| --- | --- | --- |
| [#27530: failed state-restore cleanup](https://github.com/ggml-org/llama.cpp/pull/27530) | Cleans K/V and recurrent state after failed restores; the five-commit head is ready for review and its author requested workflow approval September 8. | No human approval or current gfx1151 failure-path validation. Relevant robustness work to watch alongside checkpoint persistence, but not a demonstrated MTP performance improvement. |
| [#28613: gfx1151 MMVQ thresholds](https://github.com/ggml-org/llama.cpp/pull/28613) | A small RDNA3.5 dispatch change reports Qwen3.8-27B IQ4_XS batched-decode gains of about 6%, 10%, and 20% at parallelism 4, 6, and 8, with 1,288 backend cases passing. | No human review or Flash-Next single-slot MTP A/B. Batch-width gains might help verification, but that is an inference, not a measured result; they do not justify enabling concurrent MTP. High-priority hardware test candidate. |
| [Draft #28616: HIP SWAR byte intrinsics](https://github.com/ggml-org/llama.cpp/pull/28616) | Replaces scalar byte-lane intrinsics with packed-integer operations. The author reports gfx1151 IQ4_XS gains of roughly 2–5% and larger IQ2_S gains on batched Qwen3.8-27B workloads, with 1,288 backend cases passing. | Unreviewed hot quantized arithmetic; subtraction changes from saturating to wrapping semantics. Require lane-boundary/type coverage and an isolated gfx1151 model comparison before importing. |
| [#27311: scheduler UMA ring buffer](https://github.com/ggml-org/llama.cpp/pull/27311) | The September 8 discussion established direct-host input reuse as the race mechanism. Review reproduced catastrophic pipeline-parallel perplexity regression; new head `dced2ff` claims to fix rotation and preserve graph replay. | No post-fix independent approval. Upstream chose the narrow #28604 host-compute disable while the general scheduler solution is reviewed. Do not re-enable direct-host compute or add this broad lifetime/synchronization change yet. |
| [#28601 / issue #28580: video frame cache IDs](https://github.com/ggml-org/llama.cpp/pull/28601) | A narrow maintainer-authored change propagates the video hash and frame number into bitmap IDs, so different videos with otherwise identical prompts do not reuse the first video's cached content. | Worth tracking as a correctness/privacy fix, but no human review or end-to-end video cache regression was available at the snapshot. Not needed for text/still-image MTP; await merge or isolated validation rather than add an untested multimodal path. |
| [Issue #28608: HIP vision Flash Attention](https://github.com/ggml-org/llama.cpp/issues/28608) | Large images reportedly trigger an aperture violation in the D=72 CLIP attention tile on dual gfx1100 GPUs. Disabling projector FA locally avoids it. | The report uses an older b10454 build, not current gfx1151. No reviewed fix; a generic compile-time HIP guard in shared mtmd is not a validated backend-specific remedy. Keep a large-image regression and do not globally disable text FA from this report. |
| [#28619: draft state missing from disk slot cache](https://github.com/ggml-org/llama.cpp/issues/28619) / [#26004: checkpoint persistence](https://github.com/ggml-org/llama.cpp/pull/26004) | Persistent target checkpoints do not automatically serialize or restore the MTP draft context; #26004 explicitly leaves draft-state persistence outside its scope. | Do not advertise disk-cache restore as a complete MTP warm restart. Require target/draft lifecycle tests and an owned fix; no new persistence patch is carried. |
| [Draft #28623: chunked QSA/multi-GPU experiments](https://github.com/ggml-org/llama.cpp/pull/28623) | Attempts bounded prefill scratch and changes sparse attention/selection. The author explicitly calls it incomplete and retains experimental toggles and test hacks marked for removal. | Unreviewed broad graph/kernel changes, with documented corruption when batch width exceeds selected attention width. Changing QSA top-k can also change model behavior. Not suitable for the package or its default configuration. |
| [Closed #28610: alternative Qwen4-Exp MTP](https://github.com/ggml-org/llama.cpp/pull/28610) | Another detached NextN loader/graph proposal appeared September 8 and was withdrawn September 9; the fork branch remains available. | Original-author permission/provenance concerns and no reviewed compatibility evidence with the carried sidecar layout. Do not replace #27836 or import a withdrawn aggregate patch. |
| [#28630: MTP-only plain KV allocation](https://github.com/ggml-org/llama.cpp/pull/28630) | Restricts draft KV allocation to NextN layers for DeepSeek2, GLM4-MoE, and Cohere2-MoE. | Useful for those models, but Qwen4-Exp already filters its draft cache. No additional Flash-Next memory saving; await upstream review/merge. |
| [Reopened #28462: build identity](https://github.com/ggml-org/llama.cpp/pull/28462) | The generic build-version proposal is open again. | This package already pins the tag's commit and bounds Git discovery; no additional identity patch is needed. |
| [Unsloth #201: checkpoint buffer pool](https://github.com/unslothai/llama.cpp/pull/201) | Reuses large host checkpoint buffers and trims during idle/cache eviction. | New fork-only allocation policy with no independent human approval. Host-RAM-based retention can exceed container budgets; on a shared 128 GiB machine retained pool memory is not free. Do not combine speculatively with inherited #28302. |
| [Unsloth #187: pipeline contexts](https://github.com/unslothai/llama.cpp/pull/187) / [#194: exact concurrency](https://github.com/unslothai/llama.cpp/pull/194) | Explores parallel contexts and byte-identical outputs under neighboring requests; new commits address cache races, recurrent grouping, and capacity checks. | Broad, actively changing scheduler/KV/backend work without independent approval. Review still exposes fit-accounting and unified-KV capacity problems. Not a demonstrated fix for #28286 on this stack; keep single-slot MTP. |
| [Unsloth #193](https://github.com/unslothai/llama.cpp/pull/193), [#196](https://github.com/unslothai/llama.cpp/pull/196), [#199](https://github.com/unslothai/llama.cpp/pull/199): RPC transport/upload work | Attempts to reduce RPC transfer overhead; new revisions address unsafe source-side dispatch, event reuse, host-buffer hooks, and RDMA registration/accounting. | No benefit to a local one-APU model. The broad transport/ABI and ownership changes need independent review, not merely automated approvals; do not enlarge the trusted RPC surface for speculative speed gains. |
| [Unsloth #203: RPC shutdown](https://github.com/unslothai/llama.cpp/pull/203) / [#202: invalid UTF-8 output](https://github.com/unslothai/llama.cpp/pull/202) | Narrower robustness proposals avoid teardown aborts and sanitize malformed generated UTF-8 before parsing. | Interesting follow-ups, not current HIP/MTP acceleration. Neither has human approval; validate resource cleanup and streaming/parser/serializer agreement before backporting, especially after the inherited parser split. |
| [#27977: closed Qwen3.8/QSA optimization umbrella](https://github.com/ggml-org/llama.cpp/pull/27977) | Its full five-change stack reported roughly +9% at 16K and +17% at 32K on gfx1151, and about +18% on one 24K MTP+n-gram file rewrite. Its random-weight [`micro-qwen4exp`](https://huggingface.co/Lynxpda/micro-qwen4exp) fixture remains useful for cheap context-scaling A/B work. | It closed after the author split the changes. The figures are for the combined stack, not every commit, and the fixture cannot measure language quality or MTP acceptance. Review split changes individually; #28040 is now inherited. |
| [#27897: mixed external drafter plus MTP initialization](https://github.com/ggml-org/llama.cpp/pull/27897) | Fixes the draft-algorithm list when embedded `draft-mtp` is combined with `draft`, `draft-dflash`, or `draft-dspark` and `-md` selects an external drafter; its gfx1151 reproduction is fixed. | It is an unreviewed draft and does not affect the documented pure `draft-mtp` or `draft-mtp,ngram-mod` sidecar workflow. Carry it only if this package starts supporting a mixed external-drafter configuration. |
| [#27694: probabilistic MTP/rejection sampling](https://github.com/ggml-org/llama.cpp/pull/27694) | The four-commit `b11dae7` head is now ready for review. New RTX 5090/DGX Spark measurements across temperatures report gains over greedy drafting, and a human reviewer has begun examining distribution correctness. | Not approved: review identifies RNG cloning, preserving proposal probabilities during replay, grammar renormalization, and correlated target/draft seeds. No gfx1151/Qwen4-Exp distribution or performance validation. Promising, but keep current sampling until those questions are resolved. |
| [#27692: speculative prefill](https://github.com/ggml-org/llama.cpp/pull/27692) | Uses a small drafter to discard apparently unimportant prompt chunks before the target prefill. Strix Halo Vulkan reports claim roughly 2–2.3x lower time-to-first-token at moderate thresholds. | The pruning is intentionally lossy, the PR is 21 commits and roughly 3,300 added lines, and a new report says output stopped around 80K while the GPU kept working. Its MTP compatibility question is unanswered, prior draft-state bugs make it high risk, and there is no HIP result or approval. |
| [#27861: GPU-resident LRU MoE expert cache](https://github.com/ggml-org/llama.cpp/pull/27861) | Reports gains when experts otherwise run on a discrete GPU's host CPU. A dual-RX6950XT Vulkan experiment reached about 19 t/s versus 8.2; a separate small-batch extension reached 21–24 with MTP. New dual-RX7900 ROCm profiling finds high hit rates can still leave substantially more synchronization and transfer calls with MTP. | The extensions are not the PR. Earlier larger-batch corruption and duplicate-slot/table-lifetime problems remain unresolved, and high hit rate alone does not establish a net gain. The cache is still an unreviewed draft and can duplicate UMA RAM; require safe indexing/lifetime and gfx1151 end-to-end evidence. |
| [#27825: internal HIP AllReduce](https://github.com/ggml-org/llama.cpp/pull/27825) | Can improve exactly-two-GPU HIP inference when RCCL is disabled. New dual-R9700 results report +17.45% prompt processing and +8.29% generation; dual RX 7700 reports +16.9% at 16K and +13.1% at 65K. | A single gfx1151 APU cannot benefit, and the approximate sleep-based synchronization remains unapproved. Revisit only if this package later targets two local AMD GPUs; RPC across Strix nodes is a different path. |
| [Closed issue #27021: gfx1151 wide-`TOP_K` and RPC stress](https://github.com/ggml-org/llama.cpp/issues/27021) | Fresh two-node gfx1151 validation of inherited #27466 passed boundary/oversized/tie/NaN cases, 500/500 CPU-reference comparisons, all 354 formerly skipped rows wider than 1024, and 128K/132K/256K RPC milestones. | It closed after confirming the native radix fix is already inherited, so no source patch is needed. The same test exposed two separate availability gaps with no owned patch: RDMA receive/poll has no peer timeout, and graceful shutdown can assert after an in-flight RPC failure. Track those before treating long-haul RPC as fault tolerant. |
| [#28128: closed flat QSA position scan](https://github.com/ggml-org/llama.cpp/pull/28128) | Replaces ordered-set predecessor lookup with a flat scan; a dual-A6000 130K result rose from 17.0 to 19.7 t/s. | It closed unmerged and unreviewed, with no gfx1151 isolation. It is an alternative to inherited #28040, not an established additive change; retain it only as comparative profiling evidence. |
| [#28130: sparse QSA gather](https://github.com/ggml-org/llama.cpp/pull/28130) / [Unsloth successor #165](https://github.com/unslothai/llama.cpp/pull/165) | Sparse gather was reported +41–45% at 129.6K on dual A6000 and about +75% when stacked with adjacent work. | Upstream #28130 was closed by a contributor-limit bot rather than technical review. The successor is broad, unreviewed, complex indexing code with no HIP/gfx1151 result or accepted provenance; a new user report says it no longer applies to the latest MTP branch and has no author answer. |
| [#28055: remove Linux `MAP_POPULATE`](https://github.com/ggml-org/llama.cpp/pull/28055) | Could reduce blocking and unnecessary page-cache pressure during ordinary mmap loads. It supersedes the narrower, now-closed [#27928](https://github.com/ggml-org/llama.cpp/pull/27928). | It changes loader policy globally and lacks controlled model-level evidence for this mixed lazy/non-mmap profile. The current base already avoids whole-model mmap in the recommended configuration. Its latest force-push is a patch-identical rebase, not new evidence. |
| [Merged #28326 / issue #28160: UMA lazy-buffer policy](https://github.com/ggml-org/llama.cpp/pull/28326) | Approved and inherited in b10872. The final patch only disables `auto` when a selected device reports `mmap_support=false`; the proposed `on`→`all` rename was withdrawn. | Strix Halo HIP now defaults to non-lazy loading. Keep explicit `-lm none -lzm on` for the documented SSD-PLE setup. New 128 GiB Strix reports of resident Q4-target OOMs make that distinction important; this policy change does not itself reduce PLE I/O latency or solve every loading-memory peak. |
| [#28136: direct buffered-read PLE](https://github.com/ggml-org/llama.cpp/pull/28136) | Adds `--lazy-mode on-direct` with deduplicated/sorted rows and concurrent buffered reads. Earlier gfx1151 tests found cold prefill +20–32%, warm neutral. New 24K Linux/Blackwell testing reports 2.07x cold prefill; a Windows 25K real-prompt test reports +272% cold, −4% warm, and +40% for different rows. Its MTP comparison improves cold prefill but not warm decode. | The unchanged `c6a9e5c` head remains the highest-priority SSD-PLE experiment, not a universal win or an A/B against our prefetch. Its old approval predates the reader refactor, which recreates workers per gather and reopens pathnames without identity/size checks. Buffered `pread` still uses page cache. Await post-refactor review, descriptor/TOCTOU hardening, a persistent pool, and current gfx1151 HIP testing. |
| [Closed issue #28256: pathological small PLE reads](https://github.com/ggml-org/llama.cpp/issues/28256) | A Qwen4-Exp model served from NFS over 10 GbE with NVMe FS-Cache fell below 1 prompt token/s because PLE lookup issued tiny reads, even at a 100% cache hit rate; fully warming the GGUF into RAM removed the slowdown. | It closed September 8 as expected lazy-mode behavior, not after a filesystem fix. Caching alone does not coalesce the access pattern. Keep models on fast local NVMe, measure actual disk latency, and continue watching #28136 rather than promising that every SSD-backed filesystem performs well. |
| [Unsloth #169: lazy mode overrides load mode](https://github.com/unslothai/llama.cpp/pull/169) | A report-only PR describes lazy mapping overriding `none`, `mlock`, or `dio` in that fork; one rotating-storage run fell from about 22 to 5 t/s. | Not a code fix. In our newer base #28326 disables implicit `auto` on HIP, but explicit `on` still overrides the global load mode. Continue setting both options deliberately and use local NVMe. |
| [#28233: preserve mmproj fit margin across sleep/resume](https://github.com/ggml-org/llama.cpp/pull/28233) | Prevents the vision projector's memory-fit safety margin from being subtracted again after every server sleep/wake cycle. This matters on a 128 GiB host running close to capacity. | The fix is small but unreviewed and validated through CPU/log behavior rather than a direct GPU offload/memory reproduction. It is not an MTP fix; await upstream review before altering shared fit policy. |
| [#28242: surface asynchronous initialization failures](https://github.com/ggml-org/llama.cpp/pull/28242) | Synchronizes after server context initialization so a deferred backend failure is reported during startup instead of after the server announces readiness and returns errors for every request. | It is a small generic robustness change, but unreviewed and manually tested only on Metal. Await HIP failure-path coverage and upstream review. |
| [Issue #28286: MTP cross-slot content contamination](https://github.com/ggml-org/llama.cpp/issues/28286) | Four concurrent `draft-mtp` requests on gfx1151/ROCm-TheRock 10.1 produced plausible text belonging to other slots. The reporter ruled out the client harness and reproduced with HIP graphs disabled; the same workload did not fail at `--parallel 1`. | This is a correctness and confidentiality failure in the still-draft MTP path, not merely bad output. Until a reviewed fix lands, `--np 1` and client concurrency one are mandatory whenever `draft-mtp` is active. The approved host-buffer guard does not fix this separate reproduction. |
| [Closed issue #28266: withdrawn multi-turn-collapse report](https://github.com/ggml-org/llama.cpp/issues/28266) | The earlier report described short-output collapse during streamed HIP/gfx1100 conversations. On September 4 the author deleted its body and closed the issue without a technical explanation or identified fix. | Preserve this as historical context, not a current reproducible bug or evidence that a fix landed. Multi-turn output-length and slot-reuse tests remain useful independently of this withdrawn report. |
| [Issue #28280: recurrent checkpoint livelock](https://github.com/ggml-org/llama.cpp/issues/28280) / [merged #28302](https://github.com/ggml-org/llama.cpp/pull/28302) | #28302 is now approved and inherited: it retains useful short-prompt checkpoints until the list fills and replaces duplicate positions. Earlier hybrid-conversation reports showed less re-prefill. | This can retain more checkpoint memory (up to the configured cap, default 32; one earlier run observed 596 MiB). No direct regression proves that the separate two-slot gfx1151 Vulkan livelock is fixed. Do not confuse checkpoint retention with MTP slot isolation. |
| [#28058: synchronize asynchronous graph inputs](https://github.com/ggml-org/llama.cpp/pull/28058) | Directly targets cross-request KV contamination on integrated GPUs; its first commit unconditionally synchronizes before graph-input mutation. A second commit rejects impossible mid-range recurrent erases and disables `--cache-reuse` for memories that cannot perform them. Independent gfx1150/ROCm 10 testing now confirms the synchronization diagnosis on another model family. | It remains a two-fix draft with no human review. Because the failure can cross request boundaries, it is security-relevant; keep the inherited #28604 host-compute exclusion until the commits are split or reviewed and HIP/gfx1151 concurrency, chunked-prompt, recurrent, and cache-reuse tests pass. |
| [#28061: avoid speculative replay livelock](https://github.com/ggml-org/llama.cpp/pull/28061) / [issue #28060](https://github.com/ggml-org/llama.cpp/issues/28060) | Prevents replayed accepted draft tokens from being verified a second time after checkpoint restore, avoiding a batch-shape-dependent speculative loop. | The PR was closed for missing original-author permission and never merged. The issue was later closed as completed without an owned replacement or code landing, so the technical diagnosis remains unresolved. Its reproduction is Strix Halo Vulkan, not HIP; retain multi-round HIP validation rather than treating issue closure as a fix. |
| [#28104: closed alternative Qwen4-Exp MTP port](https://github.com/ggml-org/llama.cpp/pull/28104) | Bundled replay handling, output gathering, and an on-device checkpoint experiment; one gfx1151 Vulkan 70K report claimed about +50%. | It closed without the required original-author permission or an authorized successor. Its checkpoint work is superseded by merged #28123, while the replay-livelock diagnosis remains tracked in issue #28060. |
| [Issue #28049: accepted tokens after EOG](https://github.com/ggml-org/llama.cpp/issues/28049) / [#28232](https://github.com/ggml-org/llama.cpp/pull/28232) | On a hybrid model, MTP tokens accepted after the first end-of-generation token can remain in the slot and force the previous answer to be prefetched again on reuse. Owned PR #28232 truncates at EOG before rollback/state updates and adds an n-gram regression. | This is separate from #28060/#28061. The unreviewed 104-line fix tests only a synthetic n-gram drafter, not MTP, hybrid recurrent checkpoints, multi-turn slot reuse, cache reuse, or HIP. The extra tokens are hidden from the client, so application-side output truncation cannot fix server state. Disable MTP for affected reused conversations, clear/restart server-side slot state between turns, or accept the redundant prefill while awaiting broader validation. |
| [Issue #27852: stale per-slot draft state](https://github.com/ggml-org/llama.cpp/issues/27852) | Reports stale n-gram and analogous MTP draft state surviving slot reuse; an explicit reset changed one affected run from 16 to 87 t/s. | There is no complete lifecycle fix or test; carried #28333 covers only the fresh-sequence MTP carrier. Reset/restart affected slots and benchmark multi-turn reuse; #28123 fixes recurrent rollback cost, not every per-slot drafter container. |
| [Issue #28139: prompt-cache lookup bypass](https://github.com/ggml-org/llama.cpp/issues/28139) | An empty explicit slot can yield NaN similarity and skip a usable entry. New CUDA and independent CPU/disk-cache tests also show a highly retained but much shorter slot suppressing lookup of a better prefix; one report reduced 162 seconds to 3 with a changed lookup gate. | There is no owned reviewed fix. Suggested threshold changes still miss intermediate-similarity cases and can trigger unnecessary cache saves. Require separate save/load policy and tests for empty, explicit, automatic, longer-prefix, and branching-conversation selection. |
| [Issue #28276: shorter restored slot hides a longer RAM-cache match](https://github.com/ggml-org/llama.cpp/issues/28276) | Restoring a shorter slot can take precedence over a longer in-memory prefix and force roughly 20K tokens to be prefetched again. | There is no patch yet. It primarily affects persistent or branching conversation latency, not steady-state single-slot arithmetic; include it in future checkpoint and disk-cache regression tests. |
| [#28175: large-grid norm kernels](https://github.com/ggml-org/llama.cpp/pull/28175) | Broadens the oversized-grid work from #28039 across NORM, RMS_NORM, L2_NORM, and fused RoPE kernels. | It is substantial shared-kernel churn tested only on an RTX 5070, with no review or HIP result. Merged #27941 already avoids the Qwen-specific launch shape; await gfx1151 testing and review before changing every backend's norm dispatch. |
| [#26004: persist recurrent checkpoints in slot files](https://github.com/ggml-org/llama.cpp/pull/26004) | Allows hybrid-recurrent state restored from disk to resume from a checkpoint. A gfx1151 Vulkan report reduced first restore from 181.9 to 4.7 seconds. | It is an unreviewed roughly 195-line state-format change with corrupt/mismatched-file, restart, MTP-sidecar, multi-slot, multimodal, and version-compatibility surface. Closed #28074 was a narrower duplicate. This affects restore, not steady-state decode. |
| [#28092: persistent disk prompt cache](https://github.com/ggml-org/llama.cpp/pull/28092) | Adds `--cache-disk` so prompt state can survive RAM pressure and server restarts. | At roughly 1,599 new lines it is a large, unreviewed parser/file-format and state-lifetime security surface. A new ROCm warning notes that handing the same `MAP_SHARED` pages to state-save can reproduce the GPU-DMA/writeback livelock seen in #26408 around 22K tokens; a maintainer's different chained-hash design is only half-working. Require format limits, corruption/fuzz, atomicity, HIP DMA safety, compatibility, recurrent, MTP, and multi-slot review. |
| [#28075: assign view-backed output ops to a compatible backend](https://github.com/ggml-org/llama.cpp/pull/28075) | Changes common scheduler placement when an op writes through a tensor view; the author says it lets Qwen4exp and three other previously skipped architectures pass `test-llama-archs` on WebGPU. | It is now ready for review rather than draft, but still has no focused HIP regression or gfx1151 result while changing shared scheduler behavior for every backend. Await review plus HIP multi-backend/RPC and view-backed-output tests. |
| [#28097: alternate Unsloth MTP sidecar layout](https://github.com/ggml-org/llama.cpp/pull/28097) | Loads a different head-only layout without trunk or mixer tensors and includes a speculative-model path cleanup. A new four-V100 rebased test reports coherent long output, but is not HIP validation. | It remains an unreviewed draft, conflicts with the carried `a82a58a`/drluoto layout, and has no conversion/interoperability decision. The apparent path fix is not needed by current in-tree callers: both first convert base parameters to draft parameters. |
| [#28243: upstream Qwen3.8 MTP successor](https://github.com/ggml-org/llama.cpp/pull/28243) | Reworks #27836 and lets smaller sidecars borrow target embeddings/output through `ctx_other`. The unchanged `d1a9235` head separates shared weights from shared KV memory. New CUDA reports range from shorter-context gains to −10% MTP at 128K despite 83% acceptance; another reports a 150K stall. Some tests include extra graph changes. | The 11-commit draft remains unapproved and leaves draft-head QSA as a TODO. Long-context speed/stability, earlier Metal divergence, shared-device/`--fit` concerns, and ownership questions lack current HIP validation. Keep the standalone-head stack; the separately carried #28549 graph-cache fix does not adopt shared tensors. |
| [Unsloth #144: shared-sidecar/MTP umbrella](https://github.com/unslothai/llama.cpp/pull/144) / [#152 loader mapping](https://github.com/unslothai/llama.cpp/pull/152) | #144 bundles alternate MTP, target-tensor borrowing, and CUDA graph keys. Its unchanged `a9e9c3c` head reads NextN before per-layer arrays; its CPU/CUDA feature matrix is clean. #142 closed September 8 in favor of #144, not as a merge. #152 remains at `b2b5ed9`. | Neither has human approval or new HIP evidence. #144 still has shared-tensor ownership, fit/accounting, and output-divergence objections, and malformed `nextn == block_count` still aborts; this package instead returns a catchable load error. #152 is mainly a Metal residency optimization because HIP already copies tensors individually. Do not replace the carried stack. |
| [#28099: missing `block_count` guard](https://github.com/ggml-org/llama.cpp/pull/28099) | Fails cleanly instead of aborting when a malformed GGUF omits architecture block count. | The small fail-closed change looks reasonable, but it prevents a local model-load denial of service rather than a remote package threat and has no review or regression test. Prefer upstream acceptance. |
| [#28109: Gated DeltaNet batch-invariance test](https://github.com/ggml-org/llama.cpp/pull/28109) | Adds a regression that checks recurrent output is invariant to batch partitioning. | It is draft, CUDA-only test work and changes no runtime source. Use it as a future HIP validation reference rather than a package patch. |
| [#28117: keep draft KV on GPU](https://github.com/ggml-org/llama.cpp/pull/28117) | Separately offloads the drafter KV even when the target uses `--no-kv-offload`; RTX 5090 reports rose from 19.2 to 27.2 t/s at 65K and 13.3 to 21.1 at 123K. | It silently changes an explicit memory-placement policy and can OOM constrained systems. There is no review or HIP/unified-memory result. It needs an explicit drafter option and memory accounting. |
| [#28118: on-device recurrent checkpoints](https://github.com/ggml-org/llama.cpp/pull/28118) / [JayToltTech follow-up](https://github.com/JayToltTech/llama.cpp/pull/1) | Avoids copying full recurrent checkpoints through host memory. The newer fork reports gfx1151 Vulkan improving from 4.33 to 16.08 t/s at 70K and CUDA by 61%. | Both variants predate merged #28123. On the current base, Qwen4-Exp's native recurrent rollback covers the normal configured draft range, so those checkpoint calls are only a fallback and should not be hot. The older draft can also hard-abort on fragmented ranges. Require a post-#28123 trace and A/B proving the fallback still executes before carrying either version. |
| [#28192: move NextN loading into selected architectures](https://github.com/ggml-org/llama.cpp/pull/28192) | Tries to narrow the generic #28159 metadata read after its initial array-sizing regression. | Merged #28173 already fixes that regression. The current unreviewed head restores loading for only Qwen3.5, Qwen3.5-MoE, and Qwen3-Next, leaving Gemma4 and this package's Qwen4-Exp MTP with zero NextN layers; it also adds aborting metadata assertions. Do not apply unless all existing NextN architectures and catchable failures are covered. |
| [#28149: fail cleanly on graph/allocation errors](https://github.com/ggml-org/llama.cpp/pull/28149) | Propagates generic graph-reservation and CLIP allocation failures instead of continuing into a later crash; now ready for review. | Still no human approval or automated OOM/retry regression. Await tests of state after failed reservation; this is robustness work, not demonstrated MTP/PLE acceleration. |
| [#27210: adaptive MTP depth](https://github.com/ggml-org/llama.cpp/pull/27210) | New seven-commit head `d236d41` responds to review and prevents stale acceptance feedback after checkpoint replay. The author rechecked two Qwen3.8-27B cases on delta-net hardware; older gfx1151 gains and MI50 losses remain workload-dependent. | No human approval. The series also changes shared recurrent snapshot writes, whose rewind invariant is still under discussion, and lacks the detached-sidecar fit predicate. Require current gfx1151 HIP correctness/performance tests and review; fixed measured depth remains the default. |
| [#26827: serialize multi-ubatch MTP decode](https://github.com/ggml-org/llama.cpp/pull/26827) / [issue #28252](https://github.com/ggml-org/llama.cpp/issues/28252) | Synchronizing when an MTP decode reaches its second internal ubatch stopped reported host hard-locks during 100K–184K catch-up on dual-3090 tensor split; the standalone issue now has an exact reproducer, causal isolation, and 3/3 successful 184K patched runs. | The stronger evidence is still multi-GPU CUDA-only, and single-GPU 3090 did not reproduce. The one-commit PR has no review; even narrowed synchronization may slow long catch-up on one gfx1151 device. Require a HIP reproduction or evidence that the affected overlap exists on a single APU. |
| [#28178: HIP small-copy compute kernel](https://github.com/ggml-org/llama.cpp/pull/28178) | Replaces same-type HIP D2D SDMA copies up to 16 MiB with an in-queue compute kernel; one copy-heavy gfx1103 Mamba2 workload reports about 29–195% decode gains while dense work stayed neutral. A Qwen3.5 GDN run with only two qualifying copies gained roughly 1%. | It is now ready for review but unapproved, default-active across HIP, tested on one non-Strix Windows APU, and the threshold is untuned. Broad copy tests passed, but there is no gfx1151 or Qwen4-Exp MTP run. Benchmark it separately before inclusion. |
| [#28303: gfx1151 F32 `CONCAT` transpose](https://github.com/ggml-org/llama.cpp/pull/28303) | Adds a narrow RDNA3.5 shared-memory transpose path for a prefill `CONCAT` shape. An actual 8060S/ROCm 7.1 run reports bit-identical output, 198/198 backend cases passing, +4.1–12.2% prompt processing, and neutral decode. | The one-commit, +132/-1 PR is new and unreviewed. A known small-channel shape regressed 4.25%, showing that its current width-only gate still needs refinement. Keep it as a high-priority isolated gfx1151 A/B rather than default package code. |
| [#28195: gfx1151 RDNA3.5 MMQ tile tuning](https://github.com/ggml-org/llama.cpp/pull/28195) | Table-only tuning of Q4_0/Q8_0/Q4_K/Q5_K/Q6_K has author-reported kernel gains. On September 8 a HIP maintainer expressed no objection to the configurations but lacked test hardware; another user volunteered testing. | Not approval or an independent result. IQ4_XS is untouched and changed configurations have `J >= 48`, while small MTP batches generally use `J=16`. Await end-to-end gfx1151 A/B, especially prompt processing, before carrying. |
| [#28213: Qwen4-Exp sparse QSA gather](https://github.com/ggml-org/llama.cpp/pull/28213) | Gathers selected K/V rows instead of scanning a dense long-context mask. The unchanged `beed2f7` head gates activation to deep single-token decode. New gfx1151 Vulkan isolation attributes much of a larger fork's gain to graph reuse, radix selection, and pooled keys; gather alone adds about 3% at 131K, while a two-Strix RPC comparison does not improve. | It remains unreviewed and excludes MTP verification batches; direct MTP and earlier Metal comparisons found no meaningful gain. F16 pooled-key experiments on other architectures can change selected indices, so adjacent optimizations are not automatically safe to combine. Require HIP/cache/multimodal checks and do not import the batched extension from comments. |
| [Closed #28244 / #28349: sparse QSA alternatives](https://github.com/ggml-org/llama.cpp/pull/28244) | #28244 reused the mask; #28349 tried a one-line sparse-FA hint. A new M2 Ultra comparison of #28349 reports roughly +20% prefill at 128K but −2–4% decode, illustrating that the earlier M5 gains do not generalize. | Both remain closed unmerged. #28349 closed after a maintainer requested broader device testing, and HIP has no sparse-FA consumer for its hint. Retain these measurements as design evidence without importing either patch. |
| [#28265: keep GDN output projection two-dimensional](https://github.com/ggml-org/llama.cpp/pull/28265) | Avoids flattening a GDN projection and reports exact-output ROCm gains of about 3.5–6.2% on Qwen3.8/Qwen3.6 when using four or eight slots. | Single-slot results are neutral to slightly negative, the PR is unreviewed, and MTP is restricted to `--np 1` because of #28286. It is therefore not useful for the supported MTP configuration; revisit only after the cross-slot correctness problem and separate #25992 race family are resolved. |
| [#28305: static MTP sampling graphs under no-realloc](https://github.com/ggml-org/llama.cpp/pull/28305) | Builds fixed sampling chains so MTP backend-sampling shape changes do not trip `GGML_SCHED_NO_REALLOC`. | This package does not enable that diagnostic environment mode. The new PR has no review or HIP overhead result, so keep it as validation/debugging work rather than production source. |
| [#28313: rewritten native ROCm `TOP_K`](https://github.com/ggml-org/llama.cpp/pull/28313) | Replaces the current native/hipCUB split with small, n-ary, and parallel-radix HIP kernels. Microbenchmarks report about 1.09–10.8× gains; the author intends it to supersede both #27466 and #26592 for `TOP_K`. | The unchanged `93ceb53` head remains unreviewed. On September 7 a HIP owner requested fresh gfx11 wave32 measurements and flagged the fixed wave32 path on GCN/CDNA. Tests still cover `k` only through 400 rather than QSA's roughly 2K, HIP graph tests are disabled, and no gfx1151 model-level result is posted. Keep native radix plus hipCUB pending correctness, graph, and performance review. |
| [#28358: Flash Attention vector-store race fix](https://github.com/ggml-org/llama.cpp/pull/28358) | Guards a q8_1 shared-memory store in the shared CUDA/HIP FA-vector kernel; its first commit can affect HIP at head size 64. | The two-commit draft is still unreviewed. A maintainer now explicitly requests the race logs; no response was present at this scan. Existing evidence and the second synchronization change are CUDA-only, and the demonstrated head shape is not the normal Qwen3.8 case. Await review and HIP validation; this is separate from inherited #27870's F16 barrier fix. |
| [#28339: gfx11-generic MMVQ launch sizing](https://github.com/ggml-org/llama.cpp/pull/28339) | Queries function attributes to avoid NaNs when a generic gfx11 code object has fewer available warps than host dispatch assumes. | Native gfx1151 passed 48/48 cases both before and after; this package emits only a native gfx1151 target. The unreviewed static per-device cache also deserves concurrency review. Track it only if the package ever switches to a generic gfx11 target. |
| [#28346: dynamic draft/mmproj weight swapping](https://github.com/ggml-org/llama.cpp/pull/28346) | Tries to evict draft weights and temporarily move multimodal projector weights into GPU buffers to create discrete-VRAM headroom. | The CUDA-centric draft changes 14 files by roughly +671/-18, repoints live tensor buffers, leaves audio untested, and expands lifetime/concurrency/`--fit` risk. Strix Halo has UMA rather than separate VRAM, so the central trade has no demonstrated benefit here. |
| [#28351: MTP importance-matrix conversion](https://github.com/ggml-org/llama.cpp/pull/28351) | Includes a teacher-forced study of 151K held-out tokens on Qwen3.8-27B: calibrating the MTP head improves draft/trunk agreement by about 0.0014–0.0017 at Q4, while Q6_K nearly matches BF16. It adds tooling to collect head statistics and compare draft agreement. | The six-commit draft remains unreviewed; its latest commit expands the notes, not Q8_0 evidence. The study did not measure Q8_0, Qwen4-Exp, live multi-step acceptance, or gfx1151 throughput, so it does not justify replacing the recommended sidecar. Revisit if lower-bit heads become a supported recommendation. |
| [#28003: RDNA3 MMVQ single-token fast path](https://github.com/ggml-org/llama.cpp/pull/28003) | Reports about 9.1% lower Q4_K GEMV time on gfx1100/RX 7900. | It is an unreviewed draft demonstrated on gfx1100 and Q4_K, not gfx1151 with the recommended UD-IQ4_XS mix. Architecture-specific kernel changes need direct validation. |
| [#28013: improve CUDA/HIP `IM2COL` access](https://github.com/ggml-org/llama.cpp/pull/28013) | Reads adjacent channels in one block and could speed the vision projector; its MI100 correctness run passed 92/92 cases and several gfx908/gfx1100 shapes improved. | The reported shape results are mixed, including regressions, and there is no gfx1151 or end-to-end Qwen3.8 vision result. Keep vision correctness more important than an unisolated micro-optimization. |
| [Reverted #24546](https://github.com/ggml-org/llama.cpp/pull/24546) / [approved successor #28552](https://github.com/ggml-org/llama.cpp/pull/28552) | The successor fixes expert-width accounting and moves selection logic to the host. JohannesGaessler approved `f01a754` after new RX 9060 XT measurements on September 8. | Its new selection condition explicitly admits RDNA3.0 and RDNA4, not RDNA3.5. Thus approval does not make it a gfx1151 optimization. No carry; revisit if the dispatch condition and an actual Strix Halo result change. The base still contains the original revert. |
| [#27962: HIP IQ2/IQ3 SWAR intrinsics](https://github.com/ggml-org/llama.cpp/pull/27962) | Replaces the fallback `__vsub4` sequence with smaller SWAR code and reports Qwen3.8 IQ3_S decode rising from 27.11 to 32.97 t/s on gfx1201. | A HIP reviewer now approves and clarifies that saturating subtraction was not actually a correctness bug; the benefit is smaller generated code. These intrinsics serve IQ2/IQ3 only, so they do not affect the recommended UD-IQ4_XS target or Q8_0 draft, and there is no gfx1151 result. Revisit if IQ3 becomes a recommendation or it merges. |
| [Closed #27936: narrower hipCUB SUM/MEAN path](https://github.com/ggml-org/llama.cpp/pull/27936) | Reports 8.8x and 10.4x gfx1151 reduction microbench gains and is a subset of the broad hipCUB work. It closed September 7 as a duplicate of #26592. | The package already carries equivalent reduction routing through #26592, so this adds no patch. Preserve the provenance; do not wait for a now-closed duplicate to merge or apply both implementations. |
| [#28129: batch CCCL `DeviceTopK` calls](https://github.com/ggml-org/llama.cpp/pull/28129) | Routes prompt-sized batches to row-parallel argsort instead of serial per-row `DeviceTopK`; dual-A6000 Qwen3.8 prefill improved about 20–27% at 31K–130K. | The author self-closed it without technical review shortly after automated contribution-policy warnings; the same work remains bundled in [Unsloth #165](https://github.com/unslothai/llama.cpp/pull/165). The tested rocPRIM 4.6 / hipCUB 4.7 stack has no CCCL 3.2 `DeviceTopK`, so this package already compiles the argsort-and-copy branch and the patch is currently a no-op. Revisit an owned successor when a future ROCm stack exposes `DeviceTopK`. |
| [#27196: speculative logprobs correctness](https://github.com/ggml-org/llama.cpp/pull/27196) | Aligns speculative-server logprobs with the actually accepted target tokens. | It matters only when clients consume logprobs, remains unmerged, and has no MTP/gfx1151 validation. Track it as API correctness work rather than a performance patch. |
| [#28131: closed `gguf-py` array-count hardening](https://github.com/ggml-org/llama.cpp/pull/28131) | Bounds declared GGUF array counts by the minimum encoded element size, turning a demonstrated 5.2 MiB malicious-file CPU parse from roughly 17 seconds into sub-millisecond rejection. | It was closed unmerged for the project's AI-submission policy, not technically disproven. It affects Python conversion/inspection tooling rather than installed native inference; retain the threat model, treat untrusted GGUFs as hostile, and await an eligible upstream implementation. |
| [#25557: symmetric Q8_0 conversion range](https://github.com/ggml-org/llama.cpp/pull/25557) | Changes Python/CPU Q8_0 creation from an asymmetric endpoint to `-128..127`; small-model tests report lower perplexity error while KLD is nearly unchanged. It could improve a future locally regenerated Q8_0 MTP sidecar. | The GGUF format and dequantization are unchanged, and the published drluoto sidecar bytes are unaffected. The functional commit remains unapproved and has no MTP acceptance measurement; the latest PR activity is only a master merge. Watch conversion quality rather than patching inference now. |
| [#28223: honor explicit host placement under mmap](https://github.com/ggml-org/llama.cpp/pull/28223) | Lets an explicit CUDA-host tensor override win under mmap; dual-3090 PLE prefill reportedly rose from 166 to 330–379 t/s. | It is now ready for review but still unapproved and code-identical. The CUDA/discrete test paid 96-to-488-second load time and about 89.6 GiB pinned memory. It does not fix automatic UMA placement, and an analogous HIP-host compute choice would conflict with the inherited HIP host-compute exclusion. Keep it out pending HIP safety and memory-policy review. |
| [Issue #28158 / rejected #28206: out-of-range speculative token](https://github.com/ggml-org/llama.cpp/issues/28158) | A gfx1150 Vulkan Qwen3.8 run emitted token ID exactly equal to vocabulary size and returned HTTP 500. | The failure is real but not yet reproduced for Qwen4-Exp on HIP. [#28206](https://github.com/ggml-org/llama.cpp/pull/28206) was a prohibited automated submission, rewrote unrelated converter infrastructure, added a 2,726-line backup file, and was closed; it is not a credible fix. Track an owned minimal patch and add token-boundary stress tests. |
| [#28389: CUB argsort key-aliasing fix](https://github.com/ggml-org/llama.cpp/pull/28389) | Separates input/output keys to address reported CUDA/old-CUB `TOP_K` corruption. This is relevant to the package's hipCUB argsort-and-copy route. | The unchanged `5b898c2` head is now ready for review but unapproved; an independent tester again cannot reproduce on mainline and requests a matching reproduction. rocPRIM 4.6's ordinary radix sort explicitly handles aliased keys; that does not prove every segmented path safe. Require matching HIP evidence before adding full-row scratch or claiming our current path is broken. |
| [#28383: MMQ tail-read bounds hardening](https://github.com/ggml-org/llama.cpp/pull/28383) | Clamps activation/expert-ID tail reads and adjusts padding in shared CUDA/HIP quantized matrix kernels. The author reports previously crashing cases fixed and thousands of backend cases passing on RTX 4090/5090. | The four-commit head was rebased to `bb3c275` on September 7, without new approval or HIP results. It changes hot kernels and allocation padding; require an isolated gfx1151 correctness/performance comparison before carrying the aggregate change. |
| [Closed #28366: radix TOP_K for older CUDA](https://github.com/ggml-org/llama.cpp/pull/28366) | Proposed native radix selection for CUDA without CCCL 3.2 while explicitly preserving HIP behavior. It closed unmerged September 8 and the source repository was deleted. | No additional HIP benefit. Retain the provenance but follow the independent #28313 native HIP rewrite, not this closed branch. |
| [#28398: HIP Q1_0 unpack optimization](https://github.com/ggml-org/llama.cpp/pull/28398) | A gfx1201 Q1_0 workload reports decode rising from 29.4 to 61.7 t/s with arithmetic sign expansion and hardware byte permutation. | Reviewers are still refining the baseline and implementation. It has no approval or gfx1151 result and does not affect the recommended IQ4_XS target or Q8_0 draft. The headline gain is specific to Q1_0 on gfx1201. |
| [#28432: MoE fusion allocation dependencies](https://github.com/ggml-org/llama.cpp/pull/28432) | Adds lifetime dependencies so the shared CUDA/HIP top-k MoE fusion can match more graphs. | It is new and unreviewed, may increase compute-buffer allocation, and has no posted correctness or performance results. Require gfx1151 tests before changing fusion/lifetime behavior. The similarly named fusion is distinct from the generic QSA `TOP_K` operation. |
| [Merged #28390: single-device draft Meta wrapper](https://github.com/ggml-org/llama.cpp/pull/28390) | Avoids an unnecessary Meta backend for a single-device drafter inheriting target tensor splitting; unspecified draft devices follow the target device selection. | Approved and inherited in b10872. No extra patch or profile change is needed for one Strix Halo GPU. |
| [#28391: n-gram speculation enabled by default](https://github.com/ggml-org/llama.cpp/pull/28391) | Makes `ngram-mod` a default and changes `--spec-type` to add algorithms instead of replacing the list. | Maintainers raise hybrid rollback costs and cases where MTP alone wins. It would silently add n-gram work to documented pure `draft-mtp` commands. Keep explicit algorithm selection while the unreviewed draft is discussed. |
| [#28378: draft-KV quantization memory warning](https://github.com/ggml-org/llama.cpp/pull/28378) | Documents that smaller draft KV can be outweighed by larger compute buffers: one CUDA Qwen3.8-27B case used about 138 MiB more overall after draft-cache quantization. | The documentation draft has one approval, but contains no inference fix. Apply the measurement lesson locally: compare total memory before adding `-ctkd`/`-ctvd`; savings in cache size alone are insufficient. This is not a universal regression across draft architectures. |
| [#28414: host expert prefetch](https://github.com/ggml-org/llama.cpp/pull/28414) | Attempts to overlap host expert uploads; an independent multi-GPU run produced repeated `/`, and the author now acknowledges the multi-GPU implementation does not work. A reviewer asks for a mmap baseline before reviewing. | Still a draft with no demonstrated fix or HIP evidence. Successful allocation can expose the wrong-output path that allocation failure hides. This is expert staging, not SSD-PLE row prefetch; do not carry. |
| [#28392 / #28413: FP8 KV cache and CUDA implementation](https://github.com/ggml-org/llama.cpp/pull/28392) | Introduces OCP FP8 caches and optional static scales, with [CUDA kernels in #28413](https://github.com/ggml-org/llama.cpp/pull/28413). | Both are unreviewed drafts with additional format dependencies, Blackwell-only measurements, and reported decode regressions against another FP8 route. No HIP/gfx1151 validation justifies changing the documented cache types. |
| [#28371: grammar memoization](https://github.com/ggml-org/llama.cpp/pull/28371) | Reports eliminating a severe ambiguous-grammar stall while keeping ordinary grammar benchmarks neutral. It could improve structured-output latency and availability. | The unreviewed implementation has recently changed cache lifetime and retains entries for a whole request. Require ownership/memory-growth review and stable regression coverage before importing a new core grammar cache. |
| [#28405 / #28406 and UI discovery follow-ups](https://github.com/ggml-org/llama.cpp/pull/28405) | Improves quant/sidecar resolution and cache listing/removal; [#28406](https://github.com/ggml-org/llama.cpp/pull/28406) adjusts downloader-thread locking. [#28407](https://github.com/ggml-org/llama.cpp/pull/28407) separately adds opt-in sanitized model-card HTML. | These unreviewed changes expand deletion matching, download lifetimes, and rendering policy; they do not improve MTP inference. Existing explicit `hf download` commands suffice. Follow the split series rather than importing the superseded #28374 umbrella or the growing discovery stack. |
| [Issue #28438 / #28523: NumPy 1.x conversion corruption](https://github.com/ggml-org/llama.cpp/pull/28523) | Reports sign corruption in large Q8_0/TQ1_0/TQ2_0 conversions from NumPy 1.x temporary elision. #28523 avoids the in-place sign loss; subsequent discussion narrows the reproduction to affected NumPy 1.x platform/build behavior, not every 1.26 installation. | The fix is unreviewed and NumPy 2 is unaffected in the reported tests. Use NumPy 2 for local conversion; current Arch already provides it, so no quantizer patch is carried. This does not establish corruption in the pinned sidecar or change native inference. |
| [Closed issue #28436: per-request HIP device-memory growth](https://github.com/ggml-org/llama.cpp/issues/28436) | Reports roughly 2–3 MiB of growth per independent request across multiple architectures, including with speculation disabled. It closed September 5 following contribution-policy moderation, not a technical diagnosis or code fix. | The report remains unverified and has no isolated cause or patch. Keep repeated-request memory-plateau measurements; do not attribute growth solely to MTP or claim that issue closure means the package fixes it. |
| [Issue #28425: recurrent rollback outside speculation](https://github.com/ggml-org/llama.cpp/issues/28425) | Reports failed partial rollback and growing-chat problems when hybrid/recurrent models run without speculative decoding. The reporter separated an independent HIP memory-growth symptom into #28436. | No reviewed replacement exists. The carried #28007 recovery guard addresses one rollback-refusal path, not every reported cache lifecycle. Keep non-MTP long-conversation testing alongside MTP tests. |
| [Issue #28433: total versus per-slot MTP context sizing](https://github.com/ggml-org/llama.cpp/issues/28433) | Reports a large-context, multi-slot gfx1151 Vulkan MTP failure and proposes using per-sequence context size for the draft. | The proposed one-line change is unvalidated and may alter the intended total-context contract. `--np 1` avoids the reported slot multiplier; keep that restriction and await an owned, tested fix. |
| [Issues #28370 / #28376: MoE kernel NaN and ordering reports](https://github.com/ggml-org/llama.cpp/issues/28370) | Raise expert-ID write divergence for NaN selection biases and a separate CUDA warp-ordering concern. Reviewed [#28475](https://github.com/ggml-org/llama.cpp/pull/28475) now supplies the latter's synchronization helper and is inherited. | #28475 deliberately makes the helper a no-op on HIP under its existing non-divergent-warp assumption; it is not a measured Strix speedup. The NaN-selection report remains separate and has no reviewed gfx1151 fix. |
| [Issue #28429 / #28483: tool argument grammar-name collisions](https://github.com/ggml-org/llama.cpp/pull/28483) | Sanitized grammar names can collide and silently replace tool parameters. This affects non-ASCII names and ASCII pairs such as `my-param`/`my_param`. #28483 makes duplicates fail instead of replacing the earlier rule. | The fail-closed proposal has reported Windows tests but no human approval. ASCII alone is not sufficient: use names that remain distinct after sanitization, inspect generated schemas, and await the reviewed fix rather than adding a collision-prone hash workaround. |
| [Closed issue #28400 / #28463: query-only downloader URLs](https://github.com/ggml-org/llama.cpp/pull/28463) | Reports incorrect authority parsing when a URL has a query but no explicit path. #28463 proposes parsing query, fragment, and authority boundaries consistently. | The proposal closed unmerged without human approval, so no generic parser fix is inherited. The documented Hugging Face URLs include paths and are unaffected by this reported shape; retain the issue as historical parser work rather than adding an ad-hoc rewrite. |
| [Unsloth #182: speculative indices during sub-batch retry](https://github.com/unslothai/llama.cpp/pull/182) | Adjusts speculative logits indices when KV pressure splits a batch, avoiding one multi-slot bounds error. Its fourth commit falls back to ordinary sampling when a whole speculative block cannot fit. | There is no human approval, and automated review identifies unverified draft tokens left in prompt/cache/batch state by that fallback. The author's bare-server stress still completed 0/4 chats without adjacent changes. This is not a demonstrated fix for #28286; keep `--np 1` and await complete rollback/state validation. |
| [#28229: benchmark error visibility](https://github.com/ggml-org/llama.cpp/pull/28229) | Corrects `llama-bench` verbosity filtering so backend errors are visible; a reviewer approved the current head on September 4. | It improves diagnosis rather than inference performance or safety. Inherit it when merged; an additional temporary patch is not needed for the package's explicit build/test log checks. |
| [#28574 / issue #28537: gfx1151 direct-host compute](https://github.com/ggml-org/llama.cpp/pull/28574) | Proposes the host-buffer exclusion specifically for gfx1151 after wrong logits in mixed prompt/decode workloads. | Subsumed by inherited #28604, which disables direct host-buffer compute on HIP. The former #25863 package patch is removed, not narrowed. No duplicate is needed; the separate MTP cross-slot report #28286 remains unresolved. |
| [#28473: cap drafts by remaining output budget](https://github.com/ggml-org/llama.cpp/pull/28473) | Avoids producing a full draft when only a few target tokens remain; an author test cuts eight draft decodes to one with identical output. | It is unreviewed and principally helps short final rounds. Author tests do not establish gfx1151 benefit or fix concurrent MTP state; keep the existing output-budget behavior until reviewed. |
| [#28550: recurrent `no_alloc` sizing](https://github.com/ggml-org/llama.cpp/pull/28550) | Honors the no-allocation flag for recurrent memory during fitting/sizing, intended to avoid allocating real state in a sizing pass. | The small generic change lacks public regression tests and human review. Watch allocator correctness without treating a personal-fork OOM report as a validated gfx1151 fix. |
| [#28498: serialize KV rotation dimensions](https://github.com/ggml-org/llama.cpp/pull/28498) | Saves exact K/V rotation dimensions and rejects incompatible restore settings; it is groundwork for #28267's staged F16-to-Q8 cache conversion. | It is unreviewed and changes saved-cache versions/compatibility. Require restore, mismatch, recurrent/MTP, and HIP tests; this is KV-cache format work, not SSD-backed PLE. |
| [Issue #25187: trim the MTP draft vocabulary](https://github.com/ggml-org/llama.cpp/issues/25187) | Computes the draft output projection over a frequency-selected vocabulary while the target still verifies full-vocabulary tokens. A Qwen4-Exp Strix Halo Vulkan port reports about +9% warm decode; a 3.64 GB 65K sidecar is now published. | [The dedicated FR-Spec review](#experimental-fr-spec-65k-sidecar-not-enabled-in-this-package) confirms that the published file also changes the MTP tensor layout. Its forward map is valid, but loader validation and HIP evidence remain insufficient. Prefer a narrow hardened backport plus a trimmed copy of our compatible fused-layout sidecar; do not replace the current download or import the whole fork. |
| [#28569: restore Qwen4-Exp tensor splitting](https://github.com/ggml-org/llama.cpp/pull/28569) | Expands the hyper-connection view before CPU PLE gather. New dual-RX 9060 XT and MI50 HIP results join the earlier two-Strix Vulkan/RPC test. | Still no human approval or isolated MTP regression. Auto-fit/tensor-split combinations can still OOM. The single-APU setup does not require tensor splitting, so retain upstream's restriction pending review. |
| [#28571: cache RPC operation support](https://github.com/ggml-org/llama.cpp/pull/28571) | Replaces many short support-query connections with signature-based caching and a protocol update. A two-Strix Vulkan test reports a large load-time reduction and broad backend checks. | It changes RPC protocol, capability assumptions, and cache lifetime without human approval or HIP/MTP validation. Do not infer that faster loading makes RPC authenticated or fault tolerant. |
| [#26724: return errors after RPC peer failure](https://github.com/ggml-org/llama.cpp/pull/26724) | A new independent CPU-loopback test reports avoiding client aborts after peer loss. | The same test reports an unverified anomalous token before graph failure and a process-lifetime failed-endpoint latch. No human approval resolves those state/output semantics. Watch availability improvements, but do not import a non-aborting path that can still return wrong output. |
| [Issue #28580: video prefix-cache identity](https://github.com/ggml-org/llama.cpp/issues/28580) | Reports different videos with identical textual instructions reusing the first video's visual prefix because decoded frames have empty media identities. Unique text and still-image controls did not reproduce. | There is no owned reviewed fix; a patch in comments is only a proposal. Avoid video prefix reuse in affected workflows and check responses against the actual clip. Text-only slot resets and host-buffer guards do not establish video-cache isolation. |
| [Issue #28497: CUDA QSA tied `TOP_K`](https://github.com/ggml-org/llama.cpp/issues/28497) | Reports CCCL `DeviceTopK` choosing different boundary cells among tied QSA scores across greedy requests; CUDA stable-radix comparisons restore repeatability. | This is a CUDA/CCCL path, not the tested HIP hipCUB argsort-and-copy implementation. No reviewed fix is available. Retain tie/order checks after library changes without adopting an unreviewed score perturbation or claiming current HIP output is affected. |
| [Issue #28513: backend sampler capability probe](https://github.com/ggml-org/llama.cpp/issues/28513) | Reports that a very wide capability probe rejects a sampler whose actual post-`TOP_K` input is small, and that the public setter can report success after backend initialization fails. | There is no owned reviewed fix. Current hipCUB already provides the wide argsort route, so do not apply a hard-coded probe-size workaround. Track API result handling and actual-shape validation. |
| [#28532: slot-linger scheduling](https://github.com/ggml-org/llama.cpp/pull/28532) | Defers prefills while active slots approach completion; Intel Arc synthetic tests report higher aggregate throughput. | New review flags FIFO inversion, starvation and sleep/wake queue behavior; the author accepts issues but the head remains unchanged. No approval or HIP result, and it does not benefit mandatory single-slot MTP. Keep out. |
| [Issue #25618 / draft #28488: batch invariance](https://github.com/ggml-org/llama.cpp/pull/28488) | Adds tests exposing Vulkan output differences across batch shapes; a separate CUDA greedy comparison differs only near equivalent token choices. | This is test work, not a runtime fix or HIP validation. Use it to guide batch/prefix-cache comparisons; divergence alone does not establish corruption without checking logits and output coherence. Related CUDA cache reports #28524/#28526/#28527 have no reviewed fix or demonstrated gfx1151 impact. |

The carried-patch table is the source of truth for changes that crossed the
inclusion threshold. Approved and merged #28023, #28123, and the complete
#27941 series are inherited by the current base, so they add no package patch or separate
remote source. The same is now true of #28040, #28030, #28159 plus #28173,
#28183, #25952, #27483, #28323, and now #28270's Web UI build hardening and
#28271's backend-search robustness. Approved #27200 remains a checksum-pinned
patch. b10853 also inherits #27870's F16 Flash Attention barrier correction,
#28387's scheduler input-limit removal, and #28068's GDN normalization fix;
their separate package patches are removed. This sync newly carries approved
#28549's separate MTP graph-cache identities, alongside #28330's indexer-cache
saving and #28333's fresh-sequence MTP reset. The RPC
graph-shape guard is local hardening based on #26933, with its narrower
security scope described in the carried-patch table.

Several previously watched items are now inherited. The lazy-loader follow-up
[#27837](https://github.com/ggml-org/llama.cpp/pull/27837) is approved, merged,
and has been in the baseline since b10705; it removed the need for the package's
per-buffer mmap patch. [#28011](https://github.com/ggml-org/llama.cpp/pull/28011)
is merged into b10712, so the formerly carried copy has been removed. Its
isolated gfx1151 improvement—about +1.2% at 4K, +2.9% at 16K, and +4.1% at
32K—is smaller than #27977's combined figures, which is exactly why the two
sets of numbers must not be compared as if they represented the same patch.
b10729 also inherits #27466's native HIP radix path and #27991's batched
non-contiguous KV restore; both were therefore removed from the carried/watch
lists. b10730 adds #28023, b10731 adds #28123, b10737 adds #27941, b10751 adds
the later inherited work enumerated above, b10778 adds #27483, and b10796 adds
#28323. b10819 added #28270 and #28271; b10853 adds #27870, #28387, and
#28068. Those three removed carries have matching stable patch IDs against
their merged equivalents. #24546 was merged and then reverted, so its MMQ
tuning is not active in the selected base.

For historical clarity, [#27928](https://github.com/ggml-org/llama.cpp/pull/27928)
closed in favor of #28055, and [#27974](https://github.com/ggml-org/llama.cpp/pull/27974)
and [#27874](https://github.com/ggml-org/llama.cpp/pull/27874) are narrower or
closed hipCUB approaches already superseded by the broader
[#26592](https://github.com/ggml-org/llama.cpp/pull/26592).

The September 9 review selected `b10872`: 19 upstream commits, 62 changed files,
3,565 additions and 2,582 removals since b10853. The public updated-issue search
snapshot contained 214 entries since September 8; new candidates through #28631
were screened, alongside 26 recently updated Unsloth entries. Changed tracked
discussions were read using paginated public timelines, review bodies and inline
threads, with an overlapping September 8 cutoff. Forks were checked separately;
hidden/deleted or sign-in-only moderated comments remain inaccessible. Changes
in a PR's timestamp alone are not treated as new code or approval.

No new unmerged carry met the inclusion threshold. Existing #28549, #27836,
#28333, #28330 and the functional hipCUB/PLE pins remain unchanged. The worthwhile
checkpoint, lazy-policy, host-compute and draft-device fixes are now inherited.
Direct-read SSD-PLE #28136 still has no post-refactor approval; the September 9
Windows-port cross-reference is not that missing review or a gfx1151 HIP result.

For historical context, the September 8 review selected `b10853` and examined all 34 upstream commits
since the interrupted `b10819` checkpoint. The updated-issue search snapshot
contained 428 issues/PRs with activity after September 5 at 13:40 UTC. Relevant
new proposals through #28595 were screened, and changed tracked discussions
were read with public timeline pagination, review bodies, deferred/resolved
inline threads, and issue timelines. Old moderated comments hidden behind
sign-in were unavailable. Fork and Unsloth discussions were checked separately;
the relevant open and historical decisions are retained above.

That earlier base brought CMake Web UI asset embedding, router-queue recovery,
shared Q4_K/Q5_K unpack changes, and model/conversion fixes. Its Kimi-K3
rollback is architecture-specific; its new warp-synchronization helper is
deliberately a no-op on HIP. Neither is a fix for Qwen MTP slot isolation.
#28549 was its only new carry; no new SSD-PLE, adaptive-depth, sparse-gather,
or native `TOP_K` rewrite met the inclusion threshold. The reviewed graph
change still has no measured local gfx1151 gain. Other backends and models
were screened for relevance rather than imported indiscriminately.

In particular, unfinished gfx1201-only rocWMMA #28102 does not target gfx1151;
#28181 is ppc64le-only; #28227/#28228/#28235/#28236/#28240 are disabled-backend
or cleanup work; and #28238 changes only Q4_1/Q5_1 conversion, not the Q8_0 MTP
sidecar. #28229 improves benchmark error visibility but does not change
inference. New #28218 reports a Windows/CUDA tensor-split speculative slowdown
with no HIP cause or patch, while #28241 is an old Turing CUDA CPU-MoE crash;
neither matches the documented single-device Strix Halo path. The relevant
#28232, #28233, #28242, #28243, #28265, #28302, #28303, #28305, #28313,
#28326, #28339, #28346, #28351, and #28358 candidates are retained in the
watchlist, while #28231 and #28323 are inherited and #28330/#28333 are carried.
WIP [#28267](https://github.com/ggml-org/llama.cpp/pull/28267) overlays a Q8 KV
allocation with F16 until the F16 view fills. Its newer four-commit head fixes
state restore, converts only the cache needing expansion, and supports
standalone Gemma4. Conversion still stages through host memory, with a
temporary RAM spike and pause; this remains unreviewed KV-cache work, not
SSD-backed PLE, and is excluded. Its author now plans the separately watched
#28498 rotation-format prerequisite. Issue
[#28299](https://github.com/ggml-org/llama.cpp/issues/28299) concerns Web UI
`/tools` polling receiving 403 responses and potentially triggering fail2ban;
it has no source fix and is operational watch material, not an inference patch.
No current llama.cpp PR adapts this route to rocPRIM 4.6's native top-k API.
The carried hipCUB integration compiles full GPU argsort plus truncation when
CCCL 3.2 `DeviceTopK` is unavailable, as in the tested nightly; the graph's
`TOP_K` operation does not require that library API. #28313 proposes specialized
llama.cpp-owned HIP kernels, while #28366 changes only the older-CUDA fallback.

The same scan found that #28244 and its one-line sparse-FA successor #28349
both closed unmerged; newly approved #28334 only removes deprecated load-mode
aliases that this README no longer uses; and #28345 is resolved by inherited
#28323. New #28576 targets CDNA/MI100 Flash Attention, #28447 targets RDNA4
GDN, #27841 tunes GCN MMQ, and #28450 is SYCL-only: none supplies a gfx1151
HIP improvement. #28578 changes CUDA virtual-architecture dispatch, not this
native-only HIP build. #28462's build-identity proposal has reopened, but
the package's existing explicit metadata and Git discovery boundary remain
necessary. The
470-commit [#28359](https://github.com/ggml-org/llama.cpp/pull/28359) was closed
almost immediately and is categorically unsuitable as a package patch: its
53K-line, 247-file history is not meaningfully auditable for the claimed
sidecar fix. Static sampling found no clear malware indicator, but that is not
a substitute for review, so none of it is sourced. Issue #28338 concerns
CUDA VMM and reinforces rather than changes this package's explicit no-VMM
policy. Issue #28355 has now closed after its reporter accepted that lazy-mode
defaults explain the nonresident PLE and cold-prefill cost; it was not evidence
of missing model weights. This reinforces setting `-lzm` explicitly.

The scan also rejected
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

The current base makes this experimental cleanup even less attractive: `-lm none` does
not map or populate the dense model at all, while the lazy PLE keeps its normal
mapping lifetime. Clean pages in that mapping remain reclaimable. The package
therefore accepts a potentially higher transient/warm-cache footprint instead
of adding unsafe range-lifetime logic.

## Known limitations and rollback

- All eleven remotely sourced functional patches are snapshots. Recheck their
  upstream PRs and fork commits when updating the llama.cpp tag; remove a
  package patch once an equivalent fix is upstream. Revalidate all four local
  adaptations against the exact new base rather than allowing fuzzy patching.
- `draft-mtp` is restricted to `--np 1` and client concurrency one. Issue
  #28286 directly demonstrates cross-slot content contamination on gfx1151 at
  higher parallelism, including with HIP graphs disabled. The output can look
  plausible, so this is a confidentiality boundary, not a performance caveat.
- The MTP graph currently uses dense attention in the draft block. Draft cost
  therefore grows with context even though the target's QSA is sparse.
- Native recurrent rollback allocates and constructs `n_rs_seq + 1` state
  planes. Ordinary draft depths are small, but an absurd local
  `--spec-draft-n-max` can still exhaust memory; it is not remotely selected.
- Upstream issue #28049 reports that draft tokens accepted after the first EOG
  can survive in a hybrid slot and trigger a redundant re-prefill on reuse.
  They are not returned to the client, so client-side truncation cannot repair
  the slot. Draft PR #28232 now owns a proposed fix, but it has no hybrid-MTP or
  multi-turn regression yet. Until that path is reviewed, disable MTP for
  affected reused conversations or clear/restart server-side slot state between
  turns, and test repeated slot reuse explicitly.
- Issue #27852 describes stale per-slot n-gram and MTP draft state that can
  survive reuse and collapse performance. Carried #28333 now zeros the pending
  MTP carrier whenever a sequence starts at position zero, closing its directly
  reproduced first-response leak, but it does not prove every n-gram or
  drafter-owned cache is reset. Include repeated slot reuse and explicit
  reset/restart comparisons in production validation.
- Issue #28266's earlier streamed multi-turn short-output report was withdrawn
  and deleted by its author without explaining a cause or fix. Keep it as
  historical context; independently validate output length and coherence over
  the whole expected conversation.
- Issue #28280 reports a shared server-checkpoint livelock on a two-slot
  gfx1151 Vulkan Qwen4-Exp run. Inherited #28302 changes adjacent short-prompt
  eviction behavior but has not demonstrated a fix for that exact failure on HIP.
- The detached loader recognizes the sidecar by missing trunk tensors. Only use
  sidecars from a trusted/pinned source with the expected metadata.
- The mixed-F16 compatibility patch covers the two Qwen4-Exp gamma
  multiplications identified in #27836. It does not add generic F32×F16
  binary-op support to every CPU/HIP graph; arbitrary third-party mixed-type
  models remain outside this package's validation scope.
- The integrated-HIP host-buffer change is a conservative capability workaround,
  not the general scheduler synchronization fix. Retest chunked prompts after
  upstream scheduler changes. Run nonce-isolated concurrency checks only with
  `--spec-type none`; they do not authorize unsafe multi-slot MTP.
- The former RDNA3.5 MoE-fusion guard was removed after #28113's reporter
  withdrew the upstream attribution. The benchmark still checks output
  coherence because local compiler/tuning combinations can collide even when
  the clean upstream paths are sound. A new
  [#25952 report](https://github.com/ggml-org/llama.cpp/pull/25952#issuecomment-5545558634)
  bisects a large prefill slowdown on nine MI50 GPUs to weighted-expert fusion:
  93 versus 325 t/s with fusion disabled, while decode is unchanged. That is
  not gfx1151 evidence and does not justify disabling fusion here by default.
  For an isolated performance diagnosis, the current broad switch is
  `GGML_CUDA_DISABLE_FUSION=1`, not the obsolete
  `GGML_CUDA_MOE_WEIGHTED_REDUCTION` name; compare output and full-workload
  timings before keeping such an override.
- The two RPC guards cover specific invalid nodes and row-operation shape
  families; they are not authentication, authorization, bounds validation for
  every graph op, or a reason to expose RPC outside a protected network.
- New rocPRIM versions take a broader hipCUB path than old versions. Re-run
  `TOP_K`, `ARGSORT`, reduction, scan, graph, and long-generation tests after a
  nightly upgrade.
- PLE row readahead is fork work with no upstream review. The current lazy loader
  itself is upstream, and the local shim only records created lazy tensors, but
  cold load, warm reload, cancellation, and a non-Qwen lazy model still deserve
  re-testing after every rebase.
- Issue #28256 shows that an NFS/FS-Cache-backed PLE can still devolve into tiny
  reads and sub-1-token/s prefill. Keep PLE shards on fast local NVMe and do not
  treat a cache hit ratio as a substitute for end-to-end I/O measurements.
- Issue #28160 reports a large #27837-related prefill regression on gfx1151
  Vulkan and GB10 CUDA UMA, plus a newer underspecified ROCm complaint. There
  is still no controlled gfx1151 HIP comparison; do not infer best performance
  from successful lazy mapping alone, and keep the resident
  `-lzm off` A/B within the machine's memory budget.
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
- [Integrated-head F16/F32 MTP failure report](https://github.com/ggml-org/llama.cpp/pull/27836#issuecomment-5508708675)
- [Historical `b10796...b10819` upstream comparison](https://github.com/ggml-org/llama.cpp/compare/b10796...b10819)
- [Inherited non-mmap peak-RAM reduction, llama.cpp PR #27483](https://github.com/ggml-org/llama.cpp/pull/27483)
- [Inherited maximum per-layer expert check, llama.cpp PR #28323](https://github.com/ggml-org/llama.cpp/pull/28323)
- [Carried fresh-sequence MTP carrier reset, llama.cpp PR #28333](https://github.com/ggml-org/llama.cpp/pull/28333)
- [Carried unused QSA indexer V-cache removal, llama.cpp PR #28330](https://github.com/ggml-org/llama.cpp/pull/28330)
- [Inherited Web UI build-time `npx` removal, llama.cpp PR #28270](https://github.com/ggml-org/llama.cpp/pull/28270)
- [Inherited backend-search robustness, llama.cpp PR #28271](https://github.com/ggml-org/llama.cpp/pull/28271)
- [Inherited scheduler input-limit removal, llama.cpp PR #28387](https://github.com/ggml-org/llama.cpp/pull/28387)
- [Inherited Qwen3-TTS 0.6B correctness fix, llama.cpp PR #28231](https://github.com/ggml-org/llama.cpp/pull/28231)
- [Merged Qwen3.8 QSA, vision, metadata, and 256K correctness follow-up, llama.cpp PR #27941](https://github.com/ggml-org/llama.cpp/pull/27941)
- [Merged direct QSA indexer-head summation, llama.cpp PR #28023](https://github.com/ggml-org/llama.cpp/pull/28023)
- [Merged native Qwen4-Exp recurrent rollback, llama.cpp PR #28123](https://github.com/ggml-org/llama.cpp/pull/28123)
- [Inherited approved logarithmic predecessor lookup, llama.cpp PR #28040](https://github.com/ggml-org/llama.cpp/pull/28040)
- [Inherited YaRN context autoscaling, llama.cpp PR #28030](https://github.com/ggml-org/llama.cpp/pull/28030)
- [Inherited fused MoE weighted reduction, llama.cpp PR #25952](https://github.com/ggml-org/llama.cpp/pull/25952)
- [Carried malformed-GGUF size-overflow mitigation, llama.cpp PR #27200](https://github.com/ggml-org/llama.cpp/pull/27200)
- [Reference GDN q/k normalization, llama.cpp PR #28068](https://github.com/ggml-org/llama.cpp/pull/28068)
- [Safe recurrent-memory rollback fallback, llama.cpp PR #28007](https://github.com/ggml-org/llama.cpp/pull/28007)
- [RPC invalid-graph-node denial-of-service fix, llama.cpp PR #25670](https://github.com/ggml-org/llama.cpp/pull/25670)
- [RPC row-operation graph-shape hardening basis, llama.cpp PR #26933](https://github.com/ggml-org/llama.cpp/pull/26933)
- [Former integrated HIP host-buffer safety patch, llama.cpp PR #25863](https://github.com/ggml-org/llama.cpp/pull/25863)
- [Withdrawn RDNA3.5 MoE-fusion attribution, llama.cpp issue #28113](https://github.com/ggml-org/llama.cpp/issues/28113)
- [Long-ubatch gfx1151 wrong-logit report, llama.cpp issue #28211](https://github.com/ggml-org/llama.cpp/issues/28211)
- [Cross-request replay report on gfx1151, llama.cpp issue #25992](https://github.com/ggml-org/llama.cpp/issues/25992)
- [Qwen3.8 multi-segment corruption report on gfx1151, llama.cpp issue #27797](https://github.com/ggml-org/llama.cpp/issues/27797)
- [Native HIP wide radix `TOP_K`, llama.cpp PR #27466](https://github.com/ggml-org/llama.cpp/pull/27466)
- [gfx1151 wide-`TOP_K` and long-RPC validation, llama.cpp issue #27021](https://github.com/ggml-org/llama.cpp/issues/27021)
- [hipCUB on HIP, llama.cpp PR #26592](https://github.com/ggml-org/llama.cpp/pull/26592)
- [Wide-HIP-argsort follow-up, Unsloth PR #136](https://github.com/unslothai/llama.cpp/pull/136)
- [Upstream lazy tensor reads, llama.cpp PR #27794](https://github.com/ggml-org/llama.cpp/pull/27794)
- [Qwen3.8 graph-split reduction, llama.cpp PR #27880](https://github.com/ggml-org/llama.cpp/pull/27880)
- [`llama-bench` lazy-mode support, llama.cpp PR #27881](https://github.com/ggml-org/llama.cpp/pull/27881)
- [Merged lazy-loader redesign, llama.cpp PR #27837](https://github.com/ggml-org/llama.cpp/pull/27837)
- [UMA lazy-buffer prefill regression, llama.cpp issue #28160](https://github.com/ggml-org/llama.cpp/issues/28160)
- [Inherited lazy-auto device policy, llama.cpp PR #28326](https://github.com/ggml-org/llama.cpp/pull/28326)
- [Lazy-mode CLI rename, llama.cpp PR #27969](https://github.com/ggml-org/llama.cpp/pull/27969)
- [Merged bounded sequence scan, llama.cpp PR #28011](https://github.com/ggml-org/llama.cpp/pull/28011)
- [Merged cross-RPC-server buffer isolation, llama.cpp PR #26500](https://github.com/ggml-org/llama.cpp/pull/26500)
- [Merged Vulkan Qwen3.8 `TOP_K` and backend tests, llama.cpp PR #28032](https://github.com/ggml-org/llama.cpp/pull/28032)
- [Closed Qwen/QSA optimization umbrella, llama.cpp PR #27977](https://github.com/ggml-org/llama.cpp/pull/27977)
- [Draft mixed external-drafter plus MTP initialization, llama.cpp PR #27897](https://github.com/ggml-org/llama.cpp/pull/27897)
- [Open probabilistic MTP/rejection sampling, llama.cpp PR #27694](https://github.com/ggml-org/llama.cpp/pull/27694)
- [Open speculative prefill, llama.cpp PR #27692](https://github.com/ggml-org/llama.cpp/pull/27692)
- [Draft GPU-resident MoE expert cache, llama.cpp PR #27861](https://github.com/ggml-org/llama.cpp/pull/27861)
- [Open internal HIP AllReduce, llama.cpp PR #27825](https://github.com/ggml-org/llama.cpp/pull/27825)
- [Closed flat QSA position scan, llama.cpp PR #28128](https://github.com/ggml-org/llama.cpp/pull/28128)
- [Sparse QSA gather successor, Unsloth llama.cpp PR #165](https://github.com/unslothai/llama.cpp/pull/165)
- [Open Linux `MAP_POPULATE` removal, llama.cpp PR #28055](https://github.com/ggml-org/llama.cpp/pull/28055)
- [Open direct-read SSD PLE, llama.cpp PR #28136](https://github.com/ggml-org/llama.cpp/pull/28136)
- [First human approval of direct-read SSD PLE](https://github.com/ggml-org/llama.cpp/pull/28136#pullrequestreview-5088473486)
- [Corrected Windows cold-cache SSD-PLE measurements](https://github.com/ggml-org/llama.cpp/pull/28136#issuecomment-5539110252)
- [Linux/Blackwell SSD-PLE measurements through 200K](https://github.com/ggml-org/llama.cpp/pull/28136#issuecomment-5548927536)
- [September 6 Linux/Blackwell 24K cold-cache comparison](https://github.com/ggml-org/llama.cpp/pull/28136#issuecomment-5556057187)
- [September 6 Windows 25K real-prompt and MTP comparison](https://github.com/ggml-org/llama.cpp/pull/28136#issuecomment-5561093061)
- [Pathological small PLE reads, llama.cpp issue #28256](https://github.com/ggml-org/llama.cpp/issues/28256)
- [Unsloth lazy/load-mode interaction report, Unsloth PR #169](https://github.com/unslothai/llama.cpp/pull/169)
- [Draft asynchronous graph-input synchronization, llama.cpp PR #28058](https://github.com/ggml-org/llama.cpp/pull/28058)
- [Closed speculative replay-livelock proposal, llama.cpp PR #28061](https://github.com/ggml-org/llama.cpp/pull/28061)
- [Speculative checkpoint-replay livelock, llama.cpp issue #28060](https://github.com/ggml-org/llama.cpp/issues/28060)
- [Closed alternative Qwen4-Exp MTP port, llama.cpp PR #28104](https://github.com/ggml-org/llama.cpp/pull/28104)
- [Accepted MTP tokens after EOG, llama.cpp issue #28049](https://github.com/ggml-org/llama.cpp/issues/28049)
- [Draft EOG-tail truncation fix, llama.cpp PR #28232](https://github.com/ggml-org/llama.cpp/pull/28232)
- [Stale per-slot draft state, llama.cpp issue #27852](https://github.com/ggml-org/llama.cpp/issues/27852)
- [Empty explicit-slot prompt-cache bypass, llama.cpp issue #28139](https://github.com/ggml-org/llama.cpp/issues/28139)
- [Open large-grid norm-kernel successor, llama.cpp PR #28175](https://github.com/ggml-org/llama.cpp/pull/28175)
- [Merged batched non-contiguous KV restore, llama.cpp PR #27991](https://github.com/ggml-org/llama.cpp/pull/27991)
- [Open persistent recurrent disk-slot checkpoints, llama.cpp PR #26004](https://github.com/ggml-org/llama.cpp/pull/26004)
- [Open persistent disk prompt cache, llama.cpp PR #28092](https://github.com/ggml-org/llama.cpp/pull/28092)
- [MTP cross-slot content contamination on gfx1151, llama.cpp issue #28286](https://github.com/ggml-org/llama.cpp/issues/28286)
- [Withdrawn HIP streamed multi-turn report, llama.cpp issue #28266](https://github.com/ggml-org/llama.cpp/issues/28266)
- [gfx1151 recurrent-checkpoint livelock, llama.cpp issue #28280](https://github.com/ggml-org/llama.cpp/issues/28280)
- [Inherited short-prompt checkpoint-eviction fix, llama.cpp PR #28302](https://github.com/ggml-org/llama.cpp/pull/28302)
- [Open view-backed-output scheduler assignment, llama.cpp PR #28075](https://github.com/ggml-org/llama.cpp/pull/28075)
- [Draft alternate Unsloth MTP sidecar layout, llama.cpp PR #28097](https://github.com/ggml-org/llama.cpp/pull/28097)
- [Malformed-GGUF block-count guard, llama.cpp PR #28099](https://github.com/ggml-org/llama.cpp/pull/28099)
- [Draft recurrent batch-invariance test, llama.cpp PR #28109](https://github.com/ggml-org/llama.cpp/pull/28109)
- [Open separate draft-KV offload, llama.cpp PR #28117](https://github.com/ggml-org/llama.cpp/pull/28117)
- [Draft on-device recurrent checkpoints, llama.cpp PR #28118](https://github.com/ggml-org/llama.cpp/pull/28118)
- [Merged early NextN loading with reported regressions, llama.cpp PR #28159](https://github.com/ggml-org/llama.cpp/pull/28159)
- [Merged NextN layer-count correction, llama.cpp PR #28173](https://github.com/ggml-org/llama.cpp/pull/28173)
- [Merged Gemma4 Assistant follow-up, llama.cpp PR #28183](https://github.com/ggml-org/llama.cpp/pull/28183)
- [Open partial NextN loader redesign, llama.cpp PR #28192](https://github.com/ggml-org/llama.cpp/pull/28192)
- [Draft graph/allocation-error handling, llama.cpp PR #28149](https://github.com/ggml-org/llama.cpp/pull/28149)
- [Open HIP small-copy compute kernel, llama.cpp PR #28178](https://github.com/ggml-org/llama.cpp/pull/28178)
- [Draft adaptive MTP depth, llama.cpp PR #27210](https://github.com/ggml-org/llama.cpp/pull/27210)
- [Open multi-ubatch MTP serialization, llama.cpp PR #26827](https://github.com/ggml-org/llama.cpp/pull/26827)
- [Ready-for-review gfx1151 RDNA3.5 MMQ tuning, llama.cpp PR #28195](https://github.com/ggml-org/llama.cpp/pull/28195)
- [Open Qwen4-Exp sparse QSA gather, llama.cpp PR #28213](https://github.com/ggml-org/llama.cpp/pull/28213)
- [Closed narrower Qwen4-Exp sparse QSA gather, llama.cpp PR #28244](https://github.com/ggml-org/llama.cpp/pull/28244)
- [Upstream Qwen3.8 MTP successor, llama.cpp PR #28243](https://github.com/ggml-org/llama.cpp/pull/28243)
- [gfx1151 F32 `CONCAT` transpose, llama.cpp PR #28303](https://github.com/ggml-org/llama.cpp/pull/28303)
- [Static no-realloc MTP sampling graph, llama.cpp PR #28305](https://github.com/ggml-org/llama.cpp/pull/28305)
- [Open native ROCm `TOP_K` rewrite, llama.cpp PR #28313](https://github.com/ggml-org/llama.cpp/pull/28313)
- [Draft Flash Attention vector-store race fix, llama.cpp PR #28358](https://github.com/ggml-org/llama.cpp/pull/28358)
- [Open gfx11-generic MMVQ launch fix, llama.cpp PR #28339](https://github.com/ggml-org/llama.cpp/pull/28339)
- [Draft dynamic draft/mmproj weight swapping, llama.cpp PR #28346](https://github.com/ggml-org/llama.cpp/pull/28346)
- [Draft MTP importance-matrix conversion, llama.cpp PR #28351](https://github.com/ggml-org/llama.cpp/pull/28351)
- [Draft RDNA3 MMVQ fast path, llama.cpp PR #28003](https://github.com/ggml-org/llama.cpp/pull/28003)
- [Open CUDA/HIP `IM2COL` access rewrite, llama.cpp PR #28013](https://github.com/ggml-org/llama.cpp/pull/28013)
- [Inherited approved F16 Flash Attention barrier fix, llama.cpp PR #27870](https://github.com/ggml-org/llama.cpp/pull/27870)
- [Reverted routed-MoE MMQ width selection, llama.cpp PR #24546](https://github.com/ggml-org/llama.cpp/pull/24546)
- [Revised routed-MoE MMQ width selection, llama.cpp PR #28552](https://github.com/ggml-org/llama.cpp/pull/28552)
- [Open HIP IQ2/IQ3 SWAR intrinsics, llama.cpp PR #27962](https://github.com/ggml-org/llama.cpp/pull/27962)
- [Closed duplicate hipCUB reductions, llama.cpp PR #27936](https://github.com/ggml-org/llama.cpp/pull/27936)
- [Closed batched `DeviceTopK` dispatch, llama.cpp PR #28129](https://github.com/ggml-org/llama.cpp/pull/28129)
- [Open speculative-logprobs correctness, llama.cpp PR #27196](https://github.com/ggml-org/llama.cpp/pull/27196)
- [Closed `gguf-py` array-count hardening, llama.cpp PR #28131](https://github.com/ggml-org/llama.cpp/pull/28131)
- [Open symmetric Q8_0 conversion range, llama.cpp PR #25557](https://github.com/ggml-org/llama.cpp/pull/25557)
- [Open explicit host placement under mmap, llama.cpp PR #28223](https://github.com/ggml-org/llama.cpp/pull/28223)
- [Open mmproj fit-margin sleep/resume fix, llama.cpp PR #28233](https://github.com/ggml-org/llama.cpp/pull/28233)
- [Open asynchronous initialization-error handling, llama.cpp PR #28242](https://github.com/ggml-org/llama.cpp/pull/28242)
- [Out-of-range speculative-token report, llama.cpp issue #28158](https://github.com/ggml-org/llama.cpp/issues/28158)
- [Rejected automated non-fix for #28158, llama.cpp PR #28206](https://github.com/ggml-org/llama.cpp/pull/28206)
- [Closed global mmap-prefetch proposal, llama.cpp PR #27928](https://github.com/ggml-org/llama.cpp/pull/27928)
- [Per-tensor mmap feature request, llama.cpp issue #27766](https://github.com/ggml-org/llama.cpp/issues/27766)
- [Qwen PLE SSD-offload discussion](https://github.com/ggml-org/llama.cpp/discussions/27864)
- [EngramHalo.cpp Strix Halo tuning guide](https://github.com/Aristo94/EngramHalo.cpp/blob/e5d8461c128a215df2140eed5adf1b68e7d29b56/docs/strix-halo/README.md)
- [EngramHalo depth curves and synthetic-prompt warning](https://github.com/Aristo94/EngramHalo.cpp/commit/e4e0df920ea9644edb6143c5c011b57b558ec096)
- [PLE row readahead and IQ4_NL `GET_ROWS`](https://github.com/Aristo94/EngramHalo.cpp/commit/c911e6bb5eb956a759e740fb14db8ca639b7d3e7)
- [Related Unsloth batched-readahead PR](https://github.com/unslothai/llama.cpp/pull/137)
- [Closed Unsloth shared-tensor loader, consolidated into #144](https://github.com/unslothai/llama.cpp/pull/142)
- [Unsloth shared-sidecar/MTP umbrella](https://github.com/unslothai/llama.cpp/pull/144)
- [Unsloth narrower tensor mapping](https://github.com/unslothai/llama.cpp/pull/152)
- [Random-weight Qwen4-Exp profiling fixture](https://huggingface.co/Lynxpda/micro-qwen4exp)
- [Audited and rejected UMA load-time page-cache drop-behind](https://github.com/Aristo94/EngramHalo.cpp/commit/5486559c0eb59ca0f8bbacf785c5f4a1ee4294c6)
- [llama.cpp speculative decoding documentation](https://github.com/ggml-org/llama.cpp/blob/b10872/docs/speculative.md)
- [llama.cpp SPEED-Bench documentation](https://github.com/ggml-org/llama.cpp/blob/b10872/tools/server/bench/speed-bench/README.md)
- [Draft-cache total-memory warning, llama.cpp PR #28378](https://github.com/ggml-org/llama.cpp/pull/28378)
- [NumPy 1.x conversion-corruption report, llama.cpp issue #28438](https://github.com/ggml-org/llama.cpp/issues/28438)
- [Independent-request HIP memory growth, llama.cpp issue #28436](https://github.com/ggml-org/llama.cpp/issues/28436)
- [Speculative sub-batch retry proposal, Unsloth PR #182](https://github.com/unslothai/llama.cpp/pull/182)
- [Approved separate MTP graph-cache identities, llama.cpp PR #28549](https://github.com/ggml-org/llama.cpp/pull/28549#pullrequestreview-5132614946)
- [gfx1151 wrong-logits report on official unpatched builds](https://github.com/ggml-org/llama.cpp/issues/28537)
- [Narrower duplicate of the carried host-buffer workaround](https://github.com/ggml-org/llama.cpp/pull/28574)
- [Strix Vulkan QSA optimization isolation](https://github.com/ggml-org/llama.cpp/pull/28213#issuecomment-5570579330)
- [Long-context shared-sidecar MTP performance comparison](https://github.com/ggml-org/llama.cpp/pull/28243#issuecomment-5560422253)
- [Independent wrong-output report with host expert prefetch](https://github.com/ggml-org/llama.cpp/pull/28414#issuecomment-5575161425)
- [Strix Vulkan draft-vocabulary trimming research](https://github.com/ggml-org/llama.cpp/issues/25187#issuecomment-5553502926)
- [Video prefix-cache identity report](https://github.com/ggml-org/llama.cpp/issues/28580)
- [CUDA QSA tied top-k selection report](https://github.com/ggml-org/llama.cpp/issues/28497)
- [Tool grammar-name collision rejection proposal](https://github.com/ggml-org/llama.cpp/pull/28483)
- [AMD HIP VMM API documentation for ROCm 7.2](https://rocm.docs.amd.com/projects/HIP/en/docs-7.2.0/doxygen/html/group___virtual.html)
- [Official Qwen3.8-Flash-Next checkpoint](https://huggingface.co/Qwen/Qwen3.8-Flash-Next)
- [Pinned Unsloth target GGUFs](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF/commit/2c41bd2a0b3f51c503c11f1c7ed2e6bb34036beb)
- [Pinned Unsloth F16 vision projector](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF/blob/c8b5954a88c2775c546b92593eda40ea041d3176/mmproj-F16.gguf)
- [Reviewed preconverted MTP sidecar](https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF)
- [Pinned experimental FR-Spec sidecar and card](https://huggingface.co/drluoto/Qwen3.8-Flash-Next-MTP-GGUF/tree/922dc15f622e301c29abcbcd49c1eaf937ae5230)
- [Pinned FR-Spec producer and frequency selection](https://github.com/drluoto/llama.cpp/tree/fb367b8cf2cf439326c8f77477ff65d01ba4816f/scripts/frspec)
- [Pinned community Q4_K_XL-DN4 target](https://huggingface.co/bitlamas/Qwen3.8-Flash-Next-Q4_K_XL-DN4/tree/374ee5752a4e5dd2b98ca76eafaec6e3b7af3105)
- [`shard-scalpel`](https://github.com/drluoto/shard-scalpel)
