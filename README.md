# llama.cpp-hip-gfx1151

`llama.cpp-hip-gfx1151` is the HIP-only Strix Halo variant of
[`llama.cpp-gfx1151`](https://aur.archlinux.org/packages/llama.cpp-gfx1151).
It keeps the sibling package's build, service, and CPU/HIP tuning unless a
difference is listed here. This revision pins upstream **b11012** (`35822af`);
the live sibling is **b11010-1** (September 17 review).

The sibling's dependency, service-asset and compiler policy remain synchronized.
b11012 was the latest tag selected during the initial research, two commits
beyond the sibling. The eight then-unreleased master commits were also reviewed;
their other-backend and embedded-GGUF/DeepSeek changes remain documented for
the next routine sync rather than changing this release snapshot.

Since **b10992-2**, the interesting changes are:

- inherited [#28901 Qwen4-Exp HC fusion](https://github.com/ggml-org/llama.cpp/pull/28901)
  combines hyper-connection gating/stream reduction and residual injection.
  It now has human reviews and independent ROCm/vision testing. Our MTP
  overlay preserves those fused branches, grouped norm shapes and conditional
  F16 casts; this is not a measured speedup on the local test host;
- inherited [#28935 RDNA3.5 MoE tile selection](https://github.com/ggml-org/llama.cpp/pull/28935)
  broadens the expert-aware tile heuristic to gfx1151 after the requested
  quantization/batch-size sweep and two approvals. IQ4_XS is included in those
  measurements. Some other cases regress, so gains remain workload-dependent;
  the separate carried #28195 table tuning stays in place;
- [#28549 graph reuse](https://github.com/ggml-org/llama.cpp/pull/28549)
  is merged with generic output/no-output arenas, replacing the older
  MTP-specific implementation. The duplicate carry is removed, while the
  final upstream arena/reset logic is retained;
- inherited [#24292 RPC buffer lifetime fix](https://github.com/ggml-org/llama.cpp/pull/24292)
  invalidates cached graphs before freeing buffers, closing the reported
  use-after-free path. It does not authenticate RPC or establish transparent
  client recovery after cache invalidation;
- [#28869 Qwen reasoning-end newline](https://github.com/ggml-org/llama.cpp/pull/28869)
  is inherited unchanged, so its bundled duplicate is removed. The M-RoPE
  snapshot remains bundled locally, preserving the b10992-2 download fix;
- carried [#29014 skipped MTP expert weights](https://github.com/ggml-org/llama.cpp/pull/29014)
  stops loading physically fused gate/up expert weights when the MTP layer is
  meant to be skipped. A real tiny-GGUF CPU control reproduces the wasted-load
  bug and passes after the nine-line fix. This is conditional loader/memory
  correctness, not a universal Flash-Next speed or memory saving;
- 20 upstream commits in total, also including shared CUDA/HIP im2col access
  improvements, Nemotron norm-metadata compatibility, unified-cache auto-fit
  sizing, HRM model support and other-backend/CI work.

There is **no new SSD-PLE reader or probabilistic-MTP algorithm** in this
update. The direct-reader proposal still lacks the validation needed to replace
our page-merged mmap readahead; new GB10 comparisons do not show a universal
direct-reader win. Probabilistic MTP has stronger review/evaluation evidence,
but replay, distribution and Qwen/HIP coverage still warrant caution.
The refreshed watchlist preserves every previously tracked PR/issue.

Every changed patch hash receives a different filename. Retained remote
downloads still match their prior hashes, and locally bundled snapshots do not
depend on GitHub regenerating identical diff bytes. No wholesale AUR-helper
cache purge or checksum bypass is required.

If upgrading from before b10884, migrate `no-mmap = true` in `models.ini` to
`load-mode = none`, with explicit `lazy-mode = on` for SSD-backed PLE.
The package retains `GGML_CUDA_FA_QUANTS=all`, `GGML_HIP_NO_VMM=ON` and generic
ROCm dependencies. The live nightly provider is still **10.2.0a20260916-1**;
the source versions remain llama.cpp 0.4.1 / ggml 0.24.0.

The MTP and row-readahead extensions remain experimental opt-in features.
Keep a non-speculative baseline, test your real prompts and memory budget,
and read the validation and remaining security/runtime limits below.

## What differs from llama.cpp-gfx1151

The comparison below is this package at `b11012` versus the live sibling at
`b11010`.

| Area | `llama.cpp-hip-gfx1151` | `llama.cpp-gfx1151` |
| --- | --- | --- |
| Package identity | `llama.cpp-hip-gfx1151`, ROCm description | `llama.cpp-gfx1151`, ROCm + Vulkan description |
| GPU backends | `GGML_HIP=ON`, `GGML_VULKAN=OFF` | `GGML_HIP=ON`, `GGML_VULKAN=ON` |
| Vulkan packages | Not required or provided | Depends on `vulkan-icd-loader`; builds with `shaderc`, `vulkan-headers`, and `spirv-headers`; provides Vulkan names |
| HIP headers | Keeps `rocm-hip-sdk` and adds an explicit `hipcub` build dependency for the carried hipCUB patch | Relies on `rocm-hip-sdk` for those headers |
| VMM policy | Explicit `GGML_HIP_NO_VMM=ON` | Does not override the upstream default; its `OFF` example is commented out |
| Upstream tag | `b11012`, selected during initial research | `b11010`; the package is two upstream commits ahead |
| Build identity | Pins the upstream `b11012` commit (`35822af`) and prevents CMake's Git probes from escaping the extracted source tree | Can report the enclosing AUR wrapper commit when built from a normal AUR Git clone |
| Flash Attention build option | `GGML_CUDA_FA_QUANTS=all` | Deprecated `GGML_CUDA_FA_ALL_QUANTS=ON`; equivalent type-pair coverage |
| Installed RUNPATH | Suppresses CMake-generated RPATHs so amdclang leaves only the absolute `/opt/rocm/lib` entry on the HIP DSO | Does not override CMake's RPATH policy |
| Extra source changes | Eleven remote patch files and ten local checksum-pinned files: eight adaptations/guards plus two exact upstream snapshots | No MTP/PLE/Strix safety patch stack |
| Source-cache identity | Remote patch aliases include both the commit and full content SHA-256; local adaptations use the current base-version filename | No active remote patch stack |
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
an immutable commit identity through a commit/compare URL and pinned by SHA-256 in
[`PKGBUILD`](./PKGBUILD); every other package source is checksum-pinned as
well. GNU patch fuzz is explicitly disabled, and the filtered patches use
Git's exact-context application, so an ambiguous rebase fails preparation
instead of silently guessing at nearby code. The four service/config assets
retain the sibling package's mutable `refs/heads/main` URLs. Their hashes
prevent silent substitution, but an upstream asset change will make source
verification fail until the base package updates its checksum.

GitHub has previously regenerated abbreviated `index` headers without changing
the pinned commits or functional patch bodies. Commit identity is immutable;
the bytes of a generated diff are not guaranteed immutable. Remote aliases
therefore include the full commit and content SHA-256, and the same checksum
variable drives both download and application filenames.

All **26 current sources** are checksum-pinned: **11 remote patch files, ten
local files**, the upstream archive and four unchanged service assets. The
local files comprise eight exact-context adaptations/guards and two small
upstream snapshots. New checksums never reuse an old filename.

The September 16 checksum-failure follow-up bundled #28910 and #28869 under
distinct local names instead of guessing at the user's failed download bytes.
The [M-RoPE snapshot](./mrope-auto-pos-de4f4bb77774f760f20d08339fd7e1e458f465b6-c96c58a32d9785a96522e29f0b455d650c6f2ca8c5f2dbc43f4db2e5616f68fd-local.patch)
remains byte-identical and local. #28869 is now upstream, so its duplicate is
removed, not changed back to a remote download. The new
[skipped-MTP expert-weight snapshot](./mtp-gate-up-skip-23ea9861b1f91b162d8b643f95ab4065d6d72942-9dba403be4528686fbb6e303ef40b71d762466faa248cc7f11cbd13ed55e7370-local.patch)
uses the same bundled, checksum-pinned approach.

All retained remote downloads match their previous hashes on September 17.
Versioned local adaptations have fresh b11012 filenames; the MTP `-r1` rebase
also preserves the new HRM tensor enumeration and upstream HC fused branches.
The RPC null-node patch is now a local exact-context rebase because upstream
removed a blank context line; its runtime guard and regression are unchanged.
No fuzzy application or checksum bypass is enabled. If a service asset changes
in a later sync, its alias and installation reference must change with its hash.

| Patch | Purpose | Review state and practical risk as of 2026-09-17 |
| --- | --- | --- |
| [Series ending at `1d8de7c`](https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af), from [llama.cpp PR #27836](https://github.com/ggml-org/llama.cpp/pull/27836), plus [`qwen4exp-mtp-b11012-r1.patch`](./qwen4exp-mtp-b11012-r1.patch) | Adds Qwen3.8-Flash-Next NextN/MTP tensor mappings, conversion, graph construction, recurrent state handling, `draft-mtp`, and detached-head loading. The remote series is applied to every non-overlapping file; the local exact-context patch rebases its `qwen4exp.cpp` changes plus detached-head commit [`a82a58a`](https://github.com/crusaderky/llama.cpp/commit/a82a58a57fc307e5cec0dc68db64d143339be4f2) onto the merged #27941/generic NextN loaders, #28896 norm layout and #28901 HC fusion. The local enum rebase also preserves the new HRM tensor entry. It preserves all six upstream norm reshapes and gives the dedicated NextN head norm the same two-dimensional layout with `TENSOR_ALLOW_RESHAPE`; existing flat GGUF data stays compatible. | #27836 remains a draft and `a82a58a` is explicitly unreviewed. The rebase preserves the merged PLE-row and tensor-array rules. It replaces the new generic `nextn > block_count` assertion with a catchable load error while retaining Qwen4-Exp's stricter `nextn >= block_count` and one-layer checks. This is still substantial model-specific code; experimental, with moderate correctness and maintenance risk. |
| [`qwen4exp-mtp-mixed-f16-b11012.patch`](./qwen4exp-mtp-mixed-f16-b11012.patch), based on the [new #27836 mixed-type report](https://github.com/ggml-org/llama.cpp/pull/27836#issuecomment-5508708675) | Casts hyper-connection and MTP hidden-state gamma tensors to the activation type only when they differ. This prevents valid integrated heads with F16 norms from entering unsupported F32×F16 CPU dispatch or the shared HIP/CUDA path that otherwise treats F16 `src1` as `float`. | Two targeted graph sites, with no extra node for same-type tensors. The HC cast is now inserted/expanded before RMSNorm so RMSNorm and multiplication stay adjacent for fusion. The published drluoto Q8_0 sidecar's relevant norms were independently verified as F32, so this local cast adds no node for that sidecar; inherited #28896 still changes its grouped-norm graph. The report reproduced the failure and fix on CPU/CUDA rather than HIP and has no owned upstream patch or review; low code-scope risk, but on-device HIP validation is still required. The package deliberately does not broaden generic binary-op dispatch. |
| [`7abbba2`](https://github.com/ggml-org/llama.cpp/commit/7abbba20a8ac5bf32477bfd7cd6fa6061067e590), from [llama.cpp PR #28333](https://github.com/ggml-org/llama.cpp/pull/28333) | Clears a slot's pending MTP carrier when a new sequence begins at position zero, so a completed earlier request cannot influence the first proposal of a fresh request. | Five lines in the MTP drafter. The author reproduced a deterministic `--np 1` first-response mismatch after a priming request and obtained matching hashes in five patched repetitions. It has no human review yet, but adds no allocation, I/O, or new indexing and fails toward a zero initial state. Low code-scope risk and direct correctness/confidentiality value. It does not resolve the simultaneous multi-slot contamination in #28286, so `--np 1` remains mandatory. |
| [`57bb668`](https://github.com/rmonsurate/llama.cpp/commit/57bb668674d9fb0d382885e5b04911c6437f8e83), also proposed as [rmonsurate/llama.cpp PR #1](https://github.com/rmonsurate/llama.cpp/pull/1) | Keeps `model.hyper_connection_mixer.*` when `convert_hf_to_gguf.py --mtp` exports a detached sidecar. | One-line converter filter change. Low runtime risk; required for a valid standalone Qwen3.8 sidecar. |
| [`13e4cfe`](https://github.com/ggml-org/llama.cpp/commit/13e4cfe53ff3dc2e786a9264ee552da53e0a41c4), from [llama.cpp PR #28007](https://github.com/ggml-org/llama.cpp/pull/28007) | When a hybrid target or draft cannot partially roll recurrent memory back far enough, clears both sequences and reprocesses the prompt instead of aborting or continuing with stale state. | One server file, one concrete Qwen hybrid+vision reproduction, and 136 reported server tests passed. It has no human approval yet and the expensive fallback is intentionally reachable only after rollback refusal. Low code-scope risk; moderate behavioral risk in complex prompt-cache/speculative flows. |
| [`0a2e89a`](https://github.com/ggml-org/llama.cpp/commit/0a2e89adb99d86cf11d694327b942e9408a1b769), from [llama.cpp PR #27200](https://github.com/ggml-org/llama.cpp/pull/27200) | Divides block-quantized element counts before multiplying by block size, preventing the demonstrated pre-division size wrap that can turn a malicious GGUF into a heap out-of-bounds access. | Approved by a maintainer and only reorders two integer expressions; valid divisible shapes are unchanged. Low risk and useful defense-in-depth, but it is deliberately narrow: it does not add checked arithmetic to every later stride product or addition. |
| [`rpc-invalid-graph-node-b11012.patch`](./rpc-invalid-graph-node-b11012.patch), rebasing [`181b199`](https://github.com/ggml-org/llama.cpp/commit/181b1999205fd0e7c3e0db2874856649a0612d3f), from [llama.cpp PR #25670](https://github.com/ggml-org/llama.cpp/pull/25670) | Rejects an invalid top-level RPC graph node before `ggml_hash_insert` and graph execution. Without it, an unauthenticated client can send a crafted `GRAPH_COMPUTE` request with node ID zero and crash `ggml-rpc-server` through a null dereference. | One fail-closed condition change, removal of a now-redundant null branch, and a loopback regression test that verifies both rejection and continued service. The crash was reproduced on current master and the normal multi-server test still passes. No human approval yet, but the scope is narrow and the package builds/installs RPC, so the denial-of-service reduction outweighs the low change risk. The local rebase changes only a removed blank context line after #24292; it does not make an Internet-exposed RPC server safe or authenticated. |
| [`rpc-graph-shape-validation-b11012.patch`](./rpc-graph-shape-validation-b11012.patch), based on [llama.cpp PR #26933](https://github.com/ggml-org/llama.cpp/pull/26933) at `04542c9` | Rejects RPC `SET_ROWS` and `GET_ROWS` graphs whose attacker-controlled shapes violate the public constructors' invariants, before backend execution. The reported consequences are an out-of-bounds write/selected-victim-buffer overwrite for `SET_ROWS` and out-of-bounds read/data disclosure for `GET_ROWS`. | Testing found the PR's two original comparisons bypassable, so the local no-fuzz patch mirrors the complete structural per-op shape/type/contiguity contract—including the `SET_ROWS` view now allowed by inherited #27199—and adds regression coverage for the published cases and both ASan-confirmed bypasses. Valid constructor-built graphs still pass. It does not inspect the values inside a valid-shaped row-index tensor. The PR has no human review, and this does not validate every RPC op or authenticate RPC. Low code-scope risk; high value when RPC is enabled. |
| Series ending at [`861abb2`](https://github.com/ggml-org/llama.cpp/commit/861abb2b2e333744d565e07985de8f6f6feaff65), from [llama.cpp PR #26592](https://github.com/ggml-org/llama.cpp/pull/26592) | Enables CUB code paths on HIP through hipCUB for sorting, `TOP_K`, reductions, scans, and related operations. It enables them only with rocPRIM 4.4.0 or newer. | The current PR head `f969e23` only rebases the work: its nine production-file changes are byte-equivalent to this already-audited immutable pin. One approval remains alongside an older change request. rocPRIM 4.2 was proven unsafe; the version gate added in `527fcad` avoids that path. Moderate backend/runtime risk. |
| [#28195 at `c6381ea`](https://github.com/ggml-org/llama.cpp/pull/28195) | Retunes 30 RDNA3.5 MMQ entries to 128 threads / 64 rows for selected Q4_0/Q4_K/Q5_K/Q6_K/Q8_0 widths. IQ4_XS configurations are untouched. | [Approved by IMbackK](https://github.com/ggml-org/llama.cpp/pull/28195#pullrequestreview-5158353742), with [independent gfx1151 benchmarks](https://github.com/ggml-org/llama.cpp/pull/28195#issuecomment-5605569760). Existing configuration constants only; no arithmetic-kernel rewrite, I/O or ownership change. Qwen3.6-35B Q4_K_M prefill gains 0.44–3.11% in that test, with some small regressions elsewhere. Low code-scope risk, workload-dependent performance. |
| [#28810 at `6e2139f`](https://github.com/ggml-org/llama.cpp/commit/6e2139f57931ab7a9ca18cd5d502556a54e6248e), plus [`gguf-padding-test-b11012.patch`](./gguf-padding-test-b11012.patch) | Retains the recovered [#24759](https://github.com/ggml-org/llama.cpp/pull/24759) pre-padding overflow guard, removes its redundant power-of-two assertion, and adds native `TENSORS_PAD_OVERFLOW` coverage. The original PR closed because its repository was deleted, not because the bug was fixed. | The follow-up implements the maintainer's requests; still draft, without final approval. Existing metadata validation enforces alignment. Runtime guard applied unchanged from the immutable series; the test file is exactly rebased around the inherited zero-dimension case, with no fuzz. Metadata-only test, no enormous tensor allocation. Neither this nor the carried size fix is complete hostile-GGUF checked arithmetic. |
| [#28764 at `d99608f`](https://github.com/ggml-org/llama.cpp/commit/d99608f83cf2e0288d2f190532e4fbedd098e841) | Loads Nemotron MTPv2's optional latent FFN down/up projections and applies the same routing/projection order as the trunk. Older MTPv1 models without the pair retain their graph. | [CISC approved this exact head](https://github.com/ggml-org/llama.cpp/pull/28764#pullrequestreview-5183034321), although the PR remains draft. The author reports gfx1151/ROCm 7.2.2 loading and MTP acceptance; not our hardware measurement. Thirteen added lines in two model files, existing tensor-shape validation, no external I/O. No Qwen change; malformed one-sided latent pairs are not newly hardened. |
| [#28782 runtime commit `678a3f9`](https://github.com/ggml-org/llama.cpp/commit/678a3f9f8e137e68a69777b7e6aca4ad02be0754) | Initializes quantized-weight padding on the per-thread stream and synchronizes it before returning, avoiding a legacy-stream dependency on concurrent HIP graph capture. | AMD contributor reproduced the failure and the fix on gfx1151/ROCm 10.2 with parallel backend tests; [IMbackK approved the PR on September 13](https://github.com/ggml-org/llama.cpp/pull/28782#pullrequestreview-5190316093). Two lines replace one, with identical address/range/zero value and the same synchronous return contract as adjacent callbacks. Only the runtime commit is carried, not the CI follow-up. Not a proven fix for image corruption. |
| [`c911e6b`](https://github.com/Aristo94/EngramHalo.cpp/commit/c911e6bb5eb956a759e740fb14db8ca639b7d3e7), plus [`qwen4exp-ple-row-prefetch-b11012.patch`](./qwen4exp-ple-row-prefetch-b11012.patch) | Tracks which tensors actually use b11012's lazy mapping, submits page-merged `WILLNEED` hints for selected PLE rows before graph execution, and adds a HIP/CUDA `GET_ROWS` path for 160-value IQ4_NL rows. | Fork-only and tested on one gfx1151 system. The small local shim has exact current context so preparation fails on drift. The fork's rewritten `f20885f` (and September 13 `8eb931b`) is only a loader-API rebase of the same functional hunks, already represented by this immutable pin plus the local shim, so its hash is deliberately not chased. Lazy mode places the PLE on the CPU path; readahead failure is non-fatal. |
| [`json-schema-numeric-bounds-b11012.patch`](./json-schema-numeric-bounds-b11012.patch) | Hardens the parser inherited through #28736: validates unsigned/signed counts before narrowing to `int`, bounds before converting to `int64_t`, finite rounded doubles in [-2^63, 2^63), and exclusive-bound arithmetic. | Local, independently reviewed, fail-closed guard in three common JSON files; no I/O, allocations, permission changes or new dependency. Actual-source sanitizer tests reproduce upstream UB and silent wraps, then pass with the guard. Preserves supported limits/fractional rounding; unsupported values become normal schema errors. It does not fix unrelated schema semantics or impose resource limits. |
| [`minicpmv-position-buckets-b11012.patch`](./minicpmv-position-buckets-b11012.patch), for [#27166](https://github.com/ggml-org/llama.cpp/issues/27166#issuecomment-5655292144) | Replaces four fixed 1,024-entry position bucket arrays with vectors sized to the actual MiniCPM-V/MiniCPM-V4.6 patch rows and columns. | New ordinary thin-image evidence makes this more than malicious-model-only hardening. Four declaration changes, unchanged position formulas and Qwen paths, same allocation/exception handling as adjacent vectors. Local independent review and bounded exact-loop ASan/UBSan checks; not a full image/model run. Existing dimension products and general resource limits remain outside scope. |
| [#28910 at `de4f4bb`](https://github.com/ggml-org/llama.cpp/commit/de4f4bb77774f760f20d08339fd7e1e458f465b6) | Allocates all M-RoPE position sections when an embedding batch omits `pos`, broadcasting the generated sequence position to each section. Includes the native batch-allocation regression and API layout documentation. | No formal maintainer approval yet; an independent reporter and our actual-source ASan test reproduce the old heap out-of-bounds read. The complete patch passes 31 tests / 209 assertions. Existing one-position behavior and supplied-position paths are unchanged. The separate public `llama_batch_init`/caller-provided undersized array problem is not repaired; ordinary mtmd already supplies correctly sized arrays. |

The new [#29014 snapshot](./mtp-gate-up-skip-23ea9861b1f91b162d8b643f95ab4065d6d72942-9dba403be4528686fbb6e303ef40b71d762466faa248cc7f11cbd13ed55e7370-local.patch)
honors `TENSOR_SKIP` for physically fused expert gate/up weights, following the
existing QKV helper's skip bookkeeping. Before this fix, target-only loading
could retain inactive MTP weights; the original report additionally aborts in
tensor-split setup. Our physical-GGUF CPU test reproduces the unwanted load,
then passes fused/separate weights with MTP loading enabled/disabled after the
nine-line change. Active-head logic is unchanged. There is no upstream human
approval yet; the narrow existing pattern and reproduced correctness benefit
justify this carry. No new I/O, executable code loading or permission change
is introduced. This is not a guarantee that every model's inactive tensors
are skipped or that a particular Flash-Next file will use less RAM.

The former **#28549** graph-arena and **#28869** reasoning-newline carries are
now inherited in b11012. The final graph-arena implementation is generic:
it lazily keeps separate output/no-output graph results for all contexts,
rather than the older MTP-only split. Its active-result pointer and reset
guards stay upstream-owned. The newline implementation is byte-identical to
the previous bundled snapshot; removing it does not remove the fix.

The former **#28882** CPU cache-line and **#28646** tools-probe carries are now
inherited. Their behavior was already present in b10951. Upstream #28892 also
removes remaining PCH use, so that is no longer a downstream build difference.
The MiniCPM-V four-declaration guard and #28810 padding regression remain.

Historically, #28549 gained am17an's additional approval on September 15 while
ggerganov discussed alternatives to an MTP-specific second arena. The later
generic output/no-output implementation resolved that design discussion and
is the merged version inherited here, replacing the older downstream patch.

The former **#28779** Nemotron divisor and **#28749** rollback-probe carries
are now inherited in b10951. Their behavior was already present in b10938;
removing the duplicate sources does not claim another MTP speedup.
The Nemotron latent FFN patch #28764 remains carried.

The former **#28747** router-framing and **#28787** cpp-httplib carries are now
inherited. Their complete reverse-application checks pass on pristine b10938;
both vendored HTTP files and their vendor-sync script match the previous
prepared package byte-for-byte. Removing those duplicate patches does not
remove the fixes or newly introduce HTTP 0.56.0 behavior versus b10920.

The former **#28739** empty expert-ID carry at
[`3c64099`](https://github.com/ggml-org/llama.cpp/commit/3c6409920f1a2d998178db4f94065d354473e92d)
is now inherited through merged `43f3dda`; its duplicate source and application
are removed. **#28330**'s indexer V-cache saving and **#28102**'s complete FA
series were already inherited by b10909. The D=256 restriction added after #28102 is removed in b10975 for the
updated evidence below; normal upstream selection is restored.
The #28195 MMQ pin is unchanged; this is a separate optimization.

### Why the gfx1151 D=256 Flash Attention restriction was removed

The September 11 [fork revert](https://github.com/Patt92/llama.cpp/commit/3294199a72d72fbc3061429c0bcc3050b065ed6e)
attributed repeated-slash output and zero MTP acceptance to #28102 after
interleaved images/text. We carried a precaution, not a proven upstream fix.

On September 14, the reporter [explicitly withdrew that attribution](https://github.com/Patt92/llama.cpp/commit/7018bc9c1349e5d8d2c20ca117534e65a7a3047b):
a full RPC-worker disk had produced truncated cache entries. They restored
the FA change. With the original reason withdrawn and no isolated current
gfx1151 reproduction, keeping a known dispatch restriction is no longer
justified. This package restores the reviewed upstream selector; it does not
import the fork's cache protocol, row compaction or graph-ring changes.

This does **not** disprove every D=256 issue. The separate gfx1201 dirty-KV
report under [#26419](https://github.com/ggml-org/llama.cpp/pull/26419) and
[#28867's performance report](https://github.com/ggml-org/llama.cpp/issues/28867)
remain watched. Neither supplies a validated current gfx1151 fix or justifies
inventing a new threshold here. Test interleaved images/text, long-to-short
dirty-cache reuse, MTP on/off and your F16/Q8_0 cache types on the target APU.
Compile/CPU checks do not establish GPU numerical correctness.

### Which TOP_K path this package uses

The upstream native radix path and carried hipCUB patch are deliberately both
present:

- with `ROCPRIM_VERSION >= 400400`, the patch defines
  `GGML_CUDA_USE_CUB`. For `TOP_K`, a build whose hipCUB compatibility surface
  lacks CCCL 3.2 `DeviceTopK`—including this rocPRIM 4.7 / hipCUB 4.7 nightly—uses
  bitonic argsort for small rows or hipCUB argsort for larger rows, then copies
  the first `k` indices;
- with older rocPRIM, hipCUB is not enabled and upstream's native HIP radix kernel
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
and #28549's inherited output/no-output arenas with active-arena reuse checks. The same check
also requires #28333's fresh-sequence carrier reset, #28330's omitted indexer
V cache, the now-inherited #28040 indexed predecessor lookup, #27200's
divide-before-multiply size expressions, #27483's largest-first staged load and
per-tensor read-buffer lifetime, and a direct `pwa-assets-generator` command
with no `npx` fallback.

The CMake configure call uses the same Git ceiling and explicitly records the
short commit for the pinned upstream tag. Without both measures, llama.cpp's
build-info probe walks out of the source tarball into the enclosing AUR Git
checkout, and `llama-cli --version` misleadingly reports the package wrapper's
commit. The package records `build 11012, commit 35822af`; ggml's separate
source probe reports `unknown`, which is accurate for an extracted tarball.

### How the SSD-backed PLE patches fit together

Upstream b11012 provides the important mixed-load behavior itself. A tensor
marked lazy overrides the global load mode, gets a dedicated CPU context, and
is mapped even with `--load-mode none`. Dense tensors continue through their
ordinary non-mmap upload path. The package adds row readahead to the
SSD-backed lazy path and an IQ4_NL `GET_ROWS` GPU kernel for resident placement:

| Stage | Package behavior |
| --- | --- |
| Mapping | The PLE remains an mmap alias of the GGUF on NVMe; it is not copied into a permanent 26.8 GiB RAM allocation. |
| Dense-weight load | With `-lm none`, other tensors use pinned staging buffers and asynchronous upload to their HIP buffers; they are not forced through the mmap path merely because the PLE is lazy. |
| PLE lookup | b11012 gathers a lazy tensor on the CPU. Before `GET_ROWS`, this package page-aligns and merges the selected row ranges and submits readahead hints so Linux can queue several NVMe reads in parallel. |

The PLE is still ordinary read-only model data. There is no background daemon,
private cache format, write-back, or model mutation. "SSD-backed" also does not
mean zero RAM use: Linux caches recently faulted PLE pages when memory is
available and can reclaim them under pressure. The resident amount therefore
depends on workload locality and memory pressure; the reported 1-1.5 GiB is an
observation, not a hard limit.

b11012 suppresses whole-file prefetch when the global mode is `none`; the lazy
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
row readahead and the small b11012 bookkeeping hook.

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
since this package's `b10796` revision and remains in `b11012`.

### Why the Qwen3.8 correctness follow-up matters

PR #27941 fixes paths that ordinary single-slot text tests do not exercise.
Before it, an OpenAI request using `n` could copy a sequence without copying
its QSA indexer keys, unified-KV blocks could combine cells belonging to
different sequence sets, and M-RoPE image tokens sharing one position could be
collapsed into the wrong pooled block. The same patch converts model-controlled
metadata assertions into load errors and reshapes the QSA selection launch so
the pooled-block count does not overflow `gridDim.y` near a 256K cache.

b11012 inherits the complete, reviewed, and merged #27941 series, including its
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
still selected on rocPRIM 4.4 or later. On the compiled rocPRIM 4.7 / hipCUB 4.7 stack
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

Closed, unmerged [#28192](https://github.com/ggml-org/llama.cpp/pull/28192) is not required
on top of this pair: it moves NextN reads back into only three Qwen handlers and
would leave other existing NextN architectures—including the carried Qwen4-Exp
MTP path—with zero NextN layers. It closed September 11; retain this rationale
as history, not as an outstanding regression fix.

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
The #28552 successor was subsequently merged and is inherited in b10884;
its selection condition still does not target RDNA3.5.

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

The September 10 comparison used the then-live **b10883-1** source recipe,
SHA-256 `3db0779f2585b63cc26e423a633ad59764ec9cb6cd2feaca3018a20e098d9e57`.
The package already contained its dependency, service and build-policy
changes; that refresh added the version/archive metadata and selected
[b10884](https://github.com/ggml-org/llama.cpp/compare/b10872...b10884).
The one commit beyond that sibling was CI-only. That upstream delta included
video IDs, Granite3
MoE parameter accounting, an explicit-width sampler-count API, NumPy minimum
2.2.6 for conversion, and unrelated Vulkan/Hexagon changes. The latter do
not enable those backends in this HIP-only package.

The September 11 comparison uses the live **b10901-1** source recipe,
SHA-256 `94b68336032d41e28c44fab44100f84cbc4926e5cdaf08dc096182e77d1b9510`.
The selected [b10884 to b10909 delta](https://github.com/ggml-org/llama.cpp/compare/b10884...b10909)
contains 25 commits. Eight are beyond the sibling, including the now-upstream
FA tuning and image-position fix. Source-cache aliases, HIP-only backends,
explicit no-VMM policy and safe build identity remain intentional differences.
The reviewed four-line #28739 fix is the only post-tag master commit imported;
the rest of that five-commit snapshot is not needed for the documented profile.

The September 12 comparison uses the live **b10917-1** recipe, SHA-256
`093299ae123e2357e24ccbd55060853f77da31f797d1d91c75ca7ec012dc0be8`.
Only its tag/archive checksum changed; dependencies, service assets and build
policy are unchanged. The selected [b10909 to b10920 delta](https://github.com/ggml-org/llama.cpp/compare/b10909...b10920)
contains 11 commits, three beyond the sibling. It inherits #28739, PCH/unity
builds and the MSVC fix, and #28555 router subprocess management. Hexagon,
Metal and WebGPU changes do not enable those backends in this package.
The initial five-commit post-tag master snapshot supplies only #28747's
reviewed line-framing fix; unrelated OpenCL/WebGPU/static-RPC changes stay out.

The September 13 comparison uses the live **b10936-1** recipe, SHA-256
`e44d3f1006a16678e92c7ab0598df3827fe29ac6ab0d84841ae24a98b442f187`.
Only its tag/archive checksum changed; dependency, service and compiler policy
remain synchronized. The selected [b10920 to b10938 delta](https://github.com/ggml-org/llama.cpp/compare/b10920...b10938)
contains 18 commits, two beyond the sibling. It inherits #28747, #28787,
#28530, #28795, #28802, #28816, #28817, #28736, #28742 and #28586.
The JSON-schema internal representation replaces the old Python
`examples/json_schema_to_grammar.py` helper upstream; the new local guard checks
numeric conversion boundaries in its C++ parser. #28586 adds opt-in structured
JSON logging. #27841 changes older GCN MMQ tables, not gfx1151. Other backend
changes do not enable those backends here. The two subsequent master commits
screened during this review only change CI parallelism/commands, so are omitted.

### Safety scope of the patch review

The September 17 comparison uses the live **b11010-1** recipe, SHA-256
`2ac2c406442df62980b60bb5d1915540d5175e198bdf5226dd20ed81e407e20c`.
Only its tag/archive hash changed. The selected
[b10992 to b11012 delta](https://github.com/ggml-org/llama.cpp/compare/b10992...b11012)
contains 20 commits, two beyond the sibling. Eight then-unreleased master
commits were also screened, including #28993 and #29008, and left for the
next ordinary tag update. This is the reviewed snapshot, not a claim that
every later master commit is included.

#### Current b11012 validation (September 17)

The source review covers **11 remote patches and ten local files**, the
recipe and relevant inherited changes. No concealed payload, credential
collection, unexpected runtime networking, persistence or permission bypass
was found in the inspected changes. This is not a guarantee that every
dependency or hostile-model/GPU path is vulnerability-free.

- **26/26 source hashes pass** with normal Arch dependency-checked preparation.
  `.SRCINFO` matches the tested recipe. Ten new filenames are collision-free
  across **1,219 historical source inventories**. Retained remote diffs and
  service assets match their earlier hashes; the M-RoPE and new loader fixes
  are exact locally bundled snapshots. No checksum bypass was used.
- Independent AUR-style parent-Git preparation with `*` ignore produces an
  identical tree. Only this extraction-only CPU rehearsal uses `--nodeps`,
  not the real provider install, HIP preparation or package build.
- The carry changes **45 text files, 1,250 additions and 160 removals** versus
  pristine b11012; **3,553 files match**. Thirty-four carried-file outputs
  also match the independently reconstructed b10992 baseline exactly. All
  **3,971 archive entries** pass path/type checks and all **223 Python modules**
  parse without execution. No added binary, bidirectional-text control,
  unexpected source deletion or carried-file permission change was found.
- The first strict preparation caught an enum-context overlap with new HRM
  support. The corrected `-r1` MTP patch preserves that entry and applies the
  original five NextN enum additions; its final source preserves HC fusion and
  mixed-F16 cast ordering. The RPC null-node rebase adjusts only blank-line
  context around the inherited buffer-lifetime fix. No fuzzy application or
  failed preparation tree is used for compilation.
- New #29014 is independently reviewed against the existing QKV skip idiom.
  A physical tiny-GGUF CPU test reproduces inactive fused MTP expert weights
  being retained before the fix; the other three controls pass. After the
  nine-line fix, **all four fused/separate x skipped/active controls pass**;
  four additional Qwen3.5-MoE controls also pass, eight fixed controls in total.
  Synthetic F32 fixtures omit unnecessary scale tensors, as documented for
  earlier fixtures; the unrelated tensor-count diagnostic is not counted as
  the skip bug. No full-size RAM-saving or tensor-parallel GPU claim is made.
- The actual **rocm-nightly-gfx1151-bin 10.2.0a20260916-1** provider is rebuilt
  and installed normally; the live AUR recipe and AMD archive are unchanged
  from the previous run. **29,496 provider files verify, zero altered**.
  HIP remains **7.16.26370**, rocPRIM/hipCUB **4.7.0**, clang 24 at `bc1e171`.
  Exact HIP preprocessing enables hipCUB, with no CCCL/`DeviceTopK` route;
  all **49 FA type pairs** are configured. This is not GPU runtime validation.
- The complete Arch HIP package builds successfully with ordinary dependency
  checks, LTO and CI CPU-variant coverage. Artifact inspection passes for
  **67 ELF files**, **14 CPU variants** and **183 gfx1151-only HIP bundles**.
  All 49 FA definitions are present; the compiled TOP_K object uses sorting
  and copying, not `DeviceTopK`. There are no missing libraries, foreign GPU
  backends, PCH artifacts, executable stacks, unsafe permissions or escaping
  symlinks. The HIP DSO's only RUNPATH is absolute `/opt/rocm/lib`.
- A normal package upgrade from the preserved b10992 binary succeeds;
  **127 installed files verify, zero altered**. CLI and benchmark versions
  report **11012 / 35822af**, server help exposes the expected MTP/PLE options,
  and the installed binary completes a small CPU generation identical to the
  baseline. Installed RPC node/row guards and six buffer-lifetime safety
  checks also pass; the system service stays disabled. Build warnings
  about embedded source paths are not unsafe loader search paths. This host
  has no usable ROCm device, so none of this establishes full-size gfx1151
  numerical correctness, memory use or throughput.
- The inherited RPC UAF fix passes **six bounded loopback checks**, including
  rejection of a cached graph after its referenced buffer is freed and
  continued service. A separate valid public-API control identifies an
  availability regression: b10992 performs three correct computations while
  b11012 loses the client connection after freeing an unrelated 64-byte
  buffer and reusing a graph UID. All graph buffers remain alive in that
  control. The server invalidates every cached graph but the client does not
  invalidate its UID cache; there is no transparent fallback. The security
  fix stays, and this known failure is documented rather than counted as a
  passing RPC lifecycle test.
- The separate protocol-7 weight-cache regression passes **eight cases**:
  sync/async compute/weight transfers and repeated requests are byte-identical
  at 16 MiB each; only weight transfers create the two expected cache files.
  This does not repair partial cache entries or authenticate RPC clients.
- The final CPU server/libraries pass **50 reasoning-newline checks** and
  **13 ordinary router/authentication checks**. The inherited newline behaves
  like the previous carry. The separate authenticated resumable-stream
  diagnostic still reproduces #28820; child authentication remains enabled,
  and that diagnostic is not represented as repaired.
- The final fresh CPU build passes **65/65 CTests**, **623 ARGSORT/TOP_K
  cases**, **12 explicit HC backend cases**, **93 native GGUF cases** and
  **132 architecture initializations / 112 supported save/load round trips**.
  HRM adds one initialization and round trip. The initial fixture run found
  Git LFS pointer files and a concurrent test-model download mismatch; after
  fetching and verifying the pinned payloads, the complete suite was rerun.
  No hash check was relaxed and those initial failures are not counted as
  successful tests.
- All **12 Qwen4-Exp cases** (F32/F16 norms, integrated/detached flat-GGUF,
  fused/reuse-disabled/unfused controls) emit **2,304 finite logits each**,
  bit-identical to the corresponding b10992 outputs and unfused controls.
  An evaluation observer confirms **24 HC_PRE and 24 HC_POST operations** per
  fused run versus zero with fusion disabled, so the tests actually exercise
  the new operations. This is tiny-model CPU evidence, not full-size HIP
  numerical or performance proof.
- Six additional Qwen4-Exp ordinary-target controls compare F32/F16 norms with
  fusion on/off and reuse disabled. All **2,304 logits per run** match within
  each precision; the observer sees **48 HC_PRE and 48 HC_POST** operations
  with fusion and zero without, with five versus zero reuse hits. There are
  no saved prior target logits for these six cases, so this is a current A/B
  comparison, not a historical numerical comparison.
- The ordinary target graph now also uses two stable output/no-output arenas:
  **2,304 logits** match with reuse on/off, with five versus zero reuse hits.
  Qwen3.5 MTP remains bit-identical to the prior baseline, with six versus zero
  hits. Both Nemotron v1/v2 fixtures retain **1,536 finite matching logits**,
  and six Qwen4 rollback controls have maximum logit difference zero.
- Actual-source ASan/UBSan batch checks pass **31 tests / 209 assertions**
  and ten correctly sized/automatic-position controls. Five deliberately
  undersized caller arrays still reproduce the known #28963 over-read;
  #28910 repairs automatic positions, not that caller-owned storage contract.
- The real package UI build succeeds; fresh checks report **zero errors and
  zero warnings**, and **674/674 unit tests** pass across 50 files. The explicit
  lockfile dependency audit still lists **17 affected packages: seven high,
  nine moderate and one low**. These are inherited dependency risks, not
  malware findings; no forced dependency upgrade or advisory bypass is used.

Compact research, regression and build evidence plus the binary package are
retained outside the repository in
`~/.cache/llama-hip-test-results/b11012-2026-09-17/`. The package archive is
**25,663,774 bytes**, SHA-256
`66d38d5234b74629800c5b33b2b34da71ec2c7e279dc2efd116e78d27f2a7ce9`.
The review finds no malware indicators, while the RPC, dependency,
hostile-input and GPU-validation limits remain explicit. Existing compatible
GGUF weights do not need reconversion for this update.

#### Previous b10992 comparison (September 16)

The September 16 comparison uses the live **b10991-1** recipe, SHA-256
`5759bdcdf445b7281049b1143d300c7f974a1b2207d809c5573ae78d38c97497`.
Its dependency, service-asset and compiler policy is unchanged. The selected
[b10975 to b10992 delta](https://github.com/ggml-org/llama.cpp/compare/b10975...b10992)
contains 17 commits, one beyond the sibling. Master matched the selected tag
at the initial review. The meaningful shared-backend changes are weights-only
RPC caching, protocol 7, local two-device HIP AllReduce and row-contiguous
SUM_ROWS/MEAN; none demonstrates a single-APU performance gain by itself.

#### b10992-2 source-delivery follow-up (September 16)

Two source checks failed on a user's machine after the initial sync. Fresh independent
downloads here still match both recorded checksums, so the failing log alone
does not establish whether the local cache, an incomplete response or GitHub
diff serialization was responsible. The package now carries those exact two
small snapshots locally instead of relying on the generated diff endpoints.
No checksum was blindly replaced and no verification was disabled.

Arch `makepkg --verifysource` passes **27/27 sources**, and `.SRCINFO` was
regenerated with makepkg. A second check with deliberately invalid files under
both old cache filenames also passes all 27 sources. Full exact-context/no-fuzz preparation passes;
all **3,596 prepared files** match the previous verified source tree: the
same **48 carried-file hashes** and **3,548 unchanged files**. Thus the earlier
full HIP build and numerical tests still cover the identical code; they were
not rerun or represented as a new -2 binary build. Only packaging delivery and
the release number changed. Users need the updated package checkout, not
`--skipchecksums` or a wholesale yay/paru cache purge.

#### b10992-1 full build validation (September 16)

The review covers **15 remote patches, seven local adaptations/guards**, the
recipe and relevant upstream changes. No concealed payload, credential
collection, unexpected runtime networking, persistence or new permission
bypass was found in the inspected changes. This is a source review, not a
proof that every dependency or malformed-model/GPU path is vulnerability-free.

- All **27 source hashes** pass during normal dependency-checked Arch
  preparation. All retained remote diffs and four service assets are
  byte-identical to their preceding pins. Every changed local checksum has a
  new b10992 filename; the archive alias also changes. `.SRCINFO` comes from
  the actual tested recipe.
- Six local patches change only version comments. The seventh updates the
  RPC regression's SET_TENSOR payload to protocol 7's explicit zero cache flag
  plus offset. Runtime row-shape guards are unchanged. Qwen4-Exp's complete
  patched graph, including grouped norm fusion and conditional F16 casts,
  remains byte-identical to b10975; no model reconversion is required.
- An independent AUR-style parent Git checkout with `*` ignore produces the
  same prepared source tree. That extraction-only CPU rehearsal uses
  `--nodeps`; the real HIP preparation, provider install and build do not.
  All **eight new source aliases** are collision-free across **1,217** earlier
  `.SRCINFO` revisions. Historically reused service-asset aliases predate this
  update; their contents and hashes are unchanged here.
- The stack changes **48 text files, 1,274 additions and 166 removals** versus
  pristine b10992; **3,548 other files match**. Of those 48 carried files,
  **43 are byte-identical** to the independently reconstructed b10975 package.
  The remaining five contain the inherited shared-backend/RPC changes and
  test wire-format adjustment, not new model algorithms. All **3,969 archive
  entries** pass path/type checks and all **222 Python modules** parse without
  execution. No added binary, bidirectional-text control, unexpected source
  deletion or carried-file permission change was found.
- The actual **`rocm-nightly-gfx1151-bin 10.2.0a20260916-1`** AUR recipe builds
  and installs with normal dependency checks. Its AMD source archive verifies
  as `7f973ae20352559e6a70907a005a05ec5ccce275618f3a5097c98598b3479235`;
  **29,496 installed provider files verify, zero altered**. HIP remains
  **7.16.26370**, with clang 24 revision
  `bc1e171b6a5333d498ad60fa4894549aa112db93`.
- Actual HIP translation-unit preprocessing reports rocPRIM/hipCUB **4.7.0**
  and enables `GGML_CUDA_USE_CUB`, but neither CCCL nor
  `CUB_TOP_K_AVAILABLE`. This remains hipCUB argsort-and-copy, not
  `DeviceTopK` or `rocprim::topk`. All **49 FA type-pair definitions** are
  configured.
- A real final CPU client/server loopback test passes **eight RPC cache
  cases** using 16 MiB transfers: sync/async compute buffers create no disk
  entries, weight buffers create one entry each and reuse it on repeat, and
  every readback is byte-identical. This validates the normal weights-only
  behavior, not hostile clients or cache-file crash consistency.
- Targeted actual-source **ASan/UBSan** testing reproduces the remaining
  caller-position bug for five short arrays (`N=1,2,3,5,8`). All **ten**
  matching four-section/automatic-position controls pass, as does the native
  batch suite. These are expected-failure diagnostics of the documented API
  limitation, not failing tests claimed as repaired by #28910.
- All **674 UI unit tests in 50 files** pass; `npm run check` reports **zero
  errors and zero warnings**. The unchanged dependency lockfile still has
  **17 affected packages: seven high, nine moderate, one low, no critical**
  in the fresh npm audit. These are known dependency risks, not new patch
  malware; no forced dependency upgrade or sanitizer-policy expansion was
  silently applied.
- The final CPU server/libraries pass **50 reasoning-newline checks** and
  **13 ordinary router/authentication checks**, including generation, schema
  rejection/recovery, redaction and serialized model switching. The separate
  resumable-stream diagnostic still reproduces #28820: authenticated direct
  child operations work, while router lookup/deletion lacks authorization.
  That diagnostic is not counted as a passing stream-lifecycle test; child
  authentication remains enabled.
- The fresh CPU build passes **65/65 CTests** (63 ordinary tests and two
  bounded loopback RPC guards). The first pass exposed a missing Arch
  `python-jinja` test dependency; after installing it, the complete suite was
  rerun successfully. The initial log is retained rather than counted as a
  source failure or hidden as a successful run.
- Explicit CPU checks pass **623 ARGSORT/TOP_K cases**, **93 seeded GGUF
  cases** including padding-overflow and zero-dimension guards, **131
  architecture initializations** and **111 supported save/load round trips**.
  Expected unsupported-model skips are unchanged; none is GPU coverage.
- Qwen3.5 produces **2,304 finite logits**, and all **eight Qwen4-Exp cases**
  (F32/F16 norms, integrated/detached flat-GGUF layouts, graph reuse on/off)
  produce **2,304 finite logits each**, exactly matching the corresponding
  preserved b10975 outputs. Both Nemotron v1/v2 fixtures produce **1,536**
  finite matching logits, with clean malformed-divisor rejection. Six Qwen4
  rollback controls have maximum logit difference zero; eight metadata-boundary
  cases and six pinned tokenizer-fixture hashes pass. These tiny synthetic
  fixtures check regressions, not full-model quality or MTP acceptance.
- The **complete clean Arch HIP package build passes** with the actual
  September 16 provider, LTO, all CPU variants and a locally built Web UI.
  Existing GCC/LTO/enum warnings and makepkg's diagnostic source-path warning
  remain; a successful build is not a warning-free or reproducible-build claim.
- The final archive is **25,649,799 bytes**, SHA-256
  `4580a03713f876050b4e4c539a03330678ff5bbedfd2d04f25c2faffd59e4de6`.
  Artifact inspection passes for **67 ELF files, 14 CPU variants and 183 HIP
  offload bundles**, all gfx1151. The newly enabled AllReduce adds one bundle;
  all **49 FA type pairs** remain present, with no PCH artifacts. No missing
  library, executable stack, text relocation, unsafe permission/link or foreign
  GPU backend was found. Runtime paths are absent except the HIP library's
  absolute `/opt/rocm/lib`; there is no empty/current/build-directory entry.
- Normal dependency-checked `pacman -U` upgrades the preserved b10975 package
  to b10992; **127 installed files verify, zero altered**. `llama-cli` and
  the new `llama-bench --version` report **build 10992 / `e13469a`**. Server
  help and a 16-token CPU completion pass; completion bytes match the installed
  b10975 control. The service remains **disabled**. Missing-GPU/container
  service-manager warnings are not a failed install or a passed GPU test.

No usable ROCm GPU is exposed. MTP acceptance/quality, long-context vision,
SSD-PLE throughput, multi-GPU synchronization and VMM reliability remain
target-machine tests. Known npm advisories, trusted/firewalled RPC with its
cache disabled, the caller-supplied M-RoPE array limitation and other documented
parser/resource/stream-lifecycle limits remain. There is no new model-download
requirement or claim of a measured gfx1151 speedup from this sync.

The following dated section preserves the previous run's results rather than
representing them as new September 16 tests.

#### Previous b10975 validation (September 15)

The September 15 comparison uses the live **b10970-1** recipe, SHA-256
`71fef1dd566eea663d982c734d03b7d79cccf74fcf5abdc6337483e464602512`.
Only its tag/archive hash changed; dependency, service-asset and compiler
policy remain synchronized. The selected
[b10951 to b10975 delta](https://github.com/ggml-org/llama.cpp/compare/b10951...b10975)
contains 24 commits, five beyond the sibling. Master matched the selected
tag at the initial review. Qwen norm fusion, SWA loaders, Maple support and
the two merged carries are inherited; the MFMA-only precision change does
not alter gfx1151 WMMA. CPU PCH policy is no longer a package difference.

The scope is **15 remote patches, seven local adaptations/guards**, the
recipe and relevant upstream changes. Independent review found no concealed
payload, credential collection, unexpected runtime networking, persistence
or permission bypass. This is not a guarantee that every dependency, model
parser or GPU path is vulnerability-free.

- **27/27 source hashes pass**, and all seven local files have valid strict
  patch structure. Normal dependency-checked Arch preparation succeeds.
  An independent AUR-style parent Git checkout with `*` ignore produces an
  entirely byte-identical source tree. Only that extraction-only CPU-container
  rehearsal skips dependency checks, never the real build/provider install.
- Initial patch-export formatting and asymmetric EOF-context issues were
  caught before any compilation. Corrected MTP patches use distinct `-r1`
  names and Git exact-context application. The failed preparations are not
  the final build source; their diagnostic logs are retained.
- All **ten new aliases** are distinct across **1,216 historical `.SRCINFO`
  revisions**: no changed checksum reuses a filename. All retained remote
  bytes match the preceding pins; `.SRCINFO` matches the actual tested recipe.
  Five local files change only version comments. The two Qwen files preserve
  #28896's grouped norm shapes and matching MTP-head reshape, plus the
  conditional mixed-F16 cast ordering. Flat on-disk gamma tensors remain
  supported through `TENSOR_ALLOW_RESHAPE`; no model reconversion is required.
- The carry changes **48 text files, 1,274 additions and 166 removals** versus
  pristine b10975; **3,543 other files match**. Twenty-five critical retained
  MTP-context/PLE/hipCUB/RPC/schema/MiniCPM/Nemotron files match b10951 exactly.
  The archive's **3,964 entries** contain no unsafe path/link/special-file
  payload. No added binary, bidirectional-text control, source deletion or
  daily carried-file permission change was found. All **222 Python modules**
  pass syntax-only parsing without execution.
- The new M-RoPE native regression uses exact b10975 batch/test translation
  units under **ASan/UBSan**: baseline 30 tests / 198 assertions pass; adding
  only the regression reproduces a four-byte read beyond the eight-byte
  fallback allocation; the complete fix passes **31 tests / 209 assertions**.
  Supporting libraries come from the preceding verified build, so this is
  targeted instrumentation, not a whole-library sanitizer run.
- The actual **`rocm-nightly-gfx1151-bin 10.2.0a20260915-1`** AUR package builds
  and installs normally; **29,495 provider files verify, zero altered**.
  HIP is **7.16.26370**, rocPRIM/hipCUB **4.7.0**. Exact HIP translation-unit
  preprocessing still enables `GGML_CUDA_USE_CUB`, without CCCL or
  `CUB_TOP_K_AVAILABLE`: no `DeviceTopK`/`rocprim::topk` route was introduced.
  The compile configuration includes all **49 FA type pairs**.

- The **full clean Arch HIP build passes** with the actual September 15
  provider, LTO, universal CPU variants and local Web UI build. No package
  build used a failed preparation tree or bypassed dependency resolution.
- All **674 UI tests in 50 files** pass; `npm run check` reports **zero errors
  and zero warnings**. Eight focused actual-production tools-probe tests pass
  after its backport is replaced by the identical upstream implementation.
  The lockfile is unchanged from b10951. The fresh npm audit still lists
  **17 affected packages: seven high, nine moderate, one low, no critical**,
  across 22 advisory URLs. These are existing dependency risks, not new patch
  malware; no forced dependency upgrades were applied.
- The new Qwen4-Exp fixture covers **eight cases**: F32/F16 norm tensors,
  integrated/detached flat-file GGUF layouts, and graph reuse on/off. Each
  produces **2,304 finite logits**, bit-identical to b10951 and between reuse
  modes. Reuse gives six versus zero hits with two stable distinct arenas.
  Loaded norm types are asserted and hidden inputs are nonuniform; these
  cases exercise the real reshape/cast paths, not only metadata synthesis.
- The new reasoning-end patch passes **50 focused checks** against final
  b10975 libraries: unchanged normal prompt/parser/grammar output, thinking
  on/off with/without tools, all three natural end markers, actual forced
  sampler tokens and completion state, and next-turn template agreement.

- The separate fresh CPU build passes **65/65 CTests**, including both bounded
  loopback RPC guards and the native batch-position test. The explicit seeded
  GGUF suite passes **93/93**, retaining padding-overflow and zero-dimension
  coverage. All **623 ARGSORT/TOP_K cases** pass. Architecture tests pass
  **131 initializations and 111 supported save/load round trips**: Maple adds
  an initialization, but its saver remains unsupported upstream.
- Existing numerical controls also pass: the Qwen3.5 arena fixture emits
  **2,304 finite, bit-identical logits** versus b10951 and between reuse modes;
  Nemotron v1/v2 emit **1,536 finite logits each**, with expected router/latent
  widths, target-only skipping and clean zero-divisor rejection. Native probe
  calls preserve state without extra evaluation. Six Qwen4-Exp rollback
  controls have maximum logit difference zero. Eight metadata-only GGUF edge
  cases and six pinned tokenizer-fixture hashes pass. Synthetic Nemotron
  fixtures retain the previously documented omission of unnecessary F32 scale
  tensors; these are not hostile-model or full-size quality guarantees.
- The final CPU server passes **13 ordinary router/authentication checks**,
  including serialized model switching, real generation, schema rejection
  and recovery, redaction, unload and shutdown. A separate resumable-stream
  diagnostic confirms the existing #28820 lookup/deletion failure against
  key-protected children, documented in limitations; it is not counted as a
  passing stream-lifecycle test. Keys remain enabled.
- The inherited #28771 `add_subdirectory` example configures successfully;
  all 13 server translation units use the actual llama.cpp project include
  root. This is **configure-only**, not a second embedded application build.
  The example shell helper's joined server/test flags are not used; this
  package neither installs nor invokes that helper.

- The final archive is **25,635,578 bytes**, SHA-256
  `848a180639795e1ef21262fa8f721b686e2a8c85e6033aee79e695db800d6ad8`.
  Inspection passes for **67 ELF files, 14 CPU variants and 182 HIP offload
  bundles**, all gfx1151. All **49 FA type pairs** and their vector objects
  are present; no PCH files or compile commands remain. No foreign GPU backend,
  unresolved library, unsafe permission/link, executable stack or text
  relocation was found. Runtime library paths are absent except the HIP
  DSO's absolute `/opt/rocm/lib`; no empty/current/build-directory entry exists.
  makepkg's source-path warning comes from diagnostic strings, not RUNPATH.
- Normal `pacman -U` upgrades b10951 to b10975 with dependencies enforced.
  **127 installed files verify, zero altered**. Installed binaries report
  **0.4.1-dev / build 10975 / `4c9233c`**; CLI/server help and a 16-token CPU
  completion smoke test pass. The service remains **disabled**. Expected
  warnings concern absent ROCm hardware and the non-booted container service
  manager, not a failed installation or a passed GPU test.

No usable ROCm GPU is exposed. Restoring upstream FA selection follows the
withdrawn report, not local GPU numerical proof. MTP acceptance, long-context
vision, SSD-PLE throughput and VMM reliability still need target-machine tests.
The separate caller-supplied M-RoPE array-size issue, old JSON grammar
`INT64_MIN` overflow and arbitrary hostile-model/image resource limits remain.
RPC must stay trusted/firewalled with disk caching off. The unchanged UI
lockfile still has known dependency advisories; see the results below.

#### Previous b10951 validation (September 14)

The September 14 comparison used the then-live **b10950-1** recipe, SHA-256
`a779046ae5d724c23defb24cdcdb708b24366f78c03035a7a249bbc58b775277`.
Its dependency, service/config assets and build policy are unchanged. The
selected [b10938 to b10951 delta](https://github.com/ggml-org/llama.cpp/compare/b10938...b10951)
contains 13 commits, one beyond the sibling. The two merged carries retain
their already-tested behavior. Grammar #26885 reduces duplicate lookup/copies;
BF16 fallback #28846 still recognizes gfx1151 as hardware-capable. Other changes
mainly concern CI, tests, SYCL and s390x. No post-tag master delta existed at
the review snapshot. CPU PCH was then an additional build-policy difference;
its fix and the later full PCH removal are now upstream.

The scope is **15 remote patches, eight local adaptations/guards**, the
recipe and relevant upstream delta. Independent source review found no
concealed payload, credential collection, unexpected runtime networking,
persistence or permission bypass. This does not establish that the package,
ROCm binaries, image codecs or npm dependencies are vulnerability-free.

- **28/28 source hashes pass**. A clean actual makepkg preparation and a
  separate AUR-style parent Git checkout both apply every patch without fuzz
  or rejects and produce byte-identical prepared sources. The six retained
  local patch bodies only change version comments. Remote hashes are unchanged
  except the deliberately updated GGUF series; new sources have new names.
- The carry delta is **50 text files, 1,252 additions and 192 removals** versus
  pristine b10951. Another **3,535 files are unchanged**. No binary payload,
  source deletion, unsafe archive path or added symlink was found. The two
  carried loopback RPC test scripts were already executable in b10938; there
  is no daily executable/permission change. All **221 Python modules** pass
  syntax-only parsing, without executing them. The daily runtime changes are
  explained by CPU cache-line/PCH hardening, four MiniCPM-V array replacements,
  removal of the duplicate GGUF
  assertion, and the inherited grammar/BF16 changes. The retained MTP, Qwen,
  PLE, hipCUB, RPC and JSON-schema implementations match the preceding package.
- Alias checks across **1,215 historical `.SRCINFO` revisions** find no reused
  filename with a changed hash, including all **11 new aliases**. The same hash
  variables continue to name remote download and application files. `.SRCINFO`
  is regenerated from the actual tested recipe.
- The GGUF runtime guard matches #28810. All **ten added test lines** match
  the upstream test; only surrounding context is rebased to retain the current
  zero-dimension test. An initial direct-application failure and a local patch
  context correction are preserved in the logs. An inadvertently started
  partial-tree build was stopped; final validation uses a fresh source/build
  tree, not any artifact from those attempts.
- **Eight cache-line probes pass** using Arch GCC/G++: C, ordinary C++, forced
  PCH include order, and an explicitly simulated 256-byte C++ interference-size
  setting, before/after the fix. Normal x86 stays 64/16 bytes/floats throughout;
  the simulated old C++ path becomes 256/64 while C stays 64/16, and the patch
  restores agreement. This stress case is not an observed Strix failure.
- MiniCPM-V tests use the **exact extracted position loops at both sites**:
  **20 fixed cases pass**, eight valid old controls match, and twelve old
  over-limit cases produce UBSan bounds failures. Four additional ASan controls
  confirm stack-buffer-overflow for 1,071 patch rows/columns at both sites.
  The full patched `clip.cpp` differs only in four array declarations. These
  are bounded loop tests, not an end-to-end model/image-quality run.

- The **fresh full Arch HIP package build passes**, including the Web UI,
  all CPU variants, LTO and the MiniCPM-V translation unit. The actual provider is
  **`rocm-nightly-gfx1151-bin 10.2.0a20260913-1`**, built from its AUR recipe and
  installed normally with dependency checks; **29,495 provider files verify,
  zero altered**. This is not a compile against stock ROCm or substituted headers.
- The separate fresh CPU build passes **65/65 CTests**, including both bounded
  loopback RPC guards. Explicit seeded native GGUF tests pass **93/93**,
  retaining `TENSORS_ZERO_DIM` and exercising the new `TENSORS_PAD_OVERFLOW`
  rejection. All **623 ARGSORT/TOP_K** cases pass. Architecture tests pass
  **130 comparisons and 111 round trips**, with 23 and 42 expected skips
  respectively; six tokenizer fixtures match their pinned Git LFS hashes.
- The MTP graph-reuse control produces **2,304 finite, bit-identical logits**
  with reuse enabled/disabled: six reuse hits versus zero and two distinct,
  stable arenas. Native rollback probing preserves fresh/populated contexts
  without extra evaluation. Nemotron v1/v2 each produce **1,536 finite logits**;
  latent/router widths, target-only skipping and clean zero-divisor rejection
  pass, with v1 matching the preceding control. Six Qwen4-Exp rollback cases
  across zero/nonzero allocator fill have maximum difference zero. Eight
  additional metadata-only GGUF edge cases pass. These are small CPU fixtures,
  not production-weight or HIP acceptance/performance measurements.
- The UI passes **674 tests in 50 files** and `npm run check` reports **zero
  errors and zero warnings**. Eight focused tests of the actual production
  tools-probe modules also pass. The lockfile is byte-identical to b10938;
  the fresh registry audit still reports **17 affected packages: seven high,
  nine moderate, one low, no critical**, across 22 advisory URLs. These remain
  dependency risks, not evidence of malware introduced by these patches;
  no unreviewed forced dependency upgrade was applied.
- The actual CPU server passes **13 router/authentication checks**: two-key
  file authentication and denial, serialized A→B→A model switching at
  `--models-max 1`, real generation, oversized-prompt and three invalid-schema
  rejection/recovery cases, valid bounded JSON output, explicit unload,
  colored subprocess state framing, key redaction and clean shutdown.
  This does not establish concurrent router or multi-slot MTP safety.

- The final archive is **25,621,226 bytes**, SHA-256
  `e6c32024416a18e044f7f39cfb4c980ba0d1b8e2585a891eaf3d94d3022aa500`.
  Artifact inspection covers **67 ELF files, 14 CPU variants and 182 HIP
  offload bundles**, all targeting gfx1151, including all **49 FA type pairs**.
  CPU PCH artifacts are absent; llama/mtmd PCH remains. No setuid/world-writable
  payload, escaping symlink, executable stack, text relocation, unresolved
  library, or empty/relative/build-directory runtime search path was found.
  The HIP DSO's only RUNPATH is `/opt/rocm/lib`. makepkg's `$srcdir` warning is
  from embedded source/diagnostic strings, not a dynamic loader search path.
- Normal `pacman -U` upgrades the container from b10938 to b10951 with
  dependencies enforced. **127 installed files verify, zero altered**; the
  service remains disabled. Installed binaries report **10951 / `093a2f8`**
  and the CPU stories15M 16-token completion smoke test passes. Expected
  post-install warnings concern the container's non-booted service manager
  and unavailable audit log, not package installation failure.

Exact HIP preprocessing still selects hipCUB argsort-and-copy:
`GGML_CUDA_USE_CUB` is defined, `CUB_TOP_K_AVAILABLE` and CCCL version macros
are absent. No `DeviceTopK` or `rocprim::topk` route is selected. No usable ROCm
GPU is exposed, so numerical correctness, MTP acceptance, SSD throughput and
VMM reliability remain unverified on-device.

The MiniCPM-V correction is intentionally narrow: it does not add global
image-dimension/resource caps or repair every dimension product. The prior
extreme-boundary JSON grammar overflow remains in byte-identical downstream
code; parser guards are not complete grammar sanitization. RPC must remain
trusted/firewalled with optional disk caching off. The rejected #28837 API-key
forwarding still exposes raw keys in arguments/logs, so keep `--api-key-file`.
The new Python-reader recursion proposal #28880 is watched at the separate
`python-gguf` provider; this binary package does not install that reader.

#### Previous b10938 validation (September 13)

The scope is **16 remote patches, six local adaptations/guards**, the recipe
and relevant upstream delta. Independent source reviews found no concealed
payload, credential collection, unsolicited runtime networking, persistence,
or permission bypass in the carried changes. This is not proof that the
package is vulnerability-free or a complete audit of ROCm binaries/npm.

- **27/27 source hashes pass** and actual Arch makepkg preparation applies
  every patch with no fuzz or rejects. Three remote diffs change only GitHub
  index headers; the new hashes change their complete source aliases too.
  The five retained local patch bodies are unchanged after version comments;
  the schema guard has a new, separate filename/checksum.
- The prepared delta versus pristine b10938 is **47 text files, 1,248 additions
  and 177 removals**: two RPC test files added, no source deletion, binary
  payload, new symlink or executable-bit change. Syntax checks cover **118
  Python files** without importing them. All 65 changed files versus the old
  prepared package are explained by the upstream delta or numeric guard;
  retained HIP/TOP_K/FA, RPC, GGUF, Qwen, Nemotron and PLE implementations are
  byte-identical to their previously verified counterparts where upstream did
  not otherwise change them.
- The new numeric guard passes **65 actual-parser boundary fixtures under
  UBSan/float-cast-overflow**, plus **12 independent additional cases**. The
  upstream control has 19 sanitizer failures and 15 silent wrong-range
  acceptances. Supported integer limits, fractional rounding and default
  counts are preserved. This checks conversions, not all JSON-schema semantics
  or resource exhaustion from otherwise representable input.
- Complete reverse-application checks prove the retired #28747 and #28787
  changes are upstream. The vendored HTTP pair and sync script match the
  previous verified package byte-for-byte; its transport behavior is not a new
  delta introduced by this update.
- Independent preparation inside a real AUR-style parent Git checkout with a
  restrictive ignore file matches **all 3,585 prepared source files**. Across
  HEAD and three earlier revisions, the **67 distinct source filenames** have
  zero reused names with changed hashes. All **16** simulated remote checksum
  updates also change the download and application filename. `.SRCINFO` is
  regenerated by makepkg from the tested recipe.
- Svelte checking reports **zero errors and warnings**; all **eight targeted
  production-method UI checks** pass, including explicit recovery after a
  cached `/tools` 403. All **674 UI unit tests** pass in 50 files with two
  workers and a 20-second timeout.
- **63 ordinary CTests plus both bounded RPC guard CTests pass: 65/65 total**.
  The latter run only against this patched build on loopback, confirm rejection
  of invalid graph nodes/four tiny malformed shapes, preserve valid row
  operations, and verify continued service. No unpatched exploit control or
  external RPC target is used.
- **12 CPU router/HTTP checks pass**: absent/wrong-key rejection, both keys
  from one `--api-key-file` accepted by the child, serialized A/B/A switching
  under `--models-max 1`, no raw keys in status arguments/logs, actual text
  generation, three numeric-schema failures returning 4xx with continued
  service, valid bounded-integer JSON generation, explicit unloading, colored
  IPC and clean shutdown. These are serialized tests, not proof against
  concurrent admission races. The tiny model needed its compatible `llama2`
  template; an initial ChatML fixture mismatch is not hidden as a source fix.
- **130 CPU architecture cases, 111 model roundtrips and 623 explicit CPU
  ARGSORT/TOP_K cases pass**. The default backend runner skips the CPU reference
  device and is not counted as an all-operations test.
- Qwen3.5 MTP yields **2,304 finite, bit-identical logits** with graph reuse
  on/off, two stable separate arenas, and six versus zero reused graphs. Its
  logits also match b10920 exactly. The early native rollback-capability probe
  preserves both fresh/populated context state and performs no probe decode.
- Normal F32 Nemotron MTPv1/v2 fixtures pass target-only/MTP loading and emit
  **1,536 finite logits each**, matching b10920 exactly. The router retains its
  original width; the v2 expert FFN uses the latent width. Missing NextN expert
  metadata returns a clean load error with the process alive. The fixtures
  retain the documented omission of unnecessary F32 scale tensors; this does
  not resolve the inherited optional-scale accounting limitation below.
- **Eight metadata-only GGUF padding cases** pass without tensor-data access.
  All **six Qwen4-Exp recurrent rollback comparisons** pass across zero/nonzero
  state fills, including checkpoint restoration, split replay and sequence
  isolation. These synthetic results do not settle real-model issue #28019.
  All six vocabulary GGUFs match their pinned LFS checksums.

The numeric guard is deliberately a **parser-boundary** fix. A separate
downstream grammar-builder defect remains: an integer schema with
`maximum: -9223372036854775808` negates `INT64_MIN`. Bounded UBSan controls
reproduce it in both b10920 and b10938; that helper is byte-identical across
the update. Do not treat accepted parser extrema or this guard as end-to-end
safe handling of arbitrary untrusted schemas. General grammar/resource
hardening is outside this narrow patch.

The fresh npm audit reports **17 affected packages: seven high, nine moderate,
one low, zero critical**, still spanning the same **22 advisory URLs**. The
lockfile is byte-identical to b10920. The reduction from 19 affected packages
comes from updated audit propagation through the PWA/sharp dependency graph,
not from a dependency fix in this package. No forced upgrade is applied.
Lifecycle scripts remain a build-time supply-chain boundary, and the browser
advisories and `?q=` auto-submission concerns remain separate from the carried
patches. API-only users can disable the UI with `--no-ui`.

The full **Arch `CI=1` HIP/Web UI makepkg build passes** against the actual
installed **`rocm-nightly-gfx1151-bin 10.2.0a20260912-1`** provider, with normal
dependency checks. The provider verifies **29,493 files, zero altered**.
The artifact contains **67 ELF files, 14 CPU variants and 182 HIP bundles,
all gfx1151**. No missing library, unsafe permissions/symlinks, text relocation,
executable stack or CUDA/Vulkan backend was found. Its only RUNPATH is the HIP
module's absolute `/opt/rocm/lib`; build-directory diagnostic strings are not
library search paths. All 49 FA pairs compile, and CMake records the intended
10938 / `f1e44dc` identity, HIP-only backend, MMQ, graphs, no-VMM and RPATH policy.

The tested artifact is **25,620,496 bytes**, SHA-256
`063ec2c227d77a18f2fb1bc966f248bfd44952dec281d16e78e1f38eacb7be04`.
This identifies this build, not a reproducible-build guarantee. The normal
pacman upgrade succeeds with dependency checks; installed verification reports
**127 files, zero altered**. CLI/server identify **10938 / f1e44dc**, both help
commands pass, and the installed all-CPU-variants/LTO CLI generates a completion
with the retained tiny model and `-ngl 0`. The systemd service remains disabled.
`bash -n`, generated `.SRCINFO` parity and staged `git diff --check` pass;
ShellCheck still reports inherited packaging/word-splitting warnings, not a
new shell-evaluation path. GPU validation remains unavailable: no `/dev/kfd` is exposed;
compile/CPU tests do not establish gfx1151 numerical correctness, MTP acceptance,
SSD-PLE throughput or VMM reliability.

The new [#28837 API-key forwarding proposal](https://github.com/ggml-org/llama.cpp/pull/28837)
is **not carried**: raw `LLAMA_API_KEY` values would enter `meta.args`, which
is returned by `/api/models` and printed in child-process logs. Redacting only
the preset does not close those paths. Keep using `--api-key-file` rather than
adopting that proposal. This is a rejected-patch finding, not a new behavior in
the package.

The separate [RPC cache proposal #28789](https://github.com/ggml-org/llama.cpp/pull/28789)
now restores a server-side pending-hash/write gate after the author acknowledged
that the client-only change was insufficient. Partial-file integrity, unchecked
write failures and transaction binding remain unresolved; the latest revision
has not received a new human review. It stays excluded. Keep optional
`ggml-rpc-server -c` off for sensitive inference and RPC trusted/firewalled;
this is not the HTTP API or normal local inference. Existing cache files are
not automatically removed.

#### Previous b10920 validation (September 12)

The current scope is **18 remote patches, five local adaptations/guards**,
the package recipe, and the relevant upstream delta. Static review has found
no concealed payload, credential collection, unsolicited runtime destination,
new persistence mechanism, or permission bypass in the carried changes.
This is not a guarantee of absence of vulnerabilities, nor a complete audit
of ROCm's binary distribution or npm's transitive dependencies.

- **28/28 source checksums pass**, followed by no-fuzz preparation with no
  rejects. The four renamed local patch bodies are unchanged after their
  first-line version comments; the gfx1151 FA guard is a separate new file.
  Twelve retained remote files match their prior hashes; the updated UI fix
  and five new remote carries have distinct checksum-qualified filenames.
- The prepared delta is **48 text files, 1,517 additions and 265 removals**.
  No source file is deleted, and there are no new binary payloads, symlinks or
  executable-bit changes. Syntax-only checks cover 112 converter/GGUF/RPC
  Python files; no malicious RPC request is executed by this review.
- An independent AUR-style makepkg preparation matches **all 3,583 source
  files**. Comparing aliases against four earlier package revisions finds
  **zero reused filenames with changed hashes**; all **18** simulated remote
  checksum changes also change the filename used to download/apply the patch.
  `.SRCINFO` is generated by makepkg from the tested recipe. `bash -n` and
  `git diff --check` pass; inherited ShellCheck packaging/word-splitting
  findings remain, without a new shell-evaluation path.
- The local FA guard passes **32,256 exact-source selector combinations**:
  only 32 eligible gfx1151 D=256 cases switch MMA to tile, and all 5,376
  one-token cases are unchanged. Allocation sizing, support and execution
  share the selector. This tests dispatch, not GPU numerical results.
- cpp-httplib's two vendored files match the official 0.56.0 split output
  byte-for-byte. A compiled loopback harness passes **12 HTTP/WS checks**,
  covering response framing, fake proxy/origin credential separation,
  preencoded output, overflowing ranges, SSE and timeout recovery. These are
  bounded local tests, not traffic to an external proxy or use of real secrets.
  The old 0.54.1 control fails eight corresponding checks as expected.
- **62/62 in-scope CTests passed on the first run**. The two malformed-RPC
  scripts are excluded. Upstream now leaves backend-op and architecture tests
  outside CTest. Explicit checks pass **623/623 CPU ARGSORT/TOP_K** cases,
  **130 architecture numerical checks and 111 model roundtrips**, with 23/42
  intentional architecture skips respectively. The default backend runner
  skips the CPU reference backend; it is not counted as an all-operations test.
- Qwen3.5 MTP yields **2,304 finite, bit-identical logits** with graph reuse
  enabled/disabled, two stable metadata arenas and six versus zero reuses.
  The early rollback-capability probe preserves context state. Qwen4-Exp's
  full/partial/dirty restore and multi-sequence isolation tests pass for zero
  and nonzero state fills; this synthetic result does not settle real-model
  issue #28019. **Eight bounded GGUF padding checks** pass without tensor-data
  access or out-of-bounds execution. Six vocabulary fixtures match the hashes
  in their pinned Git LFS pointers.
- Normal F32 Nemotron MTPv1/v2 fixtures both pass target-only and MTP loading;
  MTP decode produces **1,536 finite logits each**. The router retains the
  original hidden width while the v2 expert FFN uses the reduced latent width.
  V1 logits match the no-new-carry control byte-for-byte. Missing NextN FFN
  metadata returns a clean load error, without division by zero.
  An additional synthetic fixture containing optional `.scale`/`.input_scale`
  tensors on all F32 weights fails target-only tensor accounting on **both old
  and new builds**: 18 skipped NextN scales remain uncounted. That inherited
  limitation and original failure evidence are retained; no runtime workaround
  was added to hide it. Ordinary F32 fixtures omit those unnecessary scales.
- **674/674 UI unit tests** pass with two workers and a 20-second timeout;
  the initial default-parallel run during compilation had one five-second
  timeout, not an assertion failure. Svelte checking reports zero errors and
  warnings. All **eight targeted production-method tests** pass, including
  explicit tools-panel recovery after a cached 403, without a page reload.
- A fresh CPU router smoke test passes API-key rejection, two presets with
  `--models-max 1`, serialized A/B/A switching, tokenization, actual eight-token
  generation, explicit unload/reaping, forced-color child state messages and
  clean shutdown. This is not a proof against concurrent cold-start races.

The complete **Arch `CI=1` HIP/Web UI package build and normal pacman upgrade
passed**, using the actual **`rocm-nightly-gfx1151-bin 10.2.0a20260911-1`**
provider with ordinary dependency checks. Provider verification reports
**29,332 files, zero altered**. The result contains **67 ELF files**, 14 CPU
backend variants and **182 HIP bundles, all gfx1151**. No CUDA/Vulkan backend,
missing library, unsafe symlink/permissions, text relocation or executable
stack was found. The only RUNPATH is the HIP module's absolute `/opt/rocm/lib`.
All 49 FA type pairs compile. Installed verification reports **127 files,
zero altered**; CLI/server identify **10920 / eafe15a**, and the service remains
disabled. PCH/unity builds compile without an additional header workaround.
The installed all-CPU-variants/LTO artifact also generates a completion with
the existing tiny test model and `-ngl 0`; no model download is needed.

The final artifact is **25,578,688 bytes**, SHA-256
`d4487ecef4de08f2417a1eca63e26f87e1a228b640394eebc3085bc63375ee49`.
Its final repackage records a formatting-only local-patch revision with a new
filename/checksum; the applied source and installed payload are unchanged.
This identifies this tested build, not a reproducible-build guarantee.
The exact HIP preprocessing still enables `GGML_CUDA_USE_CUB` but does not
expose `CUB_TOP_K_AVAILABLE`: the nightly uses hipCUB argsort-and-copy, not
CCCL `DeviceTopK` or `rocprim::topk`. No usable ROCm GPU is exposed in these
containers; GPU numerical correctness, image/MTP acceptance, SSD throughput
and VMM reliability are not established by the build or CPU tests.

The fresh npm audit remains **19 affected packages: nine high, nine moderate,
one low, zero critical**, spanning 22 distinct advisory URLs. The UI lockfile
is unchanged and no forced dependency upgrade is applied. npm lifecycle
scripts remain a build-time supply-chain boundary. The new cpp-httplib fixes
do not resolve these separate browser/dependency advisories or Web UI `?q=`
auto-submission; API-only users can disable the UI with `--no-ui`.

The most important new operational warning is [RPC disk caching #28789](https://github.com/ggml-org/llama.cpp/pull/28789):
`ggml-rpc-server -c` can persist large activation transfers, not just model weights,
and incomplete existing cache files can leave stale tensor data. Do not enable
that optional disk cache for sensitive inference. The requested client-only
WEIGHTS gate would not fix the unchanged server's unconditional cache writes;
the broader server patch is not carried pending review. Existing cache files
are not automatically removed. This concerns the separate ggml RPC backend
server, not the HTTP API or normal local `llama-server` inference.

#### Previous b10909 validation (September 11)

The audit covers **14 remote patches, four local adaptations**, the package
recipe and the relevant upstream delta. Two independent static passes found
**no malware indicators**: no concealed binary/encoded payload, credential
collection, unsolicited runtime networking or process execution, persistence,
or permission bypass. The new guards and UI retry changes match their stated
scope. Expected loader diagnostics, PLE page advice and opt-in loopback RPC
test subprocesses are not hidden runtime hooks. This is not a guarantee that
the package or its dependencies are vulnerability-free.

Source and AUR-helper checks passed:

- **23/23 SHA-256 checks** and exact-context preparation with no fuzz/rejects.
  The four renamed local patch bodies are identical to b10884 after excluding
  only their first-line version comments. The ten retained remote patches
  match their existing hashes; two former carries are now inherited upstream.
- **42 changed text files**, 1,196 additions and 168 removals versus pristine
  b10909, with no deleted source files, added binary payloads/symlinks or
  executable-bit changes. Syntax-only parsing passed for 112 converter/GGUF/RPC
  Python files, without importing them or running malformed RPC requests.
- Independent preparation inside an AUR-style parent Git checkout matches
  **all 3,578 source files** in the actual makepkg tree. Git-discovery and
  Tailwind scanner boundaries remain in place.
- Comparing source aliases against b10884, b10872 and b10853 finds **zero
  reused filenames with changed hashes**. All **14** simulated remote-checksum
  changes produce a different download/application filename automatically.
  `.SRCINFO` is regenerated from the tested recipe. `bash -n` and
  `git diff --check` pass; inherited ShellCheck packaging/word-splitting
  findings remain, without a new shell-evaluation path.

Targeted regression results:

- **All 63 in-scope CTests passed**, after a DeepSeek4 rollback test exceeded
  the initial 300-second limit during concurrent compilation and passed a
  serial two-thread retry. The two malformed-input RPC tests were intentionally
  excluded. The architecture runner is no longer automatically registered
  upstream, so it was run separately: **130 numerical checks and 111 model
  roundtrips passed**, with 23/42 upstream-marked skips respectively.
  **623/623 CPU ARGSORT/TOP_K cases** also passed. These are not GPU results.
- **Eight GGUF padding cases passed**, using only 101–128-byte metadata buffers
  with `params.ctx=nullptr`: no tensor allocation, tensor-data access or
  out-of-bounds PoC execution. The two overflowing cases that pristine b10909
  accepts are rejected; valid boundary sizes and ordinary metadata still pass.
- The **#28749 fresh/populated-context checks passed**: capability detection
  performs no extra decode and preserves the populated cache position.
- A valid synthetic Qwen3.5 MTP head produces **2,304 bit-identical finite
  logits** with reuse enabled/disabled, **six versus zero reuses**, and two
  distinct stable graph metadata arenas. Switching arenas does not itself
  count as ggml graph reuse; the test exercises repeated batches in each arena.
- The unchanged upstream **Qwen4-Exp recurrent rollback test passed** against
  both pristine and patched b10909, using the same small synthetic fixture:
  full, partial and dirty-context restoration, multi-sequence split replay
  and sequence isolation, with both fill patterns. This did **not** reproduce
  the new real-model #28019 report. It is limited synthetic CPU evidence, not
  proof that arbitrary long conversations or concurrent MTP are safe.
- **674/674 UI unit tests** across 50 files passed; Svelte checking reports
  zero errors/warnings. **Eight targeted #28646 retry cases passed** using
  extracted production methods/guards; pristine b10909 fails four expected
  checks. Typed 403 suppression, non-403 retries, explicit refresh and existing
  tools are covered. This is runtime logic testing, not browser end-to-end
  validation, and no test fixture is added to the packaged UI source.

The September 10 ROCm provider is now built and installed as an actual pacman
package, rather than only extracting its payload. **29,333 provider files,
zero altered** pass `pacman -Qkk`, and its virtual HIP dependencies satisfy
`pacman -T`. No dependency bypass is used for this package build; exact SDK
versions and the AMD archive checksum are recorded in the dependency section.

The complete **Arch `CI=1` HIP/Web UI package build and normal pacman
installation passed**. The artifact contains **67 ELF files**, 14 CPU backend
variants and **182 HIP bundles, all gfx1151**, with no CUDA/Vulkan linkage,
missing libraries, unsafe symlinks/permissions, text relocations or executable
stack. Its only RUNPATH is the HIP module's absolute `/opt/rocm/lib`.
`pacman -Qkk` reports **127 files, zero altered**; CLI/server identify
`build 10909, commit a2878d3`; the packaged service stays disabled.
All 49 configured FA type pairs compile. The tested HIP translation unit
defines `GGML_CUDA_USE_CUB` but not `CUB_TOP_K_AVAILABLE`, so TOP_K still uses
hipCUB argsort-and-copy, not `DeviceTopK` or `rocprim::topk`.

The test artifact is **25,570,177 bytes**, SHA-256
`7f75778415ea87371c8e9eab140cd862ee689df8c4c14e1b78ec10d57c2a3639`.
This identifies one verified build, not a reproducible-build guarantee.
Inherited GCC/LTO warnings and diagnostic source-path strings remain; they
are not an unsafe runtime loader search path.

The fresh dependency audit still reports **19 affected UI packages: nine high,
nine moderate, one low, zero critical**, spanning 22 advisory URLs. The UI
lockfile is unchanged; no forced dependency rewrite was applied. Build-time
lifecycle scripts still run under `npm ci`, so source hashes and a clean native
patch review do not eliminate dependency supply-chain risk. Mermaid remains
relevant to untrusted browser-rendered output. `--no-ui` removes that browser
surface for API-only deployments.

Retained limits include trusted/firewalled **unauthenticated RPC**, incomplete
validation of row-index values and hostile-model arithmetic, PLE readahead
without a second local range guard, and **single-slot `--np 1` MTP**. The
inherited Web UI `?q=` auto-submission concern is not fixed by #28646: avoid
blanket tool approval. Neither test container exposes a usable ROCm GPU;
on-device numerical correctness, graph capture, SSD throughput, production
MTP acceptance and VMM reliability remain unverified. In particular, do not
equate the new synthetic restore checks with a fix for #28019 or the Windows
gfx1201 dirty-KV report under #26419.

#### Previous b10884 validation (September 10)

That audit covered **12 remote patches, four local adaptations**, the
recipe/source-cache changes, and the 12-commit upstream delta. Two independent
static passes found **no malware indicators**: no concealed binary/encoded
payload, credential collection, unsolicited runtime network/process execution,
or persistence in the patch stack. The intentional PLE page-advice calls and
explicit loopback regression-test subprocesses are accounted for. This is not
a guarantee that the native code is vulnerability-free.

The new #28195 change only retunes existing RDNA3.5 numeric configurations.
#28102 changes launch selection and existing WMMA configurations, not model
files or persistent KV format. Existing eligibility/shape/padding checks remain;
F16 scratch conversion is already shared by the old and new routes. Different
transient fixup buffers and floating-point reduction order remain a runtime
risk to test, particularly at small MTP verification widths. The reviewed
upstream video identity change scopes frame IDs to their originating video;
it does not prove isolation of every other prompt/speculative cache.

Source integrity and preparation checks passed:

- **21/21 SHA-256 checks**, with no fuzzy hunks or rejected applications.
  The four local patch bodies are byte-identical to b10872 after excluding
  only their first-line version comments; retained remote files are identical.
- **41 changed text files**, 1,219 additions and 161 removals versus pristine
  b10884. No source deletions, binary payloads, added symlinks or executable-bit
  changes. Syntax-only parsing passed for 112 converter/GGUF/RPC Python files,
  without importing or executing those files.
- An independent prepare inside an AUR-style parent Git repository matches
  **all 3,571 source files** in the actual makepkg-prepared tree. This checks
  the Git-discovery boundary as well as the presence of the applied changes.
- Comparing both b10872 and b10853 source inventories finds **zero reused
  filenames with changed hashes**; the only reused aliases are the four
  unchanged service/config assets. Simulated checksum changes for each of the
  **12 remote patches** automatically change the corresponding alias.
  `.SRCINFO` was regenerated from the tested recipe. `bash -n` and
  `git diff --check` pass; ShellCheck's remaining findings are the inherited
  makepkg conventions and intentional option splitting, not a new injection path.

Fresh validation of the exact b10884 stack:

- **64/64 ordinary CTests passed** in the CPU/shared/RPC build, including
  recurrent state, model loading, chat/Jinja and normal multi-server RPC.
  Verified vocabulary fixtures were reused. The two malformed-input RPC
  regression scripts were syntax-checked, **not executed**.
- **623/623 CPU ARGSORT/TOP_K cases** and **six valid loopback-RPC scheduler
  cases** passed, with 31/64/128 inputs and two executions per graph.
- Valid synthetic Qwen3.5 MTP again produced **2,304 identical finite logits**
  with graph reuse enabled/disabled, nine versus zero reuses, and distinct
  stable prefill/output metadata addresses across three clear/new-sequence
  rounds. This is not a Qwen3.8 acceptance/quality measurement.
- **28/28 targeted Flash Attention CPU-reference cases** passed: D256,
  24 query/two KV heads, batches 1/2/4/5/6/7/8, KV lengths 512/4096, masked
  strided F16/Q8_0 caches. **All six new #28102 evaluation cases** also passed.
  These exercise valid shapes against CPU reference behavior; they do **not**
  execute the new HIP WMMA dispatch.
- A full **Arch `CI=1` HIP package and Web UI build passed** using the retained
  September 7 `rocm-nightly-gfx1151-bin` payload detailed below. All **49 FA
  type pairs** are enabled. Artifact inspection found **67 ELF files and 182
  HIP bundles, all gfx1151**, resolved dependencies, no CUDA/Vulkan linkage
  and no unsafe filesystem entries. The sole RUNPATH is the HIP module's
  absolute `/opt/rocm/lib`.
- Disposable-container installation passed: **127 files, zero altered** in
  `pacman -Qkk`; CLI/server report `build 10884, commit 434ddbb`; the service
  remains disabled. Installed help reflects the new loading arguments.
  The embedded CSS expands to 543,230 bytes and all six checked Tailwind
  utilities are present. The independent AUR-style prepare also preserves
  the local `.git` scanner boundary; the package contains actual utility CSS.

The test artifact is **25,573,803 bytes**, SHA-256
`e36c4337bb7de6ff26980d90aa13eb6f905c73e26dbe3826753bd3fd09c27f5c`.
This identifies this build, not a reproducible-build guarantee. Existing
GCC/LTO warnings and diagnostic source-path strings remain. The actual
preprocessor defines `GGML_CUDA_USE_CUB`, not `CUB_TOP_K_AVAILABLE`: TOP_K
still uses bitonic/hipCUB argsort and truncation, not `DeviceTopK` or
`rocprim::topk`. A newer nightly provider recipe was checked, but its September
10 SDK was **not** installed or tested. There is no usable GPU in either
builder; HIP numerical correctness, graph capture, SSD-PLE throughput, large
model memory peaks and VMM reliability still require the real Strix Halo.

**Known dependency/security exceptions:** the fresh September 10
`npm audit --package-lock-only --ignore-scripts` still reports **19 affected
packages: nine high, nine moderate, one low, zero critical** (22 distinct
advisory URLs). The UI manifest,
lockfile and installed lifecycle scripts are unchanged from b10872. No forced
dependency rewrite was applied; the existing advisory discussion below remains
applicable. A clean patch review is not a clean dependency audit.

Inherited Web UI [issue #25790](https://github.com/ggml-org/llama.cpp/issues/25790)
also remains unresolved despite automatic closure: `?q=` links auto-submit
prompts. API-key authentication does not stop an authenticated browser from
following a hostile link and invoking tools for which the user has already
granted permission. Keep tools disabled or require per-call confirmation and
least privilege; API-only deployments can use `--no-ui`. Other retained limits
are unauthenticated/trusted-only RPC, incomplete row-index-value and
hostile-model arithmetic validation, PLE readahead without a second local
range guard, and mandatory single-slot `--np 1` MTP.

#### Previous b10872 validation (September 9)

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
-DGGML_CUDA_FA_QUANTS=all
-DHIP_PLATFORM=amd
-DGGML_VULKAN=OFF
-DCMAKE_SKIP_RPATH=ON
```

`GGML_CUDA_*` names are not typos. llama.cpp's CUDA-family backend sources are
shared by CUDA and HIP, so several HIP controls retain their historical CUDA
names.

Inherited #28079 replaces the deprecated all-quants switch with
`GGML_CUDA_FA_QUANTS`. `all` preserves all 49 combinations of the seven
supported K/V types: F16, BF16, Q4_0, Q4_1, Q5_0, Q5_1 and Q8_0. Upstream's
new default builds only four pairs; this package deliberately keeps the broader
coverage. Custom builds may override it, for example
`LLAMA_BUILD_EXTRA_ARGS='-DGGML_CUDA_FA_QUANTS=f16-f16,q8_0-q8_0'`, to reduce
compile time and binary size. F16/F16 is always included. Do not assume an
omitted pair has a working fast kernel. IQ4_NL is not a supported KV type;
its prior apparent support silently used F16. This is separate from the
IQ4_NL **model-weight/PLE** gather support carried here.

### Migrating existing presets to b10884

Inherited #28334 removes the legacy mmap/mlock/direct-I/O arguments, rather
than merely deprecating them. In an existing `models.ini`, replace
`no-mmap = true` with `load-mode = none`. Remove any other obsolete loading
keys and express the intended policy with `load-mode`; the corresponding
command-line option is `--load-mode` / `-lm`.

```ini
[*]
# Replacement for the old global no-mmap = true
load-mode = none

[qwen3.8]
# In addition to model, mmproj, sidecar and the other model-specific settings
lazy-mode = on
```

Keep the rest of each existing preset, and use its actual section name.
`load-mode = none` does **not** turn off the explicitly lazy PLE mapping.
Do not leave the removed `no-mmap` key alongside the replacement. The
`llama-server --models-preset ...` router command itself need not change.
The packaged service/config assets contain no removed loading arguments.

### HIP tuning and runtime environment

The new #28102 tuning uses the existing AMD WMMA path in the shared backend.
It does not require enabling the separate optional
`GGML_HIP_ROCWMMA_FATTN` build switch; that setting remains unchanged.

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

`GGML_HIP_MMQ_MFMA` remains effectively `ON`: that is b11012's upstream
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
[llama.cpp `b11012`](https://github.com/ggml-org/llama.cpp/blob/b11012/ggml/CMakeLists.txt).
This package spells it out so an upstream default change cannot silently alter
the allocator.

The sibling package's line showing `GGML_HIP_NO_VMM=OFF` remains commented out
and now notes that its maintainer has seen VMM work with a nightly. It therefore
still inherits upstream's no-VMM default today. This package pins that same
policy explicitly until an A/B test on the installed nightly shows a stable,
repeatable benefit.

The current validation uses the exact `10.2.0a20260916-1` nightly package and
the b11012 no-VMM configuration. A successful compile/link does **not** show
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

The historical b10853, b10872 and b10884 validations on September 8–10 used
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

For the historical September 11 review, the tested provider was
**`10.1.0a20260910-1`**. This time its actual AUR PKGBUILD was built in a fresh
Arch container, and the resulting package was installed with pacman before
building llama.cpp. Neither makepkg nor the llama.cpp installation bypassed
dependency checks: the provider's virtual dependencies were exercised, not
only inspected. The AMD payload is 1,994,669,632 bytes with SHA-256
`cd63c4be1a7fef912340d29b745e593f357542aaedc99a53e90473df56c15b9f`.
It supplies HIP **7.16.26362**, AMD Clang **24.0.0git** at `d6f6cb6`,
rocPRIM **4.6.0**, and hipCUB **4.7.0**. Its HIP compilation still does not
expose CCCL `DeviceTopK`; the carried hipCUB argsort-and-copy route is active.
Installation/build results are not GPU runtime validation, and do not
establish that VMM should be reenabled. No complete audit of ROCm's binary
distribution is claimed by the source-patch review.

The September 12 review updated the actual provider package to
**`10.2.0a20260911-1`**, built from the live AUR recipe and installed normally
with pacman. The AMD archive is 2,004,270,603 bytes, SHA-256
`8dac5ffc1520293086dce820939e3246290ed4bdf3fd1fedfedd12296205aaf9`.
It supplies HIP **7.16.26363**, AMD Clang **24.0.0git** at `d19dd10`,
rocPRIM **4.6.0** and hipCUB **4.7.0**. This SDK change alone does not establish
VMM reliability or an inference-speed gain. The generic dependency policy and
explicit `GGML_HIP_NO_VMM=ON` remain unchanged.

The September 13 review used **`10.2.0a20260912-1`**, again built from the
actual AUR recipe and installed normally before llama.cpp. The AMD archive is
2,007,167,539 bytes, SHA-256
`cfdcec9ff55584ddf84939eaf5a5bf55b27d0e959c483d16213c8437c4657e42`.
It supplies HIP **7.16.26363**, AMD Clang **24.0.0git** at `522f87a`,
rocPRIM **4.7.0** and hipCUB **4.7.0**. Exact HIP translation-unit preprocessing
still enables `GGML_CUDA_USE_CUB` but not `CUB_TOP_K_AVAILABLE`: this package
uses hipCUB argsort-and-copy, not CCCL `DeviceTopK` or `rocprim::topk`.
The newer rocPRIM version does not by itself select a different algorithm or
prove a speedup. No allocator-policy or hard-dependency change follows from it.

The September 14 review uses **`10.2.0a20260913-1`**, built and installed as the
actual provider with normal dependency checks. Its AMD archive is
2,011,132,739 bytes, SHA-256
`0fb28b563cb22e9fe1a330d815e977a3a7080b1293ee71084bbce7d5b5cbe649`.
HIP **7.16.26363**, rocPRIM **4.7.0** and hipCUB **4.7.0** retain their previous
version numbers; AMD Clang **24.0.0git** advances to `bc1e171`. Actual HIP
preprocessing still selects the same hipCUB route. Identical version numbers
do not make separate nightly builds equivalent, and this compile validation
does not establish a runtime speed or VMM-stability improvement.

The September 15 review uses **`10.2.0a20260915-1`**, again built from the actual
AUR recipe and installed with normal dependency checks. Its AMD archive is
2,002,627,110 bytes, SHA-256
`89f41a35f1fdb06bf11dde22c9257ce8036b43dca70ef63b90e5f95c0d7ceb42`.
HIP advances to **7.16.26370**; rocPRIM/hipCUB stay **4.7.0** and AMD Clang
**24.0.0git** remains at `bc1e171`. The actual HIP preprocessor still selects
hipCUB argsort-and-copy, not `DeviceTopK`. A provider update is not evidence
that VMM should be reenabled or that inference gets faster.

The September 16 review uses **`10.2.0a20260916-1`**, built and installed as
the actual AUR provider. Its AMD archive is 2,002,903,114 bytes, SHA-256
`7f973ae20352559e6a70907a005a05ec5ccce275618f3a5097c98598b3479235`.
HIP remains **7.16.26370** and AMD Clang remains at **`bc1e171`**. The
provider identity is recorded separately from the compiler version because
matching version strings do not prove identical SDK contents. VMM stays off;
reenabling it still requires workload-specific testing on your GPU.

The September 17 review still finds **`10.2.0a20260916-1`** to be the live
provider and rebuilds it from that unchanged recipe for the b11012 validation.
The provider date is not a typo or a substitution with stock ROCm; no newer
nightly package was published in the initial review snapshot.

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

The inherited [#28549](https://github.com/ggml-org/llama.cpp/pull/28549) gives
output-producing and no-output graphs separate arenas. That separates the
draft's token-proposal and catch-up graphs, so alternating between them need
not repeatedly replace the same captured graph. The reviewed final design
uses this selection for every context, not just MTP. Its published gain is
CUDA-only: about 4.4% prediction throughput on an RTX 5090, with unchanged
acceptance. It adds a bounded metadata arena and can retain another backend
graph. It changes neither the sidecar format nor the single-slot rule;
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

- `-lm none -lzm on` is the essential pair for the SSD-backed mode on b11012.
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

- `-lm mmap+mlock`: mapped model ranges become pinned and the OS
  cannot reclaim the intended memory saving;
- `-lm dio`: lazy tensor reads require mmap, and reported Strix runs showed
  direct-I/O host RSS ballooning;
- `-lm mmap` as the default: it still works, but it also chooses mmap for dense
  weights and can lose the asynchronous-upload advantage of `none`; keep it as
  an A/B comparison only;
- a broad CPU tensor override for the PLE: b11012 already forces lazy tensors
  into their dedicated CPU context and deliberately ignores such overrides.

`-lm none -lzm off` is the controlled resident-PLE comparison. The identical
global load mode makes the lazy-mode toggle, rather than an unrelated dense
loader change, the main difference.

`--lazy-mode on-direct` is not present in this package. On September 17,
[PR #28136](https://github.com/ggml-org/llama.cpp/pull/28136) still has the same
reader-refactor head and no post-refactor approval. Its cold-cache evidence has
strengthened: earlier direct gfx1151 tests found +20–32% prefill, corrected
Windows tests found +91–133%, and Linux/Blackwell tests ranged from +167%
at 3K to +11% at 200K. A newer 24K Linux/Blackwell comparison reports about
2.07x cold prefill, while a Windows 25K real-prompt test reports +272% cold,
−4% warm, and +40% when accessing different PLE rows. Its MTP variant improved
cold prefill but left warm prefill and decode slightly slower. Those newer
Blackwell/Windows figures are not HIP measurements. None establishes a
universal speed improvement or an A/B against this package's carried prefetch.

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
  --json mtp-Qwen3.8-Flash-Next-Q8_0.gguf
```

Use JSON output when inspecting an untrusted GGUF: human-readable output can
print terminal control sequences from metadata keys or tensor names directly
([#28969](https://github.com/ggml-org/llama.cpp/issues/28969)). JSON escapes
those characters; do not pipe it through an unescaping/raw-output formatter.
This is an inspection-tool precaution, not a claim that arbitrary model files
are safe to load.

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

To isolate the tuning introduced in b10884, compare it with a **pre-b10884**
package using the **same ROCm payload and model files**, for both target-only
and depth-6 MTP. b10909 retained the same #28102/#28195 tuning, so comparing it
only with b10884 does not measure those optimizations anew. **b10920 adds a
gfx1151 D=256 FA fallback**, so a b10909/b10920 difference may reflect that
precaution as well as the new SDK and other changes. To isolate it, keep the
same source/SDK and vary only the local fallback, including interleaved
multi-image prompts and long-to-short cache reuse in the correctness checks.
**b10975 removes that precaution after the reporter withdrew the attribution**
and also adds Qwen norm fusion; a whole-version comparison cannot isolate
either change. Existing model/sidecar files remain compatible.
Include your normal `-ub 2048` prefill and a small-batch control such as
`-ub 16`, at short and long context. #28102's published large-prefill gain
coexists with a small-batch regression, and MTP verification naturally operates
at small widths; record prefill speed, decode speed, accepted drafts, time to
first token and peak memory separately. Test the actual Q8_0 target cache and
an F16 control. A CPU-reference test or successful HIP compilation cannot
establish an on-device MTP improvement. Do not attribute all before/after
differences to a single patch: b10884 also updates the upstream baseline.

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

The prepared `b11012` source includes a dedicated speculative-decoding client at
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

These proposals and issue reports were reviewed through 2026-09-17. Most are
not additional package patches; newly carried, inherited, closed, and
superseded items are retained to explain earlier decisions. Revisit the
applicable open items on every base sync. Author benchmarks and automated
reviews are distinguished from independent hardware evidence and human approval.

| PR or issue | Why it matters | Inclusion decision / remaining limits |
| --- | --- | --- |
| [Inherited #24292: invalidate freed RPC graph buffers](https://github.com/ggml-org/llama.cpp/pull/24292) | The merged fix invalidates cached compute graphs before buffer release, closing the reported graph-recompute use-after-free path. Our public-client loopback regression also finds that freeing an unrelated buffer invalidates the server graph while the client retains its UID, so the next reuse aborts instead of resending the graph. | Keep the security fix, but explicitly document this RPC availability regression; there is no transparent fallback or reviewed follow-up yet. A repair must coordinate shared dispatcher/per-device caches and queue order. RPC remains unauthenticated, trusted/firewalled only, and separate from the HTTP server API. |
| [Carried #29014: skip inactive fused expert weights](https://github.com/ggml-org/llama.cpp/pull/29014) | The nine-line `23ea986` loader repair honors `TENSOR_SKIP` for fused gate/up expert tensors, matching the existing QKV skip pattern. Physical GGUF controls reproduce inactive MTP weights being retained before the change, then pass fused/separate × active/skipped cases after it. | Include the exact locally bundled diff after independent source review and regression controls, while noting it has no upstream human approval. Active loading is unchanged; this fixes target-only models with an unused fused MTP tail, not a measured Flash-Next speedup or new model format. |
| [#28992: avoid skipped prompt-cache lookups](https://github.com/ggml-org/llama.cpp/pull/28992) / [issue #28998: retain cache across router eviction](https://github.com/ggml-org/llama.cpp/issues/28998) | #28992 adds a zero-denominator guard and checks whether a better cached prefix exists; two author CPU regressions now reuse one token instead of prefilling hundreds. #28998 separately requests persistent cache when the router unloads a model. | Watch the focused lookup repair pending human review and recurrent/MTP lifecycle controls. The eviction request has no implementation. Neither establishes saved draft state, transparent model-switch reuse, or a reason to enable concurrent MTP. |
| [Post-tag #29008: DeepSeek message delimiters](https://github.com/ggml-org/llama.cpp/pull/29008) / [#28987: StepFun reasoning preservation](https://github.com/ggml-org/llama.cpp/pull/28987) | The approved, merged DeepSeek change supplies user/assistant markers so checkpoints can align with user turns; author CUDA evidence shows much less repeated prefill. The StepFun proposal instead changes official-template reasoning-history behavior. | Let the narrow DeepSeek fix arrive in the next normal upstream snapshot; it is after b11012 and not a Qwen or security emergency. CISC rejects the StepFun template-policy change here. Neither fixes edits inside system/tool prefixes or proves multi-slot/MTP cache safety. |
| [#29004: configurable grammar repetition limit](https://github.com/ggml-org/llama.cpp/pull/29004) / [issue #29006: schema/chat control-token mismatch](https://github.com/ggml-org/llama.cpp/issues/29006) | One proposal exposes the grammar expansion limit; a separate Windows/Vulkan report finds JSON Schema failing on chat-template markers for Granite and Qwen while direct GBNF works. | Keep the resource limit and watch an owned narrow parser repair. Review notes the configurable-limit design was previously rejected; the new report has no fix or bisect. Do not conflate either with this package's numeric-schema overflow guard. |
| [Post-tag #28993: embedded GGUF relative alignment](https://github.com/ggml-org/llama.cpp/pull/28993) | Changes data-section alignment relative to an embedded GGUF's start and extends FILE-based LoRA loading, with explicit mmap-alignment rejection. | Already merged after b11012; leave for routine inheritance. Standalone target/sidecar GGUFs start at offset zero, so this does not improve their PLE residency or justify the wider loader/API backport. |
| [#28999: forward meta-backend graph optimization](https://github.com/ggml-org/llama.cpp/pull/28999) / [stale-closed issue #25082: HIP graph-cache memory](https://github.com/ggml-org/llama.cpp/issues/25082) | The small forwarding proposal exposes underlying graph optimization in multi-device execution, but has no review or tests. The older parallel-slot memory issue closed through inactivity automation. | Keep the forwarding change watched pending split-backend lifetime/correctness controls. Stale closure is not proof that graph-memory growth was repaired, and neither item establishes a single-APU MTP speedup. |
| [#27788: public multi-sequence speculation API](https://github.com/ggml-org/llama.cpp/pull/27788) / [issue #29002: LFM2 co-batch state corruption](https://github.com/ggml-org/llama.cpp/issues/29002) | The API series rebases to `3e6750b` after bad-merge feedback, but its rationale freezes draft positions while generalizing MTP heads as stateless. The new LFM2 CPU report supplies a small-model harness and a suspected convolution-state mapping mismatch, not an owned fix. | Keep the broad unapproved API out: Qwen MTP attention heads do retain KV/position state. Preserve single-slot operation; the LFM2 report is not proof of the same defect in Qwen4, but reinforces the need for model-specific multi-sequence controls. |
| [Inherited #28989: Nemotron epsilon metadata fallback](https://github.com/ggml-org/llama.cpp/pull/28989) | Allows models that define only `layer_norm_epsilon` to use that value instead of requiring the alternative key. | Inherit the compatibility fix normally; it does not alter Qwen weights or make the separate Nemotron MTP latent projection carry redundant. |
| [Issue #27428: multi-GPU MTP prefill](https://github.com/ggml-org/llama.cpp/issues/27428) / [issue #27964: Qwen4 tensor splitting](https://github.com/ggml-org/llama.cpp/issues/27964) | New dual-GPU discussion claims roughly +57% prompt processing from pinned-buffer/event/pipeline changes, but supplies no owned public patch. A b10991 Qwen4 tensor-split report still aborts, while layer split works. | Keep watched without implementing an algorithm from a comment. The inherited #28965 fixes Gemma4/Qwen3.5 metadata, not Qwen4 tensor-mode support. Neither report establishes a single-Strix gain or permits changing the documented single-device preset. |
| [Unsloth #217: GLM5-Next composition pin](https://github.com/unslothai/llama.cpp/pull/217) / [#218: Windows ARM CUDA bundle](https://github.com/unslothai/llama.cpp/pull/218) / [MTP load report #11143](https://github.com/unslothai/unsloth/issues/11143) | #217 selects the already discussed indexer-softmax reshape; #218 adds a different platform's packaging. The new mixed-release MTP report identifies a flat NextN HC norm incompatible with the reshaped target helper. | Do not import the aggregate or unrelated platform CI. This package already reshapes that NextN norm and now rebases its standalone head onto upstream fused HC operations; the report does not require new model weights. |
| [#28943: skip fully masked HIP FA tiles](https://github.com/ggml-org/llama.cpp/pull/28943) | Author gfx1100 tests report about +35% prompt processing; independent gfx1201 tests report +8–19% with occupied unified-cache slots. | Promising, but JohannesGaessler objects to the inner-loop overhead and requests separate mask-to-KV analysis. No gfx1151 result or approval. Multi-slot benchmark gains do not justify relaxing the documented single-slot MTP policy. |
| [#28972: grow the scheduler hash set](https://github.com/ggml-org/llama.cpp/pull/28972) | Attempts to replace capacity assertions during larger speculative graphs by reallocating hash/backend arrays. | Do not carry the current `b384f9d`: replacement arrays are not initialized, and node/leaf/previous-backend arrays plus the context buffer retain their old capacities. A reset scheduler can skip the missing initialization. No completed end-to-end reproduction or review; this is not a complete repair for #28872's capacity concern. |
| [#28973: model/LoRA file-descriptor loading](https://github.com/ggml-org/llama.cpp/pull/28973) | An Android-oriented public API loads from a caller-supplied descriptor rather than a pathname. Maintainers now explicitly oppose the descriptor-based public API expansion. | Keep out. This is not SSD-PLE row streaming: it excludes mmap, direct I/O and split files, with outstanding descriptor/arithmetic review concerns. The separate merged #28993 FILE-based work does not approve this rejected API design. |
| [#28957: wide no-CUB bitonic argsort](https://github.com/ggml-org/llama.cpp/pull/28957) / [#28982: cooperative softmax registers](https://github.com/ggml-org/llama.cpp/pull/28982) | The former targets wide rows on HIP/MUSA without CUB, with a Radeon 780M report; the latter claims NVIDIA softmax gains. | The tested nightly already uses hipCUB for wide rows, so #28957 does not supply a missing QSA operation. Keep both out: no formal approval, and #28982's submitted `473c7c2` contains a duplicate declaration, undeclared `inv_sum` and unmatched `else`; the baseline passes a host-HIP syntax check while this submitted head fails with five compiler errors. Posted benchmark numbers do not validate this source. |
| [#28938: router-only authentication](https://github.com/ggml-org/llama.cpp/pull/28938) / [issue #28820](https://github.com/ggml-org/llama.cpp/issues/28820) | ServeurpersoCom approved the one-line removal of child `--api-key-file`, with a matrix demonstrating repaired key-source and internal stream calls. | Do not silently change this package's local-access boundary: the same matrix explicitly changes unauthenticated direct-child access from 401 to 200, and environment-supplied key files remain inconsistent. This is a reviewed design tradeoff, not lack of review or malware. Preserve child authentication and document the remaining stream-management limitation. |
| [#28962: SVG animation/use allowlist](https://github.com/ggml-org/llama.cpp/pull/28962) | Enables `<animate>`, `<set>`, `<use>` and additional animation attributes in generated SVG previews/downloads. | Keep the unreviewed sanitizer-policy expansion out pending browser/security tests. Shadow DOM scopes styling; it is not a security sandbox. The two-line submitted diff has no regression tests, and removing script tags alone does not validate every animated/link mutation. No exploit in this package is claimed. |
| [Issue #27388: cancellation-related server wedge](https://github.com/ggml-org/llama.cpp/issues/27388) | A new CPU/aarch64 b10991 report reproduces stalled generation after disconnected MTP clients even with `--parallel 1`: `/health` stays healthy, `/slots` hangs and SIGTERM times out. A plain-decoding control survives twelve cases. | No owned fix or current gfx1151 reproduction. Single-slot operation reduces other risks but does not prove cancellation safety; use bounded request timeouts and, for unattended service, a bounded `/slots` liveness check with supervised restart. Do not treat `/health` alone as a generation-progress guarantee. |
| [#28977: download the projector with the CLI](https://github.com/ggml-org/llama.cpp/pull/28977) / [issue #28950](https://github.com/ggml-org/llama.cpp/issues/28950) | Corrects `llama download` argument handling and adds two model-resolution tests. | Small useful compatibility candidate, but no human approval yet. The README's explicit `hf download ... --include mmproj-F16.gguf` already avoids this path; no change to the required visual projector or recommended model bytes. |
| [Issue #28969: terminal escapes in GGUF inspection](https://github.com/ggml-org/llama.cpp/issues/28969) / [#28880: Python nesting limit](https://github.com/ggml-org/llama.cpp/pull/28880) | Python `gguf-dump` prints metadata keys and tensor names without escaping control bytes; supported terminals can interpret forged links, colors or clipboard operations. JSON output escapes those bytes. | Track an owned fix at the separate `python-gguf` provider. This binary package does not install that reader/dumper, and no reviewed repair is available here. Prefer JSON/escaped inspection of unfamiliar model files; do not emit a hostile-file demonstration directly to a terminal. |
| [#25961: soft reasoning budgets](https://github.com/ggml-org/llama.cpp/pull/25961) / [#26524: bounded sampler history](https://github.com/ggml-org/llama.cpp/pull/26524) | A new independent CUDA evaluation of the older soft-budget branch reports missed hard cutoffs and ignored per-request limits. Sampler-window changes separately remain under design discussion. | Keep current budget/sampler semantics. Lower median reasoning length does not compensate for runaway tail cases, and neither proposal is equivalent to the inherited narrow #28869 template-separator correction. |
| [Unsloth #216: repair a DiffusionGemma composition pin](https://github.com/unslothai/llama.cpp/pull/216) | Updates one nightly merge pin, while explicitly reporting remaining GLM5-Next conflicts and incompatible HC norm shapes between #137 and #144. | Not an inference improvement or an update to this package's weights. Keep the isolated MTP rebase with upstream reshape/fusion support; do not import a broad nightly aggregate or auto-resolve tensor-shape disagreements. |
| [#28949: omit Qwen3.5 embedding LM head](https://github.com/ggml-org/llama.cpp/pull/28949) / [inherited #28965: fused-QKV tensor splitting](https://github.com/ggml-org/llama.cpp/pull/28965) | The embedding-only proposal remains unreviewed. The fused-QKV split-state/granularity repair merged as `fb27a52` after four-P100 testing. | Inherit #28965 normally; keep the separate embedding optimization watched. Neither changes the single-APU Flash-Next/MTP recommendation, and multi-device split evidence is not a local throughput result. |
| [#26617: telescoping recurrent rollback](https://github.com/ggml-org/llama.cpp/pull/26617) / [#28937: CPU F32×BF16 matmul](https://github.com/ggml-org/llama.cpp/pull/28937) / [#28966: quantizer buffer refactor](https://github.com/ggml-org/llama.cpp/pull/28966) | A new Strix user's interest does not wire the older standalone rollback engine into inference. The BF16 proposal fills a CPU reference gap for depthwise convolution; the quantizer proposal revises converter allocation/registration. | Keep watched pending integration and review. None supplies a required Qwen4-Exp sidecar operation, a direct SSD reader, or a measured current package benefit. Author fixes and automated reviews are not whole-series human approval. |
| [Inherited #26308: strided row reductions](https://github.com/ggml-org/llama.cpp/pull/26308) / [inherited #28971: benchmark version](https://github.com/ggml-org/llama.cpp/pull/28971) | Shared CUDA/HIP F32 `SUM_ROWS`/`MEAN` now handles higher-dimensional strides while keeping the contiguous fast path; `llama-bench --version` exposes build identity. | Inherit both normally. HIP compilation and CPU checks do not prove strided GPU numerical correctness; the new version flag improves reproducible benchmark records, not inference speed. |
| [Inherited #28549: separate output/no-output graph arenas](https://github.com/ggml-org/llama.cpp/pull/28549) | The approved series merged as `2f3fd02` after generalizing graph selection by output requirements, rather than only an MTP-specific token/embedding predicate. | Remove the duplicate old carry and use the merged arena implementation. Continue checking fresh-sequence/reset, mixed input and reuse lifetimes; upstream inheritance is not a local gfx1151 speed measurement. |
| [#27921: OpenAI-style video inputs](https://github.com/ggml-org/llama.cpp/pull/27921) / [#28472: clean-spaces vocabulary API](https://github.com/ggml-org/llama.cpp/pull/28472) | Video URI compatibility now has independent RTX PRO 6000/Gemma testing through LiteLLM. The small vocabulary getter retains CISC's earlier approval and a renewed request for the second API review. | Useful compatibility work, not a new HIP MTP optimization. The video patch remains unapproved and the getter awaits API review; keep explicit supported request formats rather than adding unrelated API/input changes. |
| [Issue #27035: built-in GPT-OSS filename case](https://github.com/ggml-org/llama.cpp/issues/27035) / [closed #28928: Web UI distribution](https://github.com/ggml-org/llama.cpp/issues/28928) | The GPT-OSS-20B convenience flag still requests a missing lowercase filename in a current-build report. The Web UI request closed because upstream already supports downloaded bundles. | Use explicit verified model paths for the filename issue; no owned repair was identified. This package deliberately builds its local UI assets, so do not replace that reproducible source path with an unrelated latest-bundle fallback. Neither changes the documented Qwen weights. |
| [Inherited #28896: Qwen HC/PLE norm-scale fusion](https://github.com/ggml-org/llama.cpp/pull/28896) / [fork reference #40](https://github.com/routhjim/llama.cpp-lab/pull/40) | b10975 loads grouped norm weights with reshape permission so existing RMS/multiply fusion sees adjacent nodes. Upstream reports about 3% faster prompt processing; the fork separately implements the same PLE idea at graph time. | Preserve the reviewed upstream graph/loader change in the MTP rebase, including compatible NextN HC norm shape and conditional mixed-F16 handling. Do not stack the overlapping fork patch. This is PLE arithmetic/dispatch improvement, not a new SSD reader or a locally measured Strix gain. |
| [Inherited #28901: fused Qwen hyper-connection operations](https://github.com/ggml-org/llama.cpp/pull/28901) | Merged as `37b53fd` after pwilkin and ggerganov approval. Independent ROCm/Vulkan testing reports prompt processing 334.85→360.32 t/s and generation 20.96→22.11 t/s, with long-context results neutral and a mixed-image check passing; the author's DGX Spark figures remain separate. | Inherit the reviewed CPU/shared CUDA-HIP operations, retaining mixed-F16 and standalone-head compatibility in the local MTP rebase. These are reported hardware results, not measurements on this package. Re-run numerical, dtype and graph-reuse controls; do not require re-downloading compatible flat GGUF norm weights. |
| [Inherited #28935: RDNA3.5 MoE tile heuristic](https://github.com/ggml-org/llama.cpp/pull/28935) / [closed #28924](https://github.com/ggml-org/llama.cpp/pull/28924) / [closed #28925: Q4_K constants](https://github.com/ggml-org/llama.cpp/pull/28925) | Merged as `fccf716` after JohannesGaessler and IMbackK approval and the requested twenty-quantization Granite3.0 sweep. IQ4_XS prompt gains range from about +5.8% to +38.7% at microbatches 32–512; very small batches are roughly neutral and some other quantizations regress. | Inherit the one-line gfx1151 eligibility change, without duplicating #28195's existing constants. The broader evidence now clears upstream review, but is not a Flash-Next/MTP benchmark or a promise that every workload improves. |
| [Carried #28910: automatic M-RoPE position bounds](https://github.com/ggml-org/llama.cpp/pull/28910) / [remaining API issue #28902](https://github.com/ggml-org/llama.cpp/issues/28902) / [new reproduction #28963](https://github.com/ggml-org/llama.cpp/issues/28963) | The carried fix allocates all four planes for internally generated embedding positions. New Linux CPU evidence confirms the distinct caller-provided N-versus-4N position-buffer overread can alter outputs; properly allocated four-plane controls are deterministic. | Retain the narrow independently sanitizer-tested fix, without claiming the caller API is repaired. Normal mtmd already supplies full position arrays. Raw API users must respect the M-RoPE layout; metadata products, hostile inputs and full-model GPU visual correctness remain separate limits. |
| [#28927: skip causal-toggle re-reservation](https://github.com/ggml-org/llama.cpp/pull/28927) | One-line scheduler change reports a 262K-context Gemma CUDA video request falling from 18.2 to 3.3 seconds. New automated discussion acknowledges Qwen's causal-dependent bias shape and argues ordinary graph allocation can recover the changed shape. | Watch with #28751: this response is not a measured Qwen/HIP correctness or allocation-lifetime control, nor proof the proposal is unsafe. No human approval or Qwen M-RoPE, CPU/non-offloaded-projector validation is posted; do not treat it as an interchangeable already-tested smaller fix. |
| [Issue #28933: Flash-Next host-memory growth](https://github.com/ggml-org/llama.cpp/issues/28933) | After 48 hours the reporter further retracts build-specific growth/swap attribution: all three older servers accumulate memory, while two original incidents involved corrupted weights or co-tenant overcommit. A roughly 19 GiB versus 2 GiB load-time baseline difference remains reported without a clean A/B. | Do not label this a confirmed new engine leak or PLE regression. File-backed versus anonymous accounting, workload isolation and the aggregate's larger baseline remain open; neither rollback nor experimental direct PLE is an established repair. |
| [#28916: threaded RPC clients](https://github.com/ggml-org/llama.cpp/pull/28916) / [issue #28908: accept starvation](https://github.com/ggml-org/llama.cpp/issues/28908) | One detached thread per connection prevents accept starvation in a two-client greeting test. A new reviewer asks for a thread pool instead of unbounded detached clients. | Keep out: shared backend execution/ownership, synchronization and bounded lifetime/resources remain unresolved. A successful handshake test does not establish safe concurrent inference or authenticated RPC. |
| [#28915: public metrics endpoint](https://github.com/ggml-org/llama.cpp/pull/28915) | Removes `/metrics` from API-key authentication to simplify monitoring. | Do not carry an unreviewed authorization-policy relaxation. Configure monitoring credentials instead; a scrape convenience is not a security fix or inference optimization. |
| [#28926: UTF-8 stream/SSE rewrite](https://github.com/ggml-org/llama.cpp/pull/28926) | Attempts to join subprocess byte chunks, change resumable-buffer eviction and catch serialization failures. | Reject the current draft: an exact-helper six-case probe confirms two incomplete UTF-8 prefixes are emitted, oversized discarded appends do not advance the logical dropped-byte offset, and new INFO logs expose full tool arguments/results. These are an isolated helper regression and source-level findings, not demonstrated exploits in this package; require a narrow corrected successor and boundary/offset/confidentiality tests. |
| [Closed #28914: trailing-think tool-call recovery](https://github.com/ggml-org/llama.cpp/pull/28914) | Retries a completed tool-call parse after removing a dangling `<think>` suffix. The author withdrew it and deleted the branch pending real Qwen3.8 ROCm streaming, multi-turn and pressure validation. | Respect the withdrawal; parser-unit success alone does not establish correct tool semantics. Keep strict parsing and watch for a validated owned replacement. |
| [Closed #28903: GGUF index sidecar](https://github.com/ggml-org/llama.cpp/pull/28903) / [closed #28905: allocator rewrite](https://github.com/ggml-org/llama.cpp/pull/28905) | Maintainers reject hundreds of metadata-cache/parser lines for a small parse-time saving, and the large allocator/ABI aggregate in favor of a much smaller logical-to-physical-buffer change. | Retain these as historical decisions and follow narrower successors. Do not add another model-adjacent cache parser or a thousands-of-lines allocator rewrite merely because they promise speed or have automated reviews. |
| [Closed #28889: smaller argsort scratch chunks](https://github.com/ggml-org/llama.cpp/pull/28889) | The proposed 64-to-16 MiB input chunks reduce reported V100 transient scratch from roughly 300–450 MiB to about 100 MiB. Despite the CUDA title, it also affects this package's HIP argsort fallback. | No human approval or matching gfx1151 performance/correctness comparison; closed unmerged. Watch an owned successor rather than changing current hipCUB dispatch based on another GPU's memory profile. |
| [Closed #28884: unconstrained-schema strings](https://github.com/ggml-org/llama.cpp/pull/28884) | Tries to repair inconsistent string inference in older specialized parsers. Aldehir closed it, directing those parsers to the newer typed-schema conventions already used by Qwen3-Coder. | Do not change generic schema inference in conflict with that design direction. This is distinct from the carried numeric-bound guards and does not establish complete hostile-schema safety. |
| [Inherited #28934: graph specialization ordering](https://github.com/ggml-org/llama.cpp/pull/28934) / [#28890: HunyuanOCR DFlash](https://github.com/ggml-org/llama.cpp/pull/28890) | The narrow C++ template-definition-order correction has been inherited since b10992. The separate OCR proposal reports Metal draft speed at a prefill cost. | No duplicate compatibility carry or measured C++17 HIP speedup. Continue watching unreviewed model-specific DFlash work without treating its gains as generic Qwen MTP gains. |
| [#26631: skip negative expert IDs](https://github.com/ggml-org/llama.cpp/pull/26631) / [#28907: large-head CDNA FA](https://github.com/ggml-org/llama.cpp/pull/28907) / [#28536: FA swizzle refactor](https://github.com/ggml-org/llama.cpp/pull/28536) | #26631's approval covers Vulkan only; CUDA review flags a token-count launch limit. New #28536 discussion attributes the D=512 regression to lost vectorization while the mask layout is still being revised. | Require corrected shared-kernel bounds and settled backend review. Disabling mask loads for diagnosis is not a usable inference fix. CDNA large-head and NVIDIA swizzle work supplies neither a gfx1151 D=256 corruption workaround nor measured Strix gains. |
| [LLMKube #1832: Strix Halo Flash-Next lab](https://github.com/defilantech/LLMKube/pull/1832) | Published Vulkan UD-Q3_K_XL plus #28243 testing reports about 1.3× MTP decode across three pairs and a one-hour, 167-request soak without errors or GTT growth. | Useful independently reported Strix validation methodology, not this HIP/IQ4_XS/standalone-head package's benchmark. Its shared-head loader/runtime requirements differ; do not replace weights, backend or sidecar based solely on this lab. |
| [Issue #28932: soft reasoning-budget wind-down](https://github.com/ggml-org/llama.cpp/issues/28932) | A V100/Spark proposal biases end tokens near the limit and suppresses EOS briefly after reasoning, with a few single-run comparisons. | No reviewed implementation or Qwen quality controls. It changes sampling and hard-budget semantics; keep explicit current budget behavior and distinguish this from #28869's narrow template-separator correction. |
| [#28696: DeepSeek V4.1 conversion](https://github.com/ggml-org/llama.cpp/pull/28696) / [#28845: ELMOD pre-tokenizer](https://github.com/ggml-org/llama.cpp/pull/28845) / [#28864: UGM byte fallback](https://github.com/ggml-org/llama.cpp/pull/28864) | After restoring the trained regex, ELMOD's author now proposes reusing the existing UGM normalizer with conversion-injected `PRECOMPILED_CHARSMAP`; CISC asks that any external dependency remain optional. Numeric added-token partitioning remains unresolved. | No settled implementation/review or new Qwen4-Exp dependency. Preserve model-trained tokenization; a normalizer-sharing proposal is not yet a BPE correctness repair, and the separate UGM fallback does not change Qwen tokenization. |
| [#28156: XingChen4 model/MTP support](https://github.com/ggml-org/llama.cpp/pull/28156) / [inherited #27625: HRM text model](https://github.com/ggml-org/llama.cpp/pull/27625) | HRM's final implementation merged as `7d6f5d0`, retaining causal-only attention and multi-device replication. XingChen4 remains unreviewed; its author now notes a model-name change. | Inherit HRM support without claiming full prefix-LM fidelity: the documented quality and replication limitations remain. Keep the broader XingChen4 addition out; its MTP feature is not necessary for the existing Flash-Next sidecar. |
| [#27851: tiled CPU quantized matmul](https://github.com/ggml-org/llama.cpp/pull/27851) / [#28861: private batch-one expert scratch](https://github.com/ggml-org/llama.cpp/pull/28861) | Tiled kernels report large Zen 5 VNNI prefill gains; the smaller expert path reduces a dual-Xeon synthetic decode from roughly 158 to 118 ms by avoiding shared-buffer contention. These concern CPU matmul/expert offload, not PLE row reads. | Keep watched. #27851's September 9 approval explicitly covers only `ggml-cpu.c`, not its tiled kernels, and substantial interleave/AVX changes followed; small MoE shapes still need careful fallback/performance controls. #28861 has no human review and reports no gain for normal repack/small-Qwen runs. Neither has an isolated package-profile Strix comparison. |
| [Inherited #28882: CPU PCH/cache-line consistency](https://github.com/ggml-org/llama.cpp/pull/28882) / [issue #28858: CPU heap corruption](https://github.com/ggml-org/llama.cpp/issues/28858) | The maintainer's cache-line fix merged and b10975 inherits it. [#28892](https://github.com/ggml-org/llama.cpp/pull/28892) additionally removes the remaining upstream PCH setup rather than retaining it for other targets. | Retire the duplicate CPU patch. C allocation and C++ worker offsets still use one deterministic constant, including 64 bytes on x86. This is memory-layout consistency, not a promised HIP throughput gain; the package follows upstream's removal of PCH. |
| [Local hardening for #27166: MiniCPM-V position buckets](https://github.com/ggml-org/llama.cpp/issues/27166) | A new ordinary 15,000×1 image reproduction with an unmodified public MiniCPM-V projector exceeds the fixed 1024-entry position buffers. This is not limited to hostile projector metadata. | Replace four fixed arrays with vectors sized to their existing loop bounds. Exact-source-loop sanitizer checks cover both projector paths, preserving supported positions and eliminating the reproduced stack overflow. No Qwen graph or position formula changes; this does not establish full-model visual correctness or general hostile-image safety. |
| [#24888: tokenizer metadata bounds](https://github.com/ggml-org/llama.cpp/issues/24888) / [#26366: zero-dimensional GGUF](https://github.com/ggml-org/llama.cpp/issues/26366) / [#26384: RPC worker failure](https://github.com/ggml-org/llama.cpp/issues/26384) / [#27053: transposed quantized CPU copy](https://github.com/ggml-org/llama.cpp/issues/27053) | The first three closed automatically as stale on September 14, not through newly merged fixes. Some tokenizer/zero-size guards already exist; unsupported transposed block-quantized CPU copying remains a separate open report. | Do not equate closure with complete hostile-input safety. No newly owned repair is available for the remaining CPU-copy/RPC failure paths. Keep models, direct backend callers and RPC peers trusted; this is a residual API/input-validation boundary, not evidence of malware in the package patches. |
| [#28871: deterministic radix `TOP_K`](https://github.com/ggml-org/llama.cpp/pull/28871) | Adds QSA-sized/tied-score coverage through `k=2051`, but changing the `!CUB_TOP_K_AVAILABLE` fallback also changes this package's HIP/hipCUB path. All posted correctness and throughput results are from NVIDIA CMP 170HX. | Keep this unreviewed draft out: fixed 32-lane assumptions, selection/gather/sort changes and absent HIP graph tests need review. Its own single-row long-context result regresses from 0.105 to 0.156 ms. It is not CUDA-only; retain the existing hipCUB/native HIP split. |
| [#28874: scheduler user-input copy order](https://github.com/ggml-org/llama.cpp/pull/28874) / [#28875: tiny-N MMVF dispatch](https://github.com/ggml-org/llama.cpp/pull/28875) / [#28851: strided `SUM`](https://github.com/ggml-org/llama.cpp/pull/28851) | New proposals reduce a multi-NVIDIA host stall, route small F32/F16 matrices through MMVF and extend noncontiguous reductions. Their shared source can affect HIP. | No human approval or isolated gfx1151 result. Validate input/graph lifetime and numerical dispatch; #28851 overlaps the hipCUB reduction route. The copy-order patch is not an established repair for the older direct-host-compute race. |
| [#28880: Python GGUF nesting limit](https://github.com/ggml-org/llama.cpp/pull/28880) | The small draft bounds nested arrays in Python's GGUF reader. CISC approved on September 14, while noting that the native reader rejects nesting entirely and the chosen Python limit of 16 is debatable. | Track at the Python provider: this package does not install `gguf-py`, and `python-gguf` is a separate optional dependency. Backporting its reader here would not protect that installed package. The approval is new, but does not justify an ineffective inference-package carry or automatic dependency change. |
| [Issue #28867: gfx1201 D=256 WMMA threshold](https://github.com/ggml-org/llama.cpp/issues/28867) / [#28877: NVIDIA unary misalignment](https://github.com/ggml-org/llama.cpp/issues/28877) | New private tuned-WMMA gfx1201 controls contradict the earlier threshold claim: raising it to 64 slows concurrent decode by 3.8–5.3%, while single-stream n-max=3 already selects TILE. The NVIDIA reporter's private PDL-off workaround remains separate. | Conflicting stock/tuned controls are not a reviewed gfx1151 fix. Keep upstream thresholds; do not transfer another GPU's tuning or CUDA PDL flags into this HIP build. The withdrawn corruption attribution does not justify restoring the former D=256 bypass. |
| [Closed research #28863: dual-gfx1100 scaling](https://github.com/ggml-org/llama.cpp/issues/28863) / [#20831: MMVQ warp tuning](https://github.com/ggml-org/llama.cpp/pull/20831) / [#28494: iWARP transport](https://github.com/ggml-org/llama.cpp/pull/28494) | New dual-gfx1100 dense-Qwen measurements find #20831 changes within noise; maintainer Strix-cluster HIP/Vulkan comparisons likewise find no significant #28494 speedup over master. | Keep the unrelated or unreviewed transport/dispatch changes out. A scaling gap is not an implementation fix, and pipeline scaling observed on master cannot be attributed to the proposed iWARP patch. |
| [#28866: query-only URL parsing](https://github.com/ggml-org/llama.cpp/pull/28866) | Stops the hostname at `?`, but leaves the request target as `?download=1` instead of `/?download=1`. The candidate's unit test expects that incomplete target. | Do not carry yet. A bounded actual cpp-httplib 0.56.0 loopback check returns 404 for the candidate's query-only URL and 200 for the explicit-slash control. Use `https://host/?query` meanwhile; hostname parsing alone is not end-to-end HTTP validation. |
| [#28872: preserve scheduler on re-reserve](https://github.com/ggml-org/llama.cpp/pull/28872) / [#28873: partial MTP KV checkpoints](https://github.com/ggml-org/llama.cpp/pull/28873) | CUDA reports target continuation/new-turn latency, not SSD-PLE reads. A new #28873 comment additionally reports full-state/SWA prefix restoration dropping needed cells and drifting Gemma logits by up to about 8 nats; this is distinct from the partial-only optimization. | Keep the unreviewed drafts out. #28872's fixed scheduler capacity versus growing sampler/LoRA graph requirements still needs a fallback. #28873 now particularly needs full/partial/SWA prefix-restore regressions; the comment's suggested filter change has no owned public patch/reproduction yet and is not a demonstrated Qwen/HIP fix. |
| [Inherited #28865: MiMo SWA array loader](https://github.com/ggml-org/llama.cpp/pull/28865) / [inherited #28868: Gemma/Step SWA arrays](https://github.com/ggml-org/llama.cpp/pull/28868) | CISC's narrow `get_arr` corrections merged, fixing MiMo's #28831 and related Gemma/Step array loading. | Inherited in b10975 with no duplicate patch. These model-specific loader fixes do not revert generic NextN safeguards or change the Qwen4-Exp target/sidecar recommendation. |
| [Inherited #28849: unified-KV auto-fit limit](https://github.com/ggml-org/llama.cpp/pull/28849) / [#26575: DFlash/DSpark draft caps](https://github.com/ggml-org/llama.cpp/pull/26575) | The larger unified-cache auto-fit limit merged as `b04d4e5`. The separate startup draft-cap proposal affects block drafters while per-request overrides remain disabled. | Inherit auto-fit behavior but retain explicit context and single-slot `draft-mtp` presets; this does not make concurrent MTP safe. Keep the unreviewed block-drafter control watched separately. |
| [#25294: SSD expert streaming](https://github.com/ggml-org/llama.cpp/pull/25294) / [request #27562](https://github.com/ggml-org/llama.cpp/issues/27562) / [#28879: hybrid perplexity report](https://github.com/ggml-org/llama.cpp/issues/28879) | New eviction-policy discussion and an explicitly experimental M1 Ultra/DeepSeek branch claim 6–7 t/s for roughly 500 GB weights on 128 GB RAM, or 12–13 t/s with Q2 experts. The separate SYCL report still raises recurrent evaluation-window continuity as a hypothesis. | No reviewed SSD-expert implementation or HIP control follows. Expert streaming is distinct from PLE; do not generalize another model/backend's figures to Flash-Next or mistake evaluation-window sensitivity for a confirmed repair. |
| [Inherited #28869: Qwen reasoning-budget newline](https://github.com/ggml-org/llama.cpp/pull/28869) / [#28847: image-bearing Responses tool output](https://github.com/ggml-org/llama.cpp/pull/28847) | #28869 merged as `0bec16e`; it makes the forced reasoning end match the newline emitted when Qwen3-Coder-style templates render the same assistant history. #28847 separately converts image tool results and checks field types. | Remove the duplicate local snapshot and retain focused template/request-schema/sampler regressions; old natural end markers remain accepted. Keep the unreviewed Responses implementation out: it does not fix internal MCP's non-text conversion problem, and overlapping Responses designs still need review. |
| [#26130: per-device memory metrics](https://github.com/ggml-org/llama.cpp/pull/26130) / [#28876: causal reranker batch splitting](https://github.com/ggml-org/llama.cpp/pull/28876) | Metrics expose weights/context/projector memory. The reranker proposal is now `da3ad31` after CISC requested generic runtime attention checks and removal of redundant BERT metadata changes; it no longer relies only on static architecture predicates. | Both remain without final approval. Follow the narrowed reranker design, but require runtime override and embedding/rerank coverage before changing public APIs and batching. Neither is a measured Flash-Next MTP improvement. |
| [Issue #28848: oversized replayed history](https://github.com/ggml-org/llama.cpp/issues/28848) / [#28827: Gemma tool-loop degeneration](https://github.com/ggml-org/llama.cpp/issues/28827) / [#26381: PEG-format failure after bad generation](https://github.com/ggml-org/llama.cpp/issues/26381) | #28827 now reports improvement after a maintainer-suggested Gemma template change removes an injected newline before the closing thought marker. In-context learning of mismatched history is the maintainer's hypothesis, not a proved backend diagnosis. The other reports concern explicit context rejection or already-invalid generated output. | Keep these model/template symptoms distinct. Do not apply Gemma's template edit to Qwen or treat a parser error as evidence of a GPU fault. No reviewed package-wide repair follows from these reports; retain faithful client histories and hardware-matched controls. |
| [#28820: router key-source mismatch](https://github.com/ggml-org/llama.cpp/issues/28820) / [#28837: child API-key forwarding](https://github.com/ggml-org/llama.cpp/pull/28837) | The unchanged `2de4d0f` forwards inline keys into visible child arguments. Our keyed loopback diagnostic confirms internal stream lookup misses an existing child session and routed deletion reports 204 without removing it, because child calls omit authentication. | Reject the leaking proposal. Continue using one `--api-key-file` for ordinary requests; the approved router-only successor #28938 is now documented above with its explicit local-access tradeoff. Its tests are not missing, but they do not preserve this package's existing child authentication boundary. |
| [#28803: concurrent shared-cache downloads](https://github.com/ggml-org/llama.cpp/pull/28803) | An independent test finds two servers downloading one model can create a blob twice the expected size; the proposed lock restores its hash and has one human approval. | Latest review still loses two of six servers on the shared `refs/main.tmp` path and identifies Windows rename gaps. The lock/progress design is being simplified. Keep out; serialize downloads sharing a cache, or pre-download models before starting servers. |
| [#28806: reject invalid named tool choices](https://github.com/ggml-org/llama.cpp/pull/28806) / [#28809: model-directory GGUF selection](https://github.com/ggml-org/llama.cpp/pull/28809) / [#27985: desktop reasoning menu](https://github.com/ggml-org/llama.cpp/pull/27985) | The first two remain unapproved. The desktop menu fix now has allozaur's approval as a temporary repair before #28419, but the reviewer explicitly asks for failing end-to-end tests to be updated. | Keep watched pending completed UI validation and final review. Keep explicit model paths and validate tool choices in the client. Automated approval recommendations on model discovery are not human approval. |
| [#28821: contiguous-row unary kernels](https://github.com/ggml-org/llama.cpp/pull/28821) / [closed #28819](https://github.com/ggml-org/llama.cpp/pull/28819) / [#28823: Blackwell IQ fallback](https://github.com/ggml-org/llama.cpp/pull/28823) | #28821 widens shared CUDA/HIP stride support without posted HIP measurements. #28823 selects a NVIDIA-only fallback; neither has human approval. | Keep unreviewed shared kernels out; the Blackwell fallback adds no HIP benefit. A CUDA title alone is insufficient to classify shared source as irrelevant or safe for Strix. |
| [Issue #28828: IQ4_XS prefill cliff](https://github.com/ggml-org/llama.cpp/issues/28828) / [#27796: quantized-KV slowdown](https://github.com/ggml-org/llama.cpp/issues/27796) / [#28814: LLVM23 HIP RPC link failure](https://github.com/ggml-org/llama.cpp/issues/28814) | Reports concern Windows gfx1101 prefill near 32K, gfx1201 quantized-KV speed at depth, and a Gentoo OpenMP link failure. A newer gfx1201 control instead places Q8_0 within roughly 2–3% of F16 at 32K; forcing quantized vector FA through the tile route did not improve it. | Keep the target and KV defaults while measuring the actual package. These differing downstream/compiler controls do not prove every quantized KV mode is slow on Strix. Package link/install verification addresses its own stack; do not apply an unisolated kernel or linker workaround. |
| [#28824: zero-KV variable-GQA checks](https://github.com/ggml-org/llama.cpp/pull/28824) / [#28832: Mamba contiguity](https://github.com/ggml-org/llama.cpp/pull/28832) / [#27943: byte-oriented state API](https://github.com/ggml-org/llama.cpp/pull/27943) | #28832 now has CISC's approval together with a request to move the extra `cont` into only the non-normalized branch; its unchanged head still contains redundant work. The other proposals retain their allocation/state-format review concerns. | Await that cleanup and normal upstream review. The reported Mamba failure is Intel AMX-specific, not a Strix/Qwen requirement; no additional generic allocation or state-format carry is justified. |
| [Issue #28841: redundant recurrent gather](https://github.com/ggml-org/llama.cpp/issues/28841) / [#28831: MiMo NextN arrays](https://github.com/ggml-org/llama.cpp/issues/28831) / [#28805: long-context early EOS](https://github.com/ggml-org/llama.cpp/issues/28805) | A gfx1151 Vulkan trace attributes roughly 2.2% gross decode time to identity gathers, explicitly excluding rollback/MTP. MiMo now has owned fix #28865, alongside related Gemma/Step cleanup #28868. New Qwen4-Exp thinking-low experiments show budget-exhausting rambling distinct from the earlier one-token EOS failure. | Identity recurrent gather is not PLE lookup; do not claim an MTP gain. The MiMo report does not justify reverting Qwen loader safeguards. Different EOS/reasoning symptoms and cached-prefill timings still do not isolate a HIP cause or justify a quantization change. |
| [#28815: small vision/MTP test fixture](https://github.com/ggml-org/llama.cpp/pull/28815) / [inherited #28835: Nemotron test spelling](https://github.com/ggml-org/llama.cpp/pull/28835) / [inherited #28842: smaller FA test shapes](https://github.com/ggml-org/llama.cpp/pull/28842) | The unreviewed 95M Qwen3.5 fixture covers 19 CPU server cases; the other changes merged and repair metadata-test selection and reduce extreme Vulkan CI shapes. | Useful validation work, not runtime fixes or reasons to replace the current target/sidecar. The merged changes add no package source. |
| [Patt92: HIP graph identities](https://github.com/Patt92/llama.cpp/commit/56484741253405e9cecc011dd2d7a070d7d981dc) / [former custom HC tails](https://github.com/Patt92/llama.cpp/commit/30f8f83fff584b11aff4332cc1158471f94db5cf) / [graph-ring lifetime repair](https://github.com/Patt92/llama.cpp/commit/2fb9295fa1d6d90162ae46a9e5cac53a781aadaa) | The new `0b805fd` head merges upstream through `aa39d7a`, drops its custom Qwen HC operations in favor of inherited #28901, and resets its graph ring before optimization. The broader four-entry ring/RPC graph slots remain, after two earlier retained-input lifetime failures. | Keep the aggregate out: public scheduler/RPC changes and direct HIP host-compute re-enablement still need independent clean-package controls. We already inherit reviewed HC fusion and #28549 arenas without those extra policies. Earlier cluster speedups are not single-Strix A/B results; no new isolated SSD-PLE repair appears. |
| [Inherited #28787: cpp-httplib 0.56.0](https://github.com/ggml-org/llama.cpp/pull/28787) | The approved vendor update merged as `718f7b4` and is inherited in b10938. It separates origin/proxy credentials, rejects ambiguous client response framing and overflowing byte ranges, avoids double compression, and repairs partial WebSocket reads/timeouts. | Remove the duplicate carry; inherited vendor bytes match the previously verified official release. The earlier twelve local HTTP/proxy/SSE/WebSocket checks remain historical evidence. This is specific transport hardening, not a complete server security guarantee. |
| [Inherited #28747: router child-state framing](https://github.com/ggml-org/llama.cpp/pull/28747) | Three human approvals cover the leading newline that prevents colored log escape sequences hiding child state notifications; merged `c069aa7` is now inherited. | Remove its duplicate carry. The parser and IPC destination are unchanged; an extra blank log line is intentional. It does not guarantee concurrent admission or fix every shutdown race. |
| [Carried runtime slice #28782: HIP padding stream](https://github.com/ggml-org/llama.cpp/pull/28782) | Uses the per-thread asynchronous memset plus synchronization when zeroing newly allocated buffer padding. [IMbackK approved the unchanged full head on September 13](https://github.com/ggml-org/llama.cpp/pull/28782#pullrequestreview-5190316093), following author parallel gfx1151 backend tests. | Retain only the two-line runtime commit, excluding its CI follow-up. Same pointer, byte range, value and synchronous-return contract; adjacent callbacks use the same pattern. Human approval strengthens the existing carry, but does not establish local GPU correctness or fix the separate image reports. |
| [Carried #28764: Nemotron MTPv2](https://github.com/ggml-org/llama.cpp/pull/28764) / [inherited #28779: reject zero NextN divisor](https://github.com/ggml-org/llama.cpp/pull/28779) | Adds the trunk's optional latent FFN projections to the MTP layer and turns invalid zero expert metadata into a clean load error. Taronaeo approved #28779's exact cleanup head and CISC merged it as `e49d2c2` on September 13. | Retain #28764; remove the now-duplicate #28779 carry. Neither changes Qwen weights or guarantees validity of every malformed latent-tensor pair; old malformed review-branch GGUFs still need reconversion. |
| [Inherited #28789: RPC weights-only disk cache](https://github.com/ggml-org/llama.cpp/pull/28789) | Merged as `7609846` after rgerganov and ggerganov approvals, including independent confirmation that activations are not cached. Protocol 7 gives each `SET_TENSOR` an explicit cache flag; both sync/async clients restrict hashes to weight buffers. | Inherit the fix and update local RPC wire-format regression fixtures, not the production shape guards. Keep RPC trusted and `-c` off by default: the flag is client-controlled, partial/non-atomic files and old cached data are not repaired. Update all RPC peers together; this is neither authentication nor a single-APU performance claim. |
| [Historical #28091: PCH/unity build](https://github.com/ggml-org/llama.cpp/pull/28091) / [#28763: MSVC correction](https://github.com/ggml-org/llama.cpp/pull/28763) / [inherited #28771: embedding paths](https://github.com/ggml-org/llama.cpp/pull/28771) / [inherited #28795: direct includes](https://github.com/ggml-org/llama.cpp/pull/28795) | b10975 inherits the `PROJECT_SOURCE_DIR` embedding correction and removes the remaining PCH setup via #28892. [#28816](https://github.com/ggml-org/llama.cpp/pull/28816)'s older Clang PCH timestamp workaround is retained here as history; unity builds remain. | No duplicate patch or measured inference gain. The package follows upstream's simpler non-PCH build; the standalone recipe did not depend on the failing embedding case. The unrelated MSVC proposal is not a Linux HIP requirement. |
| [#28784: IQ byte-mask compiler workaround](https://github.com/ggml-org/llama.cpp/pull/28784) / [inherited #28576: CDNA MFMA precision](https://github.com/ggml-org/llama.cpp/pull/28576) / [inherited #28846: BF16 hardware fallback](https://github.com/ggml-org/llama.cpp/pull/28846) / [inherited #27841: GCN MMQ](https://github.com/ggml-org/llama.cpp/pull/27841) | b10975 now inherits FP32 VKQ accumulation on CDNA/MFMA. Its type/configuration changes are gated away from RDNA3.5; the earlier GCN dispatch is likewise separate. #28846 already recognizes RDNA3+ as BF16-capable, so its fallback does not newly route gfx1151 to F32. #28784 remains an NVCC/Blackwell workaround. | No additional gfx1151/IQ4_XS carry. Inherited precision and GCN changes leave Strix's WMMA types and the #28195 constants intact; shared source alone does not make other-architecture tuning a Strix benefit. |
| [Closed #27269: vector quantized KV defaults](https://github.com/ggml-org/llama.cpp/pull/27269) | The author closed it unmerged on September 13 without an explicit technical closure rationale. It only adds a compiled Q8_0/Q4_0 FA pair, not runtime KV defaults; historical throughput claims were removed and reviewer quality objections remain. | This package already builds every supported pair. Keep documented F16/Q8_0 defaults; compare quality, throughput and total memory before choosing smaller KV. One model's 24% cache saving does not establish a universal best setting, and closure is not evidence that a replacement landed. |
| [#27773: GLM5-Next pooled index cache](https://github.com/ggml-org/llama.cpp/pull/27773) / [#28785: CPU no-work scheduling](https://github.com/ggml-org/llama.cpp/pull/28785) / [#28792: batched-bench affinity](https://github.com/ggml-org/llama.cpp/pull/28792) | GLM review still questions whole-pool repacking and save/load coverage. New #28785 discussion confirms caller affinity side effects, favors save/restore, and requests an OpenMP-disabled control; the author reports OpenMP already disabled. | Keep watched without claiming an established Strix scheduling gain. CPU threadpool policy and affinity are shared lifecycle behavior, not a harmless GPU-only optimization; #28792 also remains unreviewed. |
| [Issue #28783: non-text internal MCP results](https://github.com/ggml-org/llama.cpp/issues/28783) / [#28786: numeric Jinja attributes](https://github.com/ggml-org/llama.cpp/issues/28786) / [closed #28794: Web UI MCP menu](https://github.com/ggml-org/llama.cpp/issues/28794) | Numeric dotted array/object access is fixed by inherited [#28817](https://github.com/ggml-org/llama.cpp/pull/28817). Missing MCP image/audio conversion and the menu complaint remain separate reports. | No additional Jinja patch is needed. The template fix does not repair MCP content conversion or broaden tool permissions; a closed menu report alone is not evidence of an implementation fix. |
| [#27530: failed state-restore cleanup](https://github.com/ggml-org/llama.cpp/pull/27530) | Unchanged `1348cb0` now has author 64-case CPU evidence, but integration also exposed unchecked corrupted `cell_count` allocation and inconsistent hybrid cleanup. Ggerganov requests integration into `test-save-load-state` and resolution of those findings. | No approval or current gfx1151 failure-path validation. Keep watched alongside checkpoint persistence; successful restore tests do not prove all failure paths are safe, and the maintainer's broader test request remains open. |
| [#28613: gfx1151 MMVQ thresholds](https://github.com/ggml-org/llama.cpp/pull/28613) | A small RDNA3.5 dispatch change reports Qwen3.8-27B IQ4_XS batched-decode gains of about 6%, 10%, and 20% at parallelism 4, 6, and 8, with 1,288 backend cases passing. | No human review or Flash-Next single-slot MTP A/B. Batch-width gains might help verification, but that is an inference, not a measured result; they do not justify enabling concurrent MTP. High-priority hardware test candidate. |
| [Draft #28616: HIP SWAR byte intrinsics](https://github.com/ggml-org/llama.cpp/pull/28616) | Replaces scalar byte-lane intrinsics with packed-integer operations. The author reports gfx1151 IQ4_XS gains of roughly 2–5% and larger IQ2_S gains on batched Qwen3.8-27B workloads, with 1,288 backend cases passing. | Unreviewed hot quantized arithmetic; subtraction changes from saturating to wrapping semantics. Require lane-boundary/type coverage and an isolated gfx1151 model comparison before importing. |
| [#27311: scheduler UMA ring buffer](https://github.com/ggml-org/llama.cpp/pull/27311) / [#26167: scheduler sanitizer](https://github.com/ggml-org/llama.cpp/pull/26167) | The ring-buffer author now parks the draft after ggerganov says the design is not ready and asks for smaller demonstrated low-level changes. New four-R9700 checks ran before restoring the missing direct-host-compute revert, so they do not validate the UMA path. The extracted sanitizer still needs seamless scheduler/backend wrapping. | Keep inherited #28604's direct-host-compute exclusion. Earlier gfx1151 matches do not resolve pipeline/lifetime concerns, and a scheduler-level sanitizer cannot prove an async backend's internals race-free. Do not run proposed pipe-to-shell installers or opaque replacement binaries. |
| [Merged #28601 / issue #28580: video frame cache IDs](https://github.com/ggml-org/llama.cpp/pull/28601) | Propagates the video hash and frame number into bitmap IDs, preventing different videos with otherwise identical prompts from reusing the first video's cached content. | Merged September 9 and inherited in b10884. This narrow correctness/privacy fix needs no separate package patch; it does not establish isolation of every speculative or multimodal state path. |
| [Issue #28608](https://github.com/ggml-org/llama.cpp/issues/28608) / [closed #28664: HIP vision Flash Attention](https://github.com/ggml-org/llama.cpp/pull/28664) | Large images reportedly trigger an aperture violation in the D=72 CLIP tile on dual gfx1100 GPUs. IMbackK closed the disabling workaround September 11 because it does not fix the underlying kernel problem; the author agreed. | Not inherited or carried. Its `GGML_USE_HIP` guard would also be ineffective in this package's dynamic-backend mtmd build. A separate new gfx1030 long-context text failure does not prove the same cause. Await a proper kernel/backend fix; do not globally disable text FA. |
| [#26419: alternate RDNA FA/dirty-KV report](https://github.com/ggml-org/llama.cpp/pull/26419) / [issue #28768: batched HIP scoring](https://github.com/ggml-org/llama.cpp/issues/28768) / [#26239: generation collapse](https://github.com/ggml-org/llama.cpp/issues/26239) | JohannesGaessler now requests changes to #26419 over technical debt/direct-VRAM assumptions and the pending swizzle design. #28768's withdrawn upstream-regression attribution remains a private width-one GDN-fusion failure, not a stock WMMA failure; its new note stresses raw-logit margins when classifying near ties. | Keep the alternate implementation out and do not restore the retired D=256 workaround. Compare centered logits, batch widths, repeated/dirty-state runs and fixed-reference margins; older collapse reports remain unisolated. A perplexity-only pass can miss decode-only fusion errors. |
| [#28714: RDNA3.5 batched WMMA](https://github.com/ggml-org/llama.cpp/pull/28714) | The `370dc07` ablations report about 2–4.8% whole-model prefill gains, but JohannesGaessler now explicitly declines review/merge because of technical debt and asks for aligned/repacked 16-byte prefetch work instead. Q8_0 prefetch alone regresses without its paired MMA split. | Downgrade from review-ready to a design-blocked experiment. Keep the reviewed #28195 configuration carry and inherited #28935 heuristic; do not cherry-pick half of this kernel rewrite or claim specialized IQ4_XS gains. |
| [Draft #28713: large-row radix `TOP_K`](https://github.com/ggml-org/llama.cpp/pull/28713) | DGX Spark reports about +19–23% prefill with resident/direct-read PLE but only a noisy +4% with mmap-lazy PLE. A reviewer now points to [#28547](https://github.com/ggml-org/llama.cpp/pull/28547) for principled threshold analysis; the author repeats the earlier table. | The shared CUB fallback would also switch HIP to native radix at large row counts, without HIP correctness, tie-order, graph or model controls. No human approval; mutable first-use threshold caching still needs concurrency review. This is not the explicitly CUDA-only #28671 fallback. |
| [#28709: CDNA MMQ heuristic](https://github.com/ggml-org/llama.cpp/pull/28709) / [#28702: dense Q4_K fusion](https://github.com/ggml-org/llama.cpp/pull/28702) / [#28717: SSM state size 96](https://github.com/ggml-org/llama.cpp/pull/28717) | Targets MI100/CDNA dispatch, NVIDIA dense Gate/Up/SwiGLU fusion, and Nemotron3 Puzzle respectively. #28702 is now ready for review, without human approval. | The first excludes gfx1151; the second leaves HIP/MUSA unchanged; the third has no relevant Qwen or HIP numerical result. Follow upstream without adding unrelated kernels. |
| [Closed #28769: TQ2_0 CUDA dequant/MMVQ](https://github.com/ggml-org/llama.cpp/pull/28769) / [closed #28204: small-batch Q4_0 tuning](https://github.com/ggml-org/llama.cpp/pull/28204) | #28769 closed under the one-open-PR rule, while #28204 closed and its branch was deleted. | Neither is inherited. #28769 compiled HIP but did not numerically test it and remains tied to a larger model series; neither supplies a reviewed IQ4_XS/Q8_0 improvement. Await eligible narrow successors. |
| [Original #24759: GGUF padding overflow](https://github.com/ggml-org/llama.cpp/pull/24759) / [carried successor #28810](https://github.com/ggml-org/llama.cpp/pull/28810) / [inherited #28739: empty expert-ID offload](https://github.com/ggml-org/llama.cpp/pull/28739) | The recovered `6e2139f` series is unchanged: redundant assertion removed, native padding-overflow test added, runtime overflow guard retained. | Keep the same immutable remote diff and rebase its local test context to b11012 with a new filename/hash. The draft still has no final approval; it answers the old feedback but does not establish complete malformed-input arithmetic validation. |
| [#28619: draft state missing from disk slot cache](https://github.com/ggml-org/llama.cpp/issues/28619) / [#26004: checkpoint persistence](https://github.com/ggml-org/llama.cpp/pull/26004) / [#25913: hybrid restore loses reuse](https://github.com/ggml-org/llama.cpp/issues/25913) | A new Jetson/CUDA one-slot reproduction restores 4,917 tokens yet fully prefills them again; a resident repeat reuses them. Persistent target checkpoints also do not serialize MTP-owned draft state, which #26004 explicitly excludes. | Do not advertise successful slot-file restore as complete recurrent or MTP warm restart. Require target/draft lifecycle and acceptance tests; no new persistence patch is carried. |
| [Closed #28623: chunked QSA/multi-GPU experiments](https://github.com/ggml-org/llama.cpp/pull/28623) | The author closed the aggregate unmerged September 13. A tester withdrew an initial load failure after discovering they had run master; the actual dual-3090 branch still had poor prefill and insufficient memory with `-lm none`. The author says images were never tested. | No new gfx1151 correctness or performance evidence. Shared direct-Q8 allocation/dequantization changes and resident PLE remain unreviewed; retain the rejection and do not treat the withdrawn wrong-branch failure as a valid reproduction. |
| [Closed #28610: alternative Qwen4-Exp MTP](https://github.com/ggml-org/llama.cpp/pull/28610) | Another detached NextN loader/graph proposal appeared September 8 and was withdrawn September 9; the fork branch remains available. | Original-author permission/provenance concerns and no reviewed compatibility evidence with the carried sidecar layout. Do not replace #27836 or import a withdrawn aggregate patch. |
| [Merged #28630: MTP-only plain KV allocation](https://github.com/ggml-org/llama.cpp/pull/28630) | The reviewed generic gate filters plain draft KV for additional architectures and is inherited in b10909. Qwen4-Exp already has its own filtering. | No separate patch and no additional Flash-Next memory-saving claim. The proposed test-llama-archs change was removed during review, so do not advertise that draft test as part of the merged baseline. |
| [Inherited #28749: native rollback capability probe](https://github.com/ggml-org/llama.cpp/pull/28749) | Moves the existing native `n_rs_seq` capability check before clearing scratch memory and running the two-token fallback decode used during speculative initialization. The reviewed change merged as b10951's `093a2f8`. | Remove the duplicate carry. This initialization optimization preserves state but does not add a rollback algorithm, fix dirty checkpoint restore or provide a new steady-state speed gain over the previous package. |
| [Issue #28652](https://github.com/ggml-org/llama.cpp/issues/28652) / [closed #28666: broader graph-cache identity](https://github.com/ggml-org/llama.cpp/pull/28666) | Alternating ordinary MoE graph shapes can still invalidate CUDA captures. The two-commit proposal keys captures by first-node identity and extents; author short-draft tests report 173.5 to 205.3 t/s, with a longer case neutral. | The author closed it unmerged shortly after opening; no human approval or HIP result. Inherited #28549 separates output/no-output arenas but does not promise to fix every graph-key collision or eliminate graph construction. Do not replace it with this withdrawn broader key scheme. |
| [Historical issue URL #28587](https://github.com/ggml-org/llama.cpp/issues/28587), [merged DFlash fix #28587](https://github.com/ggml-org/llama.cpp/pull/28587), [merged #28715: image/speculation positions](https://github.com/ggml-org/llama.cpp/pull/28715) / [#24669: extended multimodal batches](https://github.com/ggml-org/llama.cpp/pull/24669) | Both narrow fixes are inherited. #28587 skips unsupported multi-row image ranges in DFlash; #28715 passes temporal positions to every drafter. The earlier [owned one-line candidate](https://github.com/jesdga95/llama.cpp/commit/0c5dff206cae014a49fbe5dd901ca9b6a0414ced) remains provenance; [#28716](https://github.com/ggml-org/llama.cpp/pull/28716) is a closed duplicate. | #28715's three approvals and reported gfx1030 DFlash gain do not establish Flash-Next/gfx1151 speed or all-model vision safety: [#25129](https://github.com/ggml-org/llama.cpp/issues/25129) reports Step3.7 image MTP still failing on b10906. #24669 remains the broader unmerged API redesign. |
| [Draft #28699: incremental pooled QSA keys](https://github.com/ggml-org/llama.cpp/pull/28699) / [#28770: true sparse Qwen4 attention](https://github.com/ggml-org/llama.cpp/pull/28770) | Pooled keys report about +9% CUDA MTP at 63K/114K; sparse FA reports DGX Spark prefill/decode gains. [JohannesGaessler now approves #28770](https://github.com/ggml-org/llama.cpp/pull/28770#pullrequestreview-5188003182), while requesting speculative widths 2/4 beyond the current 1/8 specializations. | #28699 `141f3f5` still asserts on images because temporal-position sizing differs from dense M-RoPE cache-cell counting, even with its disable flag. #28770 `41a4ad0` still disables sparse selection on HIP and aborts its HIP compact-mask path. Approval does not add a HIP implementation; neither is carried. |
| [#28751: avoid scheduler re-reserve on causal-attention changes](https://github.com/ggml-org/llama.cpp/pull/28751) / [issue #28734: linear-context QSA decode](https://github.com/ggml-org/llama.cpp/issues/28734) | New head `5012372` explicitly fixes the Qwen4-Exp bias-shape objection by retaining shape across causal-attention changes and passing that mode into QSA inputs. The independent DeepSeek vision report of roughly five seconds saved predates this revision. #28734's broader q8-KV stack remains unreviewed. | Promising, but keep out pending post-fix human review, no-reallocation tests and image/MTP HIP checks. The earlier shape objection is no longer unanswered; the new non-causal visibility behavior still needs validation before treating the old DeepSeek result as Qwen evidence. |
| [Issue #28019: dirty recurrent-state restore](https://github.com/ggml-org/llama.cpp/issues/28019) / [#26425: predecessor-sensitive MTP](https://github.com/ggml-org/llama.cpp/issues/26425) | New CPU/CUDA analysis reports divergence when restoring Qwen4-Exp recurrent state into an already-used context; an older Vulkan test still varies with prompt-cache reuse despite warm-up. | No owned reviewed fix. Single-slot MTP avoids #28286's simultaneous-slot leak but does not prove all sequential restore paths correct. Keep dirty-context restore, repeated conversation and fresh-process controls; do not adopt dummy warm-ups as a correctness guarantee. |
| [#28668: Qwen XML enum grammar](https://github.com/ggml-org/llama.cpp/pull/28668) / [closed #28651: root schema alternatives](https://github.com/ggml-org/llama.cpp/pull/28651) / [Halo staging #26](https://github.com/halo-box/llama.cpp/pull/26) | The narrow enum change now has a typed-schema rebase at `a86bd319` and substantial author baseline/candidate grammar tests. Fork staging received an LGTM with a rebase request, then was rebased; #28651's generic root-union proposal remains closed. | No post-rebase upstream human approval; keep the focused correctness candidate watched. Grammar is not a tool authorization boundary: independently validate arguments and permissions before executing actions. Do not import the rejected generic schema adaptation. |
| [#28682: dedicated Ling/Bailing parser](https://github.com/ggml-org/llama.cpp/pull/28682) / [#28724: boundary UTF-8 sanitization](https://github.com/ggml-org/llama.cpp/pull/28724) | The Ling parser is now `965c048` after September 14 change requests to use current schema types and existing test conventions. UTF-8 handling remains the separate `44b7155` proposal. | No final human approval after these revisions and no Qwen3.8 parser benefit. #28724's replacement/dropped-suffix behavior still needs streaming, cache and output-semantics review. Keep it separate from Unsloth #202 and the newer, flawed #28926 stream rewrite. |
| [Issue #28299](https://github.com/ggml-org/llama.cpp/issues/28299) / [inherited #28646: stop repeated forbidden tools polling](https://github.com/ggml-org/llama.cpp/pull/28646) | The approved `b1a28b9` change merged as `1bc7a5a` and b10975 inherits it: typed `/tools` 403 suppresses per-message probes, while reopening the tools panel deliberately retries. | Remove the duplicate carry, preserving the same availability/recovery behavior and focused regressions. No new execution permissions or destination; it does not fix the separate hostile-link auto-submission issue below. |
| [Closed #28762: finished-download router shutdown](https://github.com/ggml-org/llama.cpp/pull/28762) / [closed #28755](https://github.com/ggml-org/llama.cpp/pull/28755) | [Inherited #28555](https://github.com/ggml-org/llama.cpp/pull/28555) replaces per-instance threads/joins with a single monitor in b10920. #28762 was then closed unmerged rather than reapproved; its two approvals preceded its final join/timeout revision. | Do not carry the obsolete stack or claim all races fixed. The discussion still identifies a finished-download removal/missing-registry exit race. External `hf download` avoids that downloader path; admission remains separate. The monitor bounds partial log lines to 1 MiB but does not constitute process sandboxing. |
| [Issue #28698: router evicts requested models](https://github.com/ggml-org/llama.cpp/issues/28698) / [#28774: concurrent cold starts](https://github.com/ggml-org/llama.cpp/issues/28774) / [closed #28913: eviction reservation fix](https://github.com/ggml-org/llama.cpp/pull/28913) | #28913 gains an independent “works on my end” report but remains closed/unreviewed, with an unrelated asynchronous-initialization commit in its series. #28774's b10969 failure and [#28829](https://github.com/ggml-org/llama.cpp/issues/28829)'s successful serialized control are not contradictory. | Serialize client requests/model switches; `--models-max 1` is not admission serialization. The new reproduction evidence is useful, but require a focused successor and cold-start, eviction and cancellation controls before adopting the aggregate. |
| [Inherited #28736: internal JSON-schema representation](https://github.com/ggml-org/llama.cpp/pull/28736) / [#28742: complex Qwen tool arguments](https://github.com/ggml-org/llama.cpp/pull/28742) | Final schema `3a3f76f` and Qwen successor `5746cc7` gained human approval and merged as `acecd56`/`790cf51`. They fix reference-visit state, refine empty-schema behavior and complex Qwen arguments, and remove the Python schema converter. | Inherited numeric narrowing/overflow remained: the package adds a narrow checked-range guard using existing schema errors. Sixty-five actual-parser sanitizer boundary cases pass; baseline has 19 UB failures and 15 silent wrong-range results. A separate downstream `maximum = INT64_MIN` grammar-negation bug also reproduces on b10920 and remains outside this parser guard; these tests do not establish all-extrema grammar correctness. |
| [#28697: schema wrapper fallback](https://github.com/ggml-org/llama.cpp/pull/28697) / [#28737: Responses input compatibility](https://github.com/ggml-org/llama.cpp/pull/28737) | #28697 now has an independent CPU reproduction: the documented direct `response_format.schema` is ignored, and the patch repairs it without changing nested-wrapper results. #28737 accepts missing assistant-item type / reasoning-summary-only history and supersedes [closed #28735](https://github.com/ggml-org/llama.cpp/pull/28735). | Useful small compatibility candidates, still no human approval or complete server regressions. Use the standard nested `json_schema.schema` wrapper and validated client history meanwhile; do not stack overlapping schema/Responses rewrites speculatively. |
| [#28711: completion finish-reason mapping](https://github.com/ggml-org/llama.cpp/pull/28711) / [#26472: required tagged arguments](https://github.com/ggml-org/llama.cpp/pull/26472) | #28711 tries to distinguish non-output limits; #26472 permutes required tool arguments. | Keep both out: current output-budget exhaustion does not set the prompt-side `truncated` flag, so #28711 would mislabel `max_tokens` exhaustion as `stop`. An independent September 11 test finds #26472 rejects valid Laguna arguments because inter-argument whitespace is lost; the proposed repair is still only in a comment. |
| [#22575](https://github.com/ggml-org/llama.cpp/pull/22575) / [#27958: images in tool responses](https://github.com/ggml-org/llama.cpp/pull/27958) | Competing chat/Responses API implementations preserve image-bearing tool output. #22575 has two human approvals but still needs a write-access maintainer's review; #27958 reports a real Qwen3.8 CUDA image test succeeding instead of HTTP 400. | No agreed merged design or gfx1151 MTP validation. Do not stack overlapping implementations. [Issue #28672](https://github.com/ggml-org/llama.cpp/issues/28672) separately reports dropped MCP images; neither PR establishes that all MCP tool-image paths work. |
| [Closed issue #25790: hostile Web UI `?q=` links](https://github.com/ggml-org/llama.cpp/issues/25790) | It closed automatically as stale, not after a fix. The b10909 chat route still submits the URL's `q` value automatically. With server tools explicitly enabled and execution allowed, a hostile link can cause tool actions through the user's authenticated session. | This is an inherited application risk, not evidence of package-patch malware. Keep tools disabled unless needed; require confirmation and minimal permissions when enabling them, and do not open untrusted chat links in an authenticated tool-enabled session. An API key alone does not stop this route. |
| [Issue #25510: malformed replayed tool arguments](https://github.com/ggml-org/llama.cpp/issues/25510) / [#26207](https://github.com/ggml-org/llama.cpp/issues/26207) / [#28674: LoRA/cache state](https://github.com/ggml-org/llama.cpp/issues/28674) / [#28707: zero-scale LoRA selection](https://github.com/ggml-org/llama.cpp/pull/28707) | Existing reports retain HTTP 500 on malformed historical tool JSON and describe adapter/cache contamination. The new unreviewed LoRA patch fixes initial zero scale and explicit empty adapter lists, but also includes an unrelated test-tolerance change. | No reviewed fix for the separate cross-adapter cache report or current gfx1151 reproduction. Silently replacing invalid arguments with `{}` changes conversation meaning; validate client history. If adding LoRA, isolate adapter-specific caches and verify scale changes. The documented no-LoRA profile does not need a speculative adapter patch. |
| [Issue #28723: stdio MCP request-size hang](https://github.com/ggml-org/llama.cpp/issues/28723) | A Windows report shows requests around 1–5 KiB wedging one configured stdio MCP server until its child is restarted. A September 13 single-server/18-tool reproduction rules out the earlier 40-tool set as the cause; the independent MCP inspector still works. | No owned fix or Linux/HIP reproduction. Watch subprocess transport and timeout/recovery, not GPU inference; avoid interpreting this availability report as evidence of malicious patches. |
| [#28731: GGUF split-option validation](https://github.com/ggml-org/llama.cpp/pull/28731) / [closed #28757](https://github.com/ggml-org/llama.cpp/pull/28757) | Rejects zero/invalid tensor counts and unit-only size limits instead of division by zero or uninitialized limit use in `llama-gguf-split`. | Unreviewed local utility-input robustness, not an inference-loader patch. Use positive, valid split limits and await reviewed coverage; the duplicate is not inherited. |
| [Draft #28685: require requested OpenSSL](https://github.com/ggml-org/llama.cpp/pull/28685) / [closed #28754: prebuilt UI provisioning](https://github.com/ggml-org/llama.cpp/pull/28754) / [inherited #28802: UI asset cache](https://github.com/ggml-org/llama.cpp/pull/28802) | Ggerganov closed #28754 on September 13 explicitly in favor of the inherited content-fingerprint cache. It skips unchanged embedding and retains local asset priority. The requested-OpenSSL proposal remains unapproved. | PKGBUILD runs `npm ci`/`npm run build` first; existing `tools/ui/dist/index.html` selects the early local-assets return before remote provisioning. The cache changes build work, not inference or the UI's tools permissions. Actual OpenSSL linkage is verified separately. |
| [#27401: UI conversation compaction](https://github.com/ggml-org/llama.cpp/pull/27401) / [closed #28710: title-generation model](https://github.com/ggml-org/llama.cpp/pull/28710) / [#26928: generated-file downloads](https://github.com/ggml-org/llama.cpp/pull/26928) | Optional UI features are being rebased or redesigned. New human review asks #26928 to replace hundreds of lines of filename inference with a narrow button and existing download helper. | Await the agreed UI design and review. Conversation summarization is lossy, not transparent KV/PLE offload, and a second title model can cause router switching on `--models-max 1`. None is an MTP acceleration patch. |
| [Inherited #28530: downloads at the loaded-model limit](https://github.com/ggml-org/llama.cpp/pull/28530) / [#28059: HTTP gzip](https://github.com/ggml-org/llama.cpp/pull/28059) | Two human approvals preceded #28530's merge as `56381e4`; downloading children no longer consume loaded-model capacity. #28059 is now ready for review at `4e09b46`, including a proxied Content-Encoding correction, but remains unapproved. | Inherit the capacity fix without a separate patch. It does not fix concurrent admission or shared-file download corruption. Keep optional response-compression changes watched; current UI asset gzip remains available. |
| [Issue #28656: multimodal embedding batch variance](https://github.com/ggml-org/llama.cpp/issues/28656) / [#28676: mixed Windows GPUs](https://github.com/ggml-org/llama.cpp/issues/28676) | New reports concern CUDA unified-batch image embeddings and Windows multi-GPU corruption, respectively; CPU/single-slot or Linux/single-device controls did not reproduce their corresponding failures. | No owned reviewed HIP fix and no direct match to this single-APU Arch profile. Preserve the reports as regression leads, not proof that this package needs another kernel or scheduling override. |
| [Reopened #28462: build identity](https://github.com/ggml-org/llama.cpp/pull/28462) | New author analysis confirms CMake script mode can still search upward from its invoking build directory; passing `LLAMA_SOURCE_DIR` alone does not fix the generic probe. | This package already pins the tag commit and bounds Git discovery, and its local UI assets return before version resolution. Retain those controls; no additional identity patch is needed. |
| [Unsloth #201: checkpoint buffer pool](https://github.com/unslothai/llama.cpp/pull/201) | New draft head `00ce29b` fixes a latent static-destruction use-after-free; author CPU/ASan/TSan tests now cover OOM trimming, idle release, and ownership. | No independent human approval or gfx1151 comparison. Growing checkpoints can retain several GiB up to a host-RAM-based cap, potentially exceeding container budgets. On a shared 128 GiB machine retained pool memory is not free; do not add this allocator policy speculatively. |
| [Unsloth #187: pipeline contexts](https://github.com/unslothai/llama.cpp/pull/187) / [#194: exact concurrency](https://github.com/unslothai/llama.cpp/pull/194) | Parallel contexts aim to keep multi-node layer splits busy. The latest two-Spark rerun reports 1.68x rather than the earlier 1.77x, with machine-state caveats. #194 is superseded by the newer preemption stack below. | Broad scheduler/KV/backend work without independent approval or a local one-APU gain. It is not a demonstrated fix for #28286 on this stack; keep single-slot MTP. |
| [Unsloth #197](https://github.com/unslothai/llama.cpp/pull/197), [#210](https://github.com/unslothai/llama.cpp/pull/210), [#211](https://github.com/unslothai/llama.cpp/pull/211): preemption / exact concurrency | Current #210 head `ae19539` adds fixes for the earlier Inkling/page-table collision, invariant planes, replay statistics and recurrent async-transfer handling. Preemption remains opt-in (`--preempt-ram 0`); #211 updates the composition pin. | Still thousands of lines of scheduler/KV/kernel work without independent human approval or gfx1151/MTP isolation evidence. The latest automated review flags negative budgets below `-1` becoming unlimited. Its earlier clean automated security report is not approval or proof of current-head safety. The earlier collision findings are no longer described as unfixed. |
| [Unsloth #193](https://github.com/unslothai/llama.cpp/pull/193), [#196](https://github.com/unslothai/llama.cpp/pull/196), [#199](https://github.com/unslothai/llama.cpp/pull/199): RPC transport/upload work | New revisions fix multiple staging, protocol-capability, resource-lifetime, and upload-profiler issues. | Latest #193 review still finds deferred-SET reservation ordering and live-event recycling races; #196 retains failed-peer retry/cache concerns. No one-APU benefit, no independent approval, and CPU checks do not exercise the async GPU staging path. Keep out. |
| [Unsloth #203: RPC shutdown](https://github.com/unslothai/llama.cpp/pull/203) / [#202: invalid UTF-8 output](https://github.com/unslothai/llama.cpp/pull/202) | New author fault tests strengthen teardown and UTF-8 correctness evidence; #202 also tests valid Unicode and real CPU model output. | Neither has human approval. #203 does not fix active-serving peer loss, no-response hangs, or every client's SIGPIPE behavior. #202 deliberately leaves incomplete final UTF-8 suffixes dropped in streaming while replacing them in non-streaming. These are useful but incomplete robustness proposals, not MTP acceleration. |
| [Unsloth #200: response-queue rewrite](https://github.com/unslothai/llama.cpp/pull/200) / [#191: event tracing](https://github.com/unslothai/llama.cpp/pull/191) | Reduces high-concurrency host stalls and adds pipeline/RPC profiling. #200 has stronger author CPU lifecycle tests; #191 has corrected several false-pass and accounting bugs. | No independent approval or single-slot HIP benefit. #191's latest review still finds missing speculative/vision accounting, timeline/flush errors, and tracing under the RPC send lock. Do not ship it as a validated low-overhead benchmark facility. |
| [#27977: closed Qwen3.8/QSA optimization umbrella](https://github.com/ggml-org/llama.cpp/pull/27977) | Its full five-change stack reported roughly +9% at 16K and +17% at 32K on gfx1151, and about +18% on one 24K MTP+n-gram file rewrite. Its random-weight [`micro-qwen4exp`](https://huggingface.co/Lynxpda/micro-qwen4exp) fixture remains useful for cheap context-scaling A/B work. | It closed after the author split the changes. The figures are for the combined stack, not every commit, and the fixture cannot measure language quality or MTP acceptance. Review split changes individually; #28040 is now inherited. |
| [#27897: mixed external drafter plus MTP initialization](https://github.com/ggml-org/llama.cpp/pull/27897) | Fixes the draft-algorithm list when embedded `draft-mtp` is combined with `draft`, `draft-dflash`, or `draft-dspark` and `-md` selects an external drafter; its gfx1151 reproduction is fixed. | It is an unreviewed draft and does not affect the documented pure `draft-mtp` or `draft-mtp,ngram-mod` sidecar workflow. Carry it only if this package starts supporting a mixed external-drafter configuration. |
| [#27694: probabilistic MTP/rejection sampling](https://github.com/ggml-org/llama.cpp/pull/27694) | Danbev approves `7cf540b` after seed/reset fixes. New CUDA AIME evaluations are mixed: 27B scores 98.68% versus 96.96%, while 35B scores 94.17% versus 95.80%, with different truncated-answer exclusions; earlier speed gains remain model dependent. | Keep watched: these are not a clean distribution-equivalence proof or gfx1151/Qwen4-Exp grammar/repeated-request control. The sampler/replay change also affects positive-temperature verification under greedy drafting. No tests are committed in the diff; the previous RNG objection is addressed, not the entire validation question. |
| [#27692: speculative prefill](https://github.com/ggml-org/llama.cpp/pull/27692) | Uses a small drafter to discard apparently unimportant prompt chunks before the target prefill. Strix Halo Vulkan reports claim roughly 2–2.3x lower time-to-first-token at moderate thresholds. | The pruning is intentionally lossy, the PR is now 22 commits, and an earlier report says output stopped around 80K while the GPU kept working. Its MTP compatibility question is unanswered, prior draft-state bugs make it high risk, and there is no new HIP result or approval. |
| [#27861: GPU-resident LRU MoE expert cache](https://github.com/ggml-org/llama.cpp/pull/27861) | New Windows/Vulkan RX9070XT testing with CPU-offloaded experts and no MTP reports 30.4–32.2→39.9–40.7 t/s while memory rises from 12.8 to 15 GB. Earlier synchronization/PCIe regressions remain separate evidence. | Still an unreviewed draft with cache-slot ordering and lifetime concerns. The new discrete-GPU result does not establish benefit on a shared-memory 128 GB APU; require numerical, async-ordering and isolated gfx1151 controls rather than high hit rate alone. |
| [Inherited #27825: internal HIP AllReduce](https://github.com/ggml-org/llama.cpp/pull/27825) / [#28967: cross-process NCCL proposal](https://github.com/ggml-org/llama.cpp/pull/28967) | New dual-gfx1100 testing finds internal AllReduce about 2.5–2.8% faster for decode while RCCL is about 9% faster for large prefill. #28967 now supplies two-Spark benchmarks but retains backend-API design objections. | Keep the inherited exactly-two-local-device path without adding the unreviewed distributed stack or changing this single-APU package's collective configuration. Do not keep claiming benchmarks are absent; their backend/workload limits and missing settled interface review are the reason for deferral. |
| [Closed issue #27021: gfx1151 wide-`TOP_K` and RPC stress](https://github.com/ggml-org/llama.cpp/issues/27021) | Fresh two-node gfx1151 validation of inherited #27466 passed boundary/oversized/tie/NaN cases, 500/500 CPU-reference comparisons, all 354 formerly skipped rows wider than 1024, and 128K/132K/256K RPC milestones. | It closed after confirming the native radix fix is already inherited, so no source patch is needed. The same test exposed two separate availability gaps with no owned patch: RDMA receive/poll has no peer timeout, and graceful shutdown can assert after an in-flight RPC failure. Track those before treating long-haul RPC as fault tolerant. |
| [#28128: closed flat QSA position scan](https://github.com/ggml-org/llama.cpp/pull/28128) | Replaces ordered-set predecessor lookup with a flat scan; a dual-A6000 130K result rose from 17.0 to 19.7 t/s. | It closed unmerged and unreviewed, with no gfx1151 isolation. It is an alternative to inherited #28040, not an established additive change; retain it only as comparative profiling evidence. |
| [#28130: sparse QSA gather](https://github.com/ggml-org/llama.cpp/pull/28130) / [Unsloth successor #165](https://github.com/unslothai/llama.cpp/pull/165) | Sparse gather was reported +41–45% at 129.6K on dual A6000 and about +75% when stacked with adjacent work. | Upstream #28130 was closed by a contributor-limit bot rather than technical review. The successor is broad, unreviewed, complex indexing code with no HIP/gfx1151 result or accepted provenance; a new user report says it no longer applies to the latest MTP branch and has no author answer. |
| [#28055: remove Linux `MAP_POPULATE`](https://github.com/ggml-org/llama.cpp/pull/28055) | Could reduce blocking and unnecessary page-cache pressure during ordinary mmap loads. It supersedes the narrower, now-closed [#27928](https://github.com/ggml-org/llama.cpp/pull/27928). | It changes loader policy globally and lacks controlled model-level evidence for this mixed lazy/non-mmap profile. The current base already avoids whole-model mmap in the recommended configuration. Its latest force-push is a patch-identical rebase, not new evidence. |
| [Merged #28326 / issue #28160: UMA lazy-buffer policy](https://github.com/ggml-org/llama.cpp/pull/28326) | Approved and inherited in b10872. The final patch only disables `auto` when a selected device reports `mmap_support=false`; the proposed `on`→`all` rename was withdrawn. | Strix Halo HIP now defaults to non-lazy loading. Keep explicit `-lm none -lzm on` for the documented SSD-PLE setup. New reports include whole-system OOM after disabling lazy loading; discussion of OS OOM policy adds no memory bound or loader fix. This change does not reduce PLE I/O latency or solve every loading-memory peak. |
| [#28136: direct buffered-read PLE](https://github.com/ggml-org/llama.cpp/pull/28136) | Earlier gfx1151 cold-prefill gains remain +20–32%, with larger Blackwell/Windows reports. A new GB10 adaptation instead finds direct reads slower than its own threaded mmap+`WILLNEED`: 330.2 versus 361.2 t/s at 37K and 169.1 versus 183.9 t/s at 140K, with matching perplexity. | The unchanged `c6a9e5c` remains the priority SSD-PLE experiment, not a universal win or an A/B against our prefetch. Its old approval predates the reader refactor, which recreates workers per gather and reopens pathnames without identity/size checks. Buffered `pread` still uses page cache. Require post-refactor review, descriptor/TOCTOU hardening, a persistent pool, and current gfx1151 HIP testing. |
| [GenerelSchwerz fork #86: bounded requested-page PLE prefetch](https://github.com/GenerelSchwerz/llama.cpp/pull/86) | A narrower alternative hints only requested mapped pages, using a bounded 256-range scratch array and explicit mapping/row/page-range checks. The author reports about 20.3% lower prompt time in one CUDA model A/B. | High-priority alternative to compare with our existing row readahead, **not another patch to stack blindly**. No independent review, gfx1151 result or package-prefetch baseline. Advice can block and its warm 16-row microcase slows from 4.9 to 11.8 microseconds; measure cold, warm, random prompts and small MTP batches before changing policy. |
| [Closed issue #28256: pathological small PLE reads](https://github.com/ggml-org/llama.cpp/issues/28256) | A Qwen4-Exp model served from NFS over 10 GbE with NVMe FS-Cache fell below 1 prompt token/s because PLE lookup issued tiny reads, even at a 100% cache hit rate; fully warming the GGUF into RAM removed the slowdown. | It closed September 8 as expected lazy-mode behavior, not after a filesystem fix. Caching alone does not coalesce the access pattern. Keep models on fast local NVMe, measure actual disk latency, and continue watching #28136 rather than promising that every SSD-backed filesystem performs well. |
| [Unsloth #169: lazy mode overrides load mode](https://github.com/unslothai/llama.cpp/pull/169) | A report-only PR describes lazy mapping overriding `none`, `mlock`, or `dio` in that fork; one rotating-storage run fell from about 22 to 5 t/s. | Not a code fix. In our newer base #28326 disables implicit `auto` on HIP, but explicit `on` still overrides the global load mode. Continue setting both options deliberately and use local NVMe. |
| [#28233: preserve mmproj fit margin across sleep/resume](https://github.com/ggml-org/llama.cpp/pull/28233) | Prevents adding the projector's memory-fit margin after every sleep/wake cycle. New independent GPU testing reports five stable GPU-only resumes, whereas the baseline progressively reduced context or offloaded to CPU. | Stronger evidence than the earlier CPU/log checks, but no formal approval yet. Keep watched: the documented explicit-context single-slot profile does not enable sleep, and the fix does not improve active MTP or SSD-PLE reads. Revisit for a sleep-enabled deployment or after merge. |
| [#28242: surface asynchronous initialization failures](https://github.com/ggml-org/llama.cpp/pull/28242) | Synchronizes after server context initialization so a deferred backend failure is reported during startup instead of after the server announces readiness and returns errors for every request. | It is a small generic robustness change, but unreviewed and manually tested only on Metal. Await HIP failure-path coverage and upstream review. |
| [Issue #28286: MTP cross-slot content contamination](https://github.com/ggml-org/llama.cpp/issues/28286) | Four concurrent `draft-mtp` requests on gfx1151/ROCm-TheRock 10.1 produced plausible text belonging to other slots. The reporter ruled out the client harness and reproduced with HIP graphs disabled; the same workload did not fail at `--parallel 1`. | This is a correctness and confidentiality failure in the still-draft MTP path, not merely bad output. Until a reviewed fix lands, `--np 1` and client concurrency one are mandatory whenever `draft-mtp` is active. The approved host-buffer guard does not fix this separate reproduction. |
| [Closed issue #28266: withdrawn multi-turn-collapse report](https://github.com/ggml-org/llama.cpp/issues/28266) | The earlier report described short-output collapse during streamed HIP/gfx1100 conversations. On September 4 the author deleted its body and closed the issue without a technical explanation or identified fix. | Preserve this as historical context, not a current reproducible bug or evidence that a fix landed. Multi-turn output-length and slot-reuse tests remain useful independently of this withdrawn report. |
| [Issue #28280: recurrent checkpoint livelock](https://github.com/ggml-org/llama.cpp/issues/28280) / [merged #28302](https://github.com/ggml-org/llama.cpp/pull/28302) | Inherited checkpoint retention reduces some repeated prefill. A September 10 dual-RTX report still re-prefills on b10884 when the shared prefix ends before any retained checkpoint; that is outside this narrow fix. | This can retain more checkpoint memory (up to the configured cap, default 32; one earlier run observed 596 MiB). No direct regression proves that the separate two-slot gfx1151 Vulkan livelock is fixed. Do not confuse checkpoint retention with MTP slot isolation. |
| [#28058: synchronize asynchronous graph inputs](https://github.com/ggml-org/llama.cpp/pull/28058) | Directly targets cross-request KV contamination on integrated GPUs; its first commit unconditionally synchronizes before graph-input mutation. A second commit rejects impossible mid-range recurrent erases and disables `--cache-reuse` for memories that cannot perform them. Independent gfx1150/ROCm 10 testing now confirms the synchronization diagnosis on another model family. | It remains a two-fix draft with no human review. Because the failure can cross request boundaries, it is security-relevant; keep the inherited #28604 host-compute exclusion until the commits are split or reviewed and HIP/gfx1151 concurrency, chunked-prompt, recurrent, and cache-reuse tests pass. |
| [#28061: avoid speculative replay livelock](https://github.com/ggml-org/llama.cpp/pull/28061) / [issue #28060](https://github.com/ggml-org/llama.cpp/issues/28060) | Prevents replayed accepted draft tokens from being verified a second time after checkpoint restore, avoiding a batch-shape-dependent speculative loop. | The PR was closed for missing original-author permission and never merged. The issue was later closed as completed without an owned replacement or code landing, so the technical diagnosis remains unresolved. Its reproduction is Strix Halo Vulkan, not HIP; retain multi-round HIP validation rather than treating issue closure as a fix. |
| [#28104: closed alternative Qwen4-Exp MTP port](https://github.com/ggml-org/llama.cpp/pull/28104) | Bundled replay handling, output gathering, and an on-device checkpoint experiment; one gfx1151 Vulkan 70K report claimed about +50%. | It closed without the required original-author permission or an authorized successor. Its checkpoint work is superseded by merged #28123, while the replay-livelock diagnosis remains tracked in issue #28060. |
| [Issue #28049: accepted tokens after EOG](https://github.com/ggml-org/llama.cpp/issues/28049) / [#28232](https://github.com/ggml-org/llama.cpp/pull/28232) | On a hybrid model, MTP tokens accepted after the first end-of-generation token can remain in the slot and force the previous answer to be prefetched again on reuse. Owned PR #28232 truncates at EOG before rollback/state updates and adds an n-gram regression. | This is separate from #28060/#28061. The unreviewed 104-line fix tests only a synthetic n-gram drafter, not MTP, hybrid recurrent checkpoints, multi-turn slot reuse, cache reuse, or HIP. The extra tokens are hidden from the client, so application-side output truncation cannot fix server state. Disable MTP for affected reused conversations, clear/restart server-side slot state between turns, or accept the redundant prefill while awaiting broader validation. |
| [Issue #27852: stale per-slot draft state](https://github.com/ggml-org/llama.cpp/issues/27852) | Reports stale ngram-cache context and analogous MTP state. New Unsloth code analysis distinguishes ngram-mod: it learns each new prompt correctly but retains a shared learned table, which can inflate repeat-prompt acceptance by replaying prior completions. | No complete lifecycle fix is established; carried #28333 covers the fresh-sequence MTP carrier. Use fresh-process and diverse-prompt controls. [#27866](https://github.com/ggml-org/llama.cpp/pull/27866) is an unapproved ngram-cache context/watermark reset, not a fix to the recommended ngram-mod algorithm. |
| [Issue #28139: prompt-cache lookup bypass](https://github.com/ggml-org/llama.cpp/issues/28139) | An empty explicit slot can yield NaN similarity and skip a usable entry. New CUDA and independent CPU/disk-cache tests also show a highly retained but much shorter slot suppressing lookup of a better prefix; one report reduced 162 seconds to 3 with a changed lookup gate. | There is no owned reviewed fix. Suggested threshold changes still miss intermediate-similarity cases and can trigger unnecessary cache saves. Require separate save/load policy and tests for empty, explicit, automatic, longer-prefix, and branching-conversation selection. |
| [Issue #28276: shorter restored slot hides a longer RAM-cache match](https://github.com/ggml-org/llama.cpp/issues/28276) | Restoring a shorter slot can take precedence over a longer in-memory prefix and force roughly 20K tokens to be prefetched again. | There is no patch yet. It primarily affects persistent or branching conversation latency, not steady-state single-slot arithmetic; include it in future checkpoint and disk-cache regression tests. |
| [#28175: large-grid norm kernels](https://github.com/ggml-org/llama.cpp/pull/28175) | Broadens the oversized-grid work from #28039 across NORM, RMS_NORM, L2_NORM, and fused RoPE kernels. | It is substantial shared-kernel churn tested only on an RTX 5070, with no review or HIP result. Merged #27941 already avoids the Qwen-specific launch shape; await gfx1151 testing and review before changing every backend's norm dispatch. |
| [#26004: persist recurrent checkpoints in slot files](https://github.com/ggml-org/llama.cpp/pull/26004) | Allows hybrid-recurrent state restored from disk to resume from a checkpoint. The unchanged `06d9d0f` head now has another Vulkan report on gfx1103: about 71 to 3 seconds for 4.5K tokens, alongside the earlier gfx1151 result of 181.9 to 4.7 seconds. | No human approval. The author explicitly acknowledges that MTP-owned state remains outside the saved KV/checkpoints; require acceptance comparisons against a resident session, not just faster target restore. Corrupt/mismatched-file, restart, multi-slot, multimodal, and compatibility tests remain necessary. Closed #28074 was a narrower duplicate. |
| [#28092: persistent disk prompt cache](https://github.com/ggml-org/llama.cpp/pull/28092) | The author renamed the options to `--cache-dir` / `--cache-dir-max` and now expects a different maintainer block-hash design to supersede this implementation. Existing AMD Vulkan livelock and ROCm/DMA concerns remain. | Keep this large unreviewed parser/file-format/state-lifetime surface out. Renaming flags does not resolve shared-mapping writeback, corruption, atomicity or recurrent/MTP restore risks. Persistent prompt state is not SSD-PLE weight streaming. |
| [#28075: assign view-backed output ops to a compatible backend](https://github.com/ggml-org/llama.cpp/pull/28075) | Changes common scheduler placement when an op writes through a tensor view; the author says it lets Qwen4exp and three other previously skipped architectures pass `test-llama-archs` on WebGPU. | It is now ready for review rather than draft, but still has no focused HIP regression or gfx1151 result while changing shared scheduler behavior for every backend. Await review plus HIP multi-backend/RPC and view-backed-output tests. |
| [#28097: alternate Unsloth MTP sidecar layout](https://github.com/ggml-org/llama.cpp/pull/28097) | Loads a different head-only layout without trunk or mixer tensors and includes a speculative-model path cleanup. A new four-V100 rebased test reports coherent long output, but is not HIP validation. | It remains an unreviewed draft, conflicts with the carried `a82a58a`/drluoto layout, and has no conversion/interoperability decision. The apparent path fix is not needed by current in-tree callers: both first convert base parameters to draft parameters. |
| [#28243: upstream Qwen3.8 MTP successor](https://github.com/ggml-org/llama.cpp/pull/28243) | The unchanged `d1a9235` draft borrows target embeddings/output via `ctx_other`. A new user asks whether the work will continue after #28896's norm-fusion conflicts; no updated public source or HIP result follows. Earlier mixed CUDA/Vulkan fork tests loaded but ran about 7.6% slower with MTP despite 70.2% acceptance. | Keep the standalone-head stack, whose own rebase already preserves upstream norm reshaping and HC fusion. This unapproved shared-tensor layout still leaves draft-head QSA TODOs, device/fit/ownership concerns and mixed long-context evidence. Inherited #28549 does not adopt shared tensors. |
| [Unsloth #144: shared-sidecar/MTP umbrella](https://github.com/unslothai/llama.cpp/pull/144) / [#152 loader mapping](https://github.com/unslothai/llama.cpp/pull/152) | #144 is now rebased to `f40f64a`; its older author CPU/CUDA matrix does not cover the newly reported NextN norm-shape load assertion. #142 closed in its favor, not as a merge. #152 remains `b2b5ed9`, with an M3 Max testing offer but no published result. | Neither has human approval or a clean new HIP control. Shared-tensor ownership, fit/accounting and output concerns remain; our standalone head already has the compatible NextN norm reshape. #152 principally targets Metal residency, whereas HIP copies tensors individually. Keep the tested isolated stack. |
| [#28099: missing `block_count` guard](https://github.com/ggml-org/llama.cpp/pull/28099) | Fails cleanly instead of aborting when a malformed GGUF omits architecture block count. | The small fail-closed change looks reasonable, but it prevents a local model-load denial of service rather than a remote package threat and has no review or regression test. Prefer upstream acceptance. |
| [#28109: Gated DeltaNet batch-invariance test](https://github.com/ggml-org/llama.cpp/pull/28109) | Adds a regression that checks recurrent output is invariant to batch partitioning. | It is draft, CUDA-only test work and changes no runtime source. Use it as a future HIP validation reference rather than a package patch. |
| [#28117: keep draft KV on GPU](https://github.com/ggml-org/llama.cpp/pull/28117) | Separately offloads the drafter KV even when the target uses `--no-kv-offload`; RTX 5090 reports rose from 19.2 to 27.2 t/s at 65K and 13.3 to 21.1 at 123K. | It silently changes an explicit memory-placement policy and can OOM constrained systems. There is no review or HIP/unified-memory result. It needs an explicit drafter option and memory accounting. |
| [#28118: on-device recurrent checkpoints](https://github.com/ggml-org/llama.cpp/pull/28118) / [JayToltTech follow-up](https://github.com/JayToltTech/llama.cpp/pull/1) | Avoids copying full recurrent checkpoints through host memory. The newer fork reports gfx1151 Vulkan improving from 4.33 to 16.08 t/s at 70K and CUDA by 61%. | Both variants predate merged #28123. On the current base, Qwen4-Exp's native recurrent rollback covers the normal configured draft range, so those checkpoint calls are only a fallback and should not be hot. The older draft can also hard-abort on fragmented ranges. Require a post-#28123 trace and A/B proving the fallback still executes before carrying either version. |
| [Closed #28192: architecture-selected NextN loading](https://github.com/ggml-org/llama.cpp/pull/28192) | Tried to narrow generic #28159 metadata loading after its initial array-sizing regression; CISC closed it unmerged September 11. | Merged #28173 already fixes the regression. The incomplete whitelist omits Gemma4/Qwen4-Exp MTP and adds aborting metadata assertions. Preserve the rejection rationale; closure does not replace the complete inherited loaders or justify importing this alternative. |
| [#28149: fail cleanly on graph/allocation errors](https://github.com/ggml-org/llama.cpp/pull/28149) | Propagates generic graph-reservation and CLIP allocation failures instead of continuing into a later crash; now ready for review. | Still no human approval or automated OOM/retry regression. Await tests of state after failed reservation; this is robustness work, not demonstrated MTP/PLE acceleration. |
| [#27210: adaptive MTP depth](https://github.com/ggml-org/llama.cpp/pull/27210) | Seven-commit head `b0d2c5e` rebases the earlier `d236d41` work; the reviewed-response commit has the same stable patch ID, not a new algorithm or benchmark. Earlier gfx1151 gains and MI50 losses remain workload-dependent. | No human approval. The series also changes shared recurrent snapshot writes, whose rewind invariant is still discussed, and lacks the detached-sidecar fit predicate. Require current gfx1151 HIP correctness/performance tests; fixed measured depth remains the default. |
| [#26827: serialize multi-ubatch MTP decode](https://github.com/ggml-org/llama.cpp/pull/26827) / [issue #28252](https://github.com/ggml-org/llama.cpp/issues/28252) | The author rebases to `53ae111` and reports a month without the dual-3090 long-catch-up wedge. Earlier controls isolate second-ubatch overlap and pass three 184K patched runs; single-GPU CUDA did not reproduce. | Still no independent review or gfx1151 reproduction. Even narrowed synchronization may slow long catch-up on one APU; the rebase and longer personal use strengthen availability evidence, not single-device applicability. |
| [#28178: HIP small-copy compute kernel](https://github.com/ggml-org/llama.cpp/pull/28178) | Replaces same-type HIP D2D SDMA copies up to 16 MiB with an in-queue compute kernel; one copy-heavy gfx1103 Mamba2 workload reports about 29–195% decode gains while dense work stayed neutral. A Qwen3.5 GDN run with only two qualifying copies gained roughly 1%. | It is now ready for review but unapproved, default-active across HIP, tested on one non-Strix Windows APU, and the threshold is untuned. Broad copy tests passed, but there is no gfx1151 or Qwen4-Exp MTP run. Benchmark it separately before inclusion. |
| [#28303: gfx1151 F32 `CONCAT` transpose](https://github.com/ggml-org/llama.cpp/pull/28303) | Adds a narrow RDNA3.5 shared-memory transpose path for a prefill `CONCAT` shape. An actual 8060S/ROCm 7.1 run reports bit-identical output, 198/198 backend cases passing, +4.1–12.2% prompt processing, and neutral decode. | The one-commit, +132/-1 PR is new and unreviewed. A known small-channel shape regressed 4.25%, showing that its current width-only gate still needs refinement. Keep it as a high-priority isolated gfx1151 A/B rather than default package code. |
| [Carried #28195: gfx1151 RDNA3.5 MMQ tile tuning](https://github.com/ggml-org/llama.cpp/pull/28195) | Independent gfx1151 testing reports Qwen3.6-35B Q4_K_M prompt gains of roughly 0.44–3.11%. Pwilkin's September 10 approval joins IMbackK's approval of unchanged `c6381ea`. | Retained carry: 30 numeric launch configurations use 128-thread/64-row tiles for selected Q4_0/Q8_0/Q4_K/Q5_K/Q6_K shapes. IQ4_XS and typical small `J=16` MTP batches are untouched. No new speedup beyond the previous package or universal Flash-Next claim. |
| [Inherited #28102: AMD WMMA Flash Attention dispatch](https://github.com/ggml-org/llama.cpp/pull/28102) | [Patt92's original rollback](https://github.com/Patt92/llama.cpp/commit/3294199a72d72fbc3061429c0bcc3050b065ed6e) was explicitly withdrawn by [the September 14 reapplication](https://github.com/Patt92/llama.cpp/commit/7018bc9c1349e5d8d2c20ca117534e65a7a3047b): the reported garbage and zero MTP acceptance came from truncated RPC disk-cache files, not the FA tuning. [Other gfx1201 results](https://github.com/ggml-org/llama.cpp/issues/26220#issuecomment-5642700091) are separate performance evidence. | Remove this package's local gfx1151 D=256 WMMA bypass and return to inherited dispatch. The original rationale no longer supports disabling it; this is not an import of Patt92's graph/RPC stack or a locally measured speedup. Continue image/dirty-state/F16/Q8_0 hardware testing. |
| [#28213: Qwen4-Exp sparse QSA gather](https://github.com/ggml-org/llama.cpp/pull/28213) / [Patt92's batched extension](https://github.com/Patt92/llama.cpp/commit/a40b1941ff51308516d7331ed8551d4c08935a49) | [Fork `605bbf6`](https://github.com/Patt92/llama.cpp/commit/605bbf65f636384d4c9e775ebb58aa57b9646ac1) applies batching through eight verification tokens, fixes bias stride and includes selective gathered-versus-masked checks. The later fork FA-corruption attribution has been withdrawn in favor of truncated RPC cache files. | Improved coverage still lacks an independent long-context/image/dirty-restore MTP A/B on the clean HIP package. Parent direct-host compute and the growing graph/RPC stack remain separate risks. Watch the narrow implementation; the withdrawn report is not proof that this gather or the user's IQ4_XS weights are defective. |
| [Closed #28244 / #28349: sparse QSA alternatives](https://github.com/ggml-org/llama.cpp/pull/28244) | #28244 reused the mask; #28349 tried a one-line sparse-FA hint. A new M2 Ultra comparison of #28349 reports roughly +20% prefill at 128K but −2–4% decode, illustrating that the earlier M5 gains do not generalize. | Both remain closed unmerged. #28349 closed after a maintainer requested broader device testing, and HIP has no sparse-FA consumer for its hint. Retain these measurements as design evidence without importing either patch. |
| [#28265: keep GDN output projection two-dimensional](https://github.com/ggml-org/llama.cpp/pull/28265) | Avoids flattening a GDN projection and reports exact-output ROCm gains of about 3.5–6.2% on Qwen3.8/Qwen3.6 when using four or eight slots. | Single-slot results are neutral to slightly negative, the PR is unreviewed, and MTP is restricted to `--np 1` because of #28286. It is therefore not useful for the supported MTP configuration; revisit only after the cross-slot correctness problem and separate #25992 race family are resolved. |
| [#28305: static MTP sampling graphs under no-realloc](https://github.com/ggml-org/llama.cpp/pull/28305) | Builds fixed sampling chains so MTP backend-sampling shape changes do not trip `GGML_SCHED_NO_REALLOC`. | This package does not enable that diagnostic environment mode. The new PR has no review or HIP overhead result, so keep it as validation/debugging work rather than production source. |
| [#28313: rewritten native ROCm `TOP_K`](https://github.com/ggml-org/llama.cpp/pull/28313) | Replaces the native/hipCUB split with small, n-ary and parallel-radix HIP kernels. The author now promises to check the maintainer's remarks, but code remains `93ceb53` without new results. | Still unreviewed: gfx11 wave32 rebenchmarking, GCN/CDNA lane width, QSA-sized k≈2K and HIP graph coverage remain unresolved. Retain native radix plus hipCUB; the acknowledgement adds neither ROCm `DeviceTopK` nor established model-level Strix gains. |
| [#28358: Flash Attention vector-store race fix](https://github.com/ggml-org/llama.cpp/pull/28358) | Guards a q8_1 shared-memory store in the shared CUDA/HIP FA-vector kernel; its first commit can affect HIP at head size 64. | The two-commit draft is still unreviewed. A maintainer now explicitly requests the race logs; no response was present at this scan. Existing evidence and the second synchronization change are CUDA-only, and the demonstrated head shape is not the normal Qwen3.8 case. Await review and HIP validation; this is separate from inherited #27870's F16 barrier fix. |
| [#28339: gfx11-generic MMVQ launch sizing](https://github.com/ggml-org/llama.cpp/pull/28339) | Queries function attributes to avoid NaNs when a generic gfx11 code object has fewer available warps than host dispatch assumes. | Native gfx1151 passed 48/48 cases both before and after; this package emits only a native gfx1151 target. The unreviewed static per-device cache also deserves concurrency review. Track it only if the package ever switches to a generic gfx11 target. |
| [#28346: dynamic draft/mmproj weight swapping](https://github.com/ggml-org/llama.cpp/pull/28346) | Tries to evict draft weights and temporarily move multimodal projector weights into GPU buffers to create discrete-VRAM headroom. | The CUDA-centric draft changes 14 files by roughly +671/-18, repoints live tensor buffers, leaves audio untested, and expands lifetime/concurrency/`--fit` risk. Strix Halo has UMA rather than separate VRAM, so the central trade has no demonstrated benefit here. |
| [#28351: MTP importance-matrix conversion](https://github.com/ggml-org/llama.cpp/pull/28351) | Includes a teacher-forced study of 151K held-out tokens on Qwen3.8-27B: calibrating the MTP head improves draft/trunk agreement by about 0.0014–0.0017 at Q4, while Q6_K nearly matches BF16. It adds tooling to collect head statistics and compare draft agreement. | The six-commit draft remains unreviewed; its latest commit expands the notes, not Q8_0 evidence. The study did not measure Q8_0, Qwen4-Exp, live multi-step acceptance, or gfx1151 throughput, so it does not justify replacing the recommended sidecar. Revisit if lower-bit heads become a supported recommendation. |
| [#28003: RDNA3 MMVQ single-token fast path](https://github.com/ggml-org/llama.cpp/pull/28003) | Reports about 9.1% lower Q4_K GEMV time on gfx1100/RX 7900. | It is an unreviewed draft demonstrated on gfx1100 and Q4_K, not gfx1151 with the recommended UD-IQ4_XS mix. Architecture-specific kernel changes need direct validation. |
| [Inherited #28013: improve CUDA/HIP `IM2COL` access](https://github.com/ggml-org/llama.cpp/pull/28013) | The reviewed adjacent-channel access change merged as `83078fe`, with MI100 correctness and gfx908/gfx1100 performance evidence; posted shapes include both gains and regressions. | Inherit normally without a duplicate hot-kernel carry. No gfx1151 end-to-end Qwen3.8 vision speedup is established; retain numerical and visual controls rather than generalizing microbenchmarks. |
| [Reverted #24546](https://github.com/ggml-org/llama.cpp/pull/24546) / [merged successor #28552](https://github.com/ggml-org/llama.cpp/pull/28552) | The reviewed successor fixes expert-width accounting and moves selection logic to the host. It is now merged and inherited in b10884. | The selection condition still explicitly admits RDNA3.0 and RDNA4, not RDNA3.5. This does not supply a gfx1151 speedup. No duplicate patch is needed; retain the original revert as history, not as evidence that the reviewed successor remains absent. |
| [#27962: HIP IQ2/IQ3 SWAR intrinsics](https://github.com/ggml-org/llama.cpp/pull/27962) | Replaces the fallback `__vsub4` sequence with smaller SWAR code and reports Qwen3.8 IQ3_S decode rising from 27.11 to 32.97 t/s on gfx1201. | A HIP reviewer now approves and clarifies that saturating subtraction was not actually a correctness bug; the benefit is smaller generated code. These intrinsics serve IQ2/IQ3 only, so they do not affect the recommended UD-IQ4_XS target or Q8_0 draft, and there is no gfx1151 result. Revisit if IQ3 becomes a recommendation or it merges. |
| [Closed #27936: narrower hipCUB SUM/MEAN path](https://github.com/ggml-org/llama.cpp/pull/27936) | Reports 8.8x and 10.4x gfx1151 reduction microbench gains and is a subset of the broad hipCUB work. It closed September 7 as a duplicate of #26592. | The package already carries equivalent reduction routing through #26592, so this adds no patch. Preserve the provenance; do not wait for a now-closed duplicate to merge or apply both implementations. |
| [#28129: batch CCCL `DeviceTopK` calls](https://github.com/ggml-org/llama.cpp/pull/28129) | Routes prompt-sized batches to row-parallel argsort instead of serial per-row `DeviceTopK`; dual-A6000 Qwen3.8 prefill improved about 20–27% at 31K–130K. | The author self-closed it without technical review shortly after automated contribution-policy warnings; the same work remains bundled in [Unsloth #165](https://github.com/unslothai/llama.cpp/pull/165). The tested rocPRIM 4.7 / hipCUB 4.7 stack has no CCCL 3.2 `DeviceTopK`, so this package already compiles the argsort-and-copy branch and the patch is currently a no-op. Revisit an owned successor when a future ROCm stack exposes `DeviceTopK`. |
| [#27196: speculative logprobs correctness](https://github.com/ggml-org/llama.cpp/pull/27196) | Aligns speculative-server logprobs with the actually accepted target tokens. | It matters only when clients consume logprobs, remains unmerged, and has no MTP/gfx1151 validation. Track it as API correctness work rather than a performance patch. |
| [#28131: closed `gguf-py` array-count hardening](https://github.com/ggml-org/llama.cpp/pull/28131) | Bounds declared GGUF array counts by the minimum encoded element size, turning a demonstrated 5.2 MiB malicious-file CPU parse from roughly 17 seconds into sub-millisecond rejection. | It was closed unmerged for the project's AI-submission policy, not technically disproven. It affects Python conversion/inspection tooling rather than installed native inference; retain the threat model, treat untrusted GGUFs as hostile, and await an eligible upstream implementation. |
| [#25557: symmetric Q8_0 conversion range](https://github.com/ggml-org/llama.cpp/pull/25557) | Changes Python/CPU Q8_0 creation from an asymmetric endpoint to `-128..127`; small-model tests report lower perplexity error while KLD is nearly unchanged. It could improve a future locally regenerated Q8_0 MTP sidecar. | The GGUF format and dequantization are unchanged, and the published drluoto sidecar bytes are unaffected. The functional commit remains unapproved and has no MTP acceptance measurement; the latest PR activity is only a master merge. Watch conversion quality rather than patching inference now. |
| [Closed #28223: honor explicit host placement under mmap](https://github.com/ggml-org/llama.cpp/pull/28223) | Lets an explicit CUDA-host tensor override win under mmap; dual-3090 PLE prefill reportedly rose from 166 to 330–379 t/s. The second-commit load measurement is 168 seconds versus the 96-second baseline, improving the older 488-second result. | Closed unmerged to free the author's single-PR allowance for #28671, not technically rejected or approved. The test still pins about 89.6 GiB. An analogous HIP-host compute choice would conflict with the inherited HIP host-compute exclusion; no validated single-APU memory-policy improvement justifies importing it. |
| [Issue #28158 / rejected #28206: out-of-range speculative token](https://github.com/ggml-org/llama.cpp/issues/28158) | A gfx1150 Vulkan Qwen3.8 run emitted token ID exactly equal to vocabulary size and returned HTTP 500. | The failure is real but not yet reproduced for Qwen4-Exp on HIP. [#28206](https://github.com/ggml-org/llama.cpp/pull/28206) was a prohibited automated submission, rewrote unrelated converter infrastructure, added a 2,726-line backup file, and was closed; it is not a credible fix. Track an owned minimal patch and add token-boundary stress tests. |
| [#28389: CUB argsort key-aliasing fix](https://github.com/ggml-org/llama.cpp/pull/28389) | ORippler now confirms that overlapping key buffers violate CUB's `Device*Sort` contract, while requesting formatting/comment cleanup on the unchanged `5b898c2` head. There is no final approval. | The contract concern is real even when a reproducer fails, but this package uses hipCUB/rocPRIM: ordinary radix explicitly handles aliasing, while all segmented paths remain unproven. Require matching HIP/graph tests and scratch/performance review before adding full-row buffers; do not claim either universal HIP corruption or universal safety. |
| [#28383: MMQ tail-read bounds hardening](https://github.com/ggml-org/llama.cpp/pull/28383) | Clamps activation/expert-ID tail reads and adjusts padding in shared CUDA/HIP quantized matrix kernels. The author reports previously crashing cases fixed and thousands of backend cases passing on RTX 4090/5090. | The four-commit head was rebased to `bb3c275` on September 7, without new approval or HIP results. It changes hot kernels and allocation padding; require an isolated gfx1151 correctness/performance comparison before carrying the aggregate change. |
| [Closed #28366](https://github.com/ggml-org/llama.cpp/pull/28366) / [#28671: radix TOP_K for older CUDA](https://github.com/ggml-org/llama.cpp/pull/28671) | The new owned `ff2b436` successor adds a measured native fallback for CUDA without CCCL 3.2, after #28366 closed unmerged and its source repository was deleted. | It explicitly leaves HIP unchanged. No additional package benefit; keep this provenance while following the separate #28313 native HIP rewrite. Neither proposal makes the existing HIP `TOP_K` operation depend on ROCm exposing `DeviceTopK`. |
| [Draft #28398: HIP Q1_0 unpack optimization](https://github.com/ggml-org/llama.cpp/pull/28398) | A gfx1201 Q1_0 workload reports decode rising from 29.4 to 61.7 t/s with arithmetic sign expansion and hardware byte permutation. | The unchanged `d576c95` head remains draft, without approval or gfx1151 results. It does not affect the recommended IQ4_XS target or Q8_0 draft. The headline gain is specific to Q1_0 on gfx1201. |
| [#25940: RDNA4 matrix multiplication](https://github.com/ggml-org/llama.cpp/pull/25940) / [draft #27641: real-model backend shapes](https://github.com/ggml-org/llama.cpp/pull/27641) | #25940 is now ready for review at `2ba97e5`; its small series includes shared unrolling and float-cast changes as well as RDNA4 dispatch. #27641 expands realistic backend test coverage. | No independent gfx1151 validation or approval for the tuning, so its title is not enough to dismiss shared-kernel risk or establish a Strix benefit. The test-only draft is useful validation material, not a runtime performance patch. |
| [#28432: MoE fusion allocation dependencies](https://github.com/ggml-org/llama.cpp/pull/28432) | Adds lifetime dependencies so shared CUDA/HIP top-k MoE fusion can match more graphs. IMbackK self-assigned the unchanged head after a September 11 review request. | Assignment is not approval or hardware validation. It may increase compute-buffer allocation and has no posted correctness/performance results. Require gfx1151 tests before changing lifetimes; this fusion is distinct from the generic QSA `TOP_K` operation. |
| [Merged #28390: single-device draft Meta wrapper](https://github.com/ggml-org/llama.cpp/pull/28390) | Avoids an unnecessary Meta backend for a single-device drafter inheriting target tensor splitting; unspecified draft devices follow the target device selection. | Approved and inherited in b10872. No extra patch or profile change is needed for one Strix Halo GPU. |
| [#28391: n-gram speculation enabled by default](https://github.com/ggml-org/llama.cpp/pull/28391) | Makes `ngram-mod` a default and changes `--spec-type` to add algorithms instead of replacing the list. | Maintainers raise hybrid rollback costs and cases where MTP alone wins. It would silently add n-gram work to documented pure `draft-mtp` commands. Keep explicit algorithm selection while the unreviewed draft is discussed. |
| [#28378: draft-KV quantization memory warning](https://github.com/ggml-org/llama.cpp/pull/28378) | Documents that smaller draft KV can be outweighed by larger compute buffers: one CUDA Qwen3.8-27B case used about 138 MiB more overall after draft-cache quantization. | The documentation draft has one approval, but contains no inference fix. Apply the measurement lesson locally: compare total memory before adding `-ctkd`/`-ctvd`; savings in cache size alone are insufficient. This is not a universal regression across draft architectures. |
| [#28414: host expert prefetch](https://github.com/ggml-org/llama.cpp/pull/28414) | Attempts to overlap host expert uploads; an independent multi-GPU run produced repeated `/`, and the author now acknowledges the multi-GPU implementation does not work. A reviewer asks for a mmap baseline before reviewing. | Still a draft with no demonstrated fix or HIP evidence. Successful allocation can expose the wrong-output path that allocation failure hides. This is expert staging, not SSD-PLE row prefetch; do not carry. |
| [#28392 / #28413: FP8 KV cache and CUDA implementation](https://github.com/ggml-org/llama.cpp/pull/28392) | Introduces OCP FP8 caches and optional static scales, with [CUDA kernels in #28413](https://github.com/ggml-org/llama.cpp/pull/28413). | Both are unreviewed drafts with additional format dependencies, Blackwell-only measurements, and reported decode regressions against another FP8 route. No HIP/gfx1151 validation justifies changing the documented cache types. |
| [#28371: grammar memoization](https://github.com/ggml-org/llama.cpp/pull/28371) | Reports eliminating a severe ambiguous-grammar stall while keeping ordinary grammar benchmarks neutral. It could improve structured-output latency and availability. | The unreviewed implementation has recently changed cache lifetime and retains entries for a whole request. Require ownership/memory-growth review and stable regression coverage before importing a new core grammar cache. |
| [#28405 / #28406 and UI discovery follow-ups](https://github.com/ggml-org/llama.cpp/pull/28405) | Refreshed sidecar/deletion code and [#28406](https://github.com/ggml-org/llama.cpp/pull/28406)'s downloader-thread join changes have new automated findings about matching, test coverage and disk work under the mutex. [#28407](https://github.com/ggml-org/llama.cpp/pull/28407)'s optional sanitized HTML cache omits its rendering-mode flag. | Still no human approval; keep the expanded deletion/lifetime/rendering policy out. Automated findings need confirmation and resolution, not treatment as proven exploits. Explicit `hf download` commands suffice; follow the split series rather than importing the superseded #28374 umbrella. |
| [Issue #28438 / #28523: NumPy 1.x conversion corruption](https://github.com/ggml-org/llama.cpp/pull/28523) | Reports sign corruption in large Q8_0/TQ1_0/TQ2_0 conversions from affected NumPy 1.x builds. The reporter now confirms NumPy 2.2.6 fixes the conversion. | Use NumPy 2 for local conversion; current Arch already provides it, so no unreviewed quantizer workaround is carried. This does not establish corruption in the pinned sidecar or change native inference. |
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
| [Issue #28580: video prefix-cache identity](https://github.com/ggml-org/llama.cpp/issues/28580) | Reports different videos with identical textual instructions reusing the first video's visual prefix because decoded frames have empty media identities. Unique text and still-image controls did not reproduce. | Fixed by merged #28601, inherited in b10884 as recorded above. Check responses against the actual clip when upgrading; this media-identity fix does not prove general MTP state isolation. |
| [Issue #28497: CUDA QSA tied `TOP_K`](https://github.com/ggml-org/llama.cpp/issues/28497) | Reports CCCL `DeviceTopK` choosing different boundary cells among tied QSA scores across greedy requests; CUDA stable-radix comparisons restore repeatability. | This is a CUDA/CCCL path, not the tested HIP hipCUB argsort-and-copy implementation. No reviewed fix is available. Retain tie/order checks after library changes without adopting an unreviewed score perturbation or claiming current HIP output is affected. |
| [Issue #28513: backend sampler capability probe](https://github.com/ggml-org/llama.cpp/issues/28513) | Reports that a very wide capability probe rejects a sampler whose actual post-`TOP_K` input is small, and that the public setter can report success after backend initialization fails. | There is no owned reviewed fix. Current hipCUB already provides the wide argsort route, so do not apply a hard-coded probe-size workaround. Track API result handling and actual-shape validation. |
| [#28532: slot-linger scheduling](https://github.com/ggml-org/llama.cpp/pull/28532) | The new `acd94f3` revision replaces earlier logic with per-slot deadlines and prioritizes bound tasks, allowing tiny prompts to bypass the delay. It deliberately holds released slots for quick client follow-ups; earlier Intel Arc synthetic tests reported aggregate gains. | No human approval or HIP result; FIFO fairness/starvation still needs validation. It could affect a one-slot server with several queued clients, so single-slot mode is not categorically irrelevant. It has no demonstrated benefit for the documented single-client MTP profile. |
| [Issue #25618 / draft #28488: batch invariance](https://github.com/ggml-org/llama.cpp/pull/28488) | Adds tests exposing Vulkan output differences across batch shapes; a separate CUDA greedy comparison differs only near equivalent token choices. | This is test work, not a runtime fix or HIP validation. Use it to guide batch/prefix-cache comparisons; divergence alone does not establish corruption without checking logits and output coherence. Related CUDA cache reports #28524/#28526/#28527 have no reviewed fix or demonstrated gfx1151 impact. |

The carried-patch table is the source of truth for changes that crossed the
inclusion threshold. Approved and merged #28023, #28123, and the complete
#27941 series are inherited by the current base, so they add no package patch or separate
remote source. The same is now true of #28040, #28030, #28159 plus #28173,
#28183, #25952, #27483, #28323, and now #28270's Web UI build hardening and
#28271's backend-search robustness. Approved #27200 remains a checksum-pinned
patch. b10853 also inherits #27870's F16 Flash Attention barrier correction,
#28387's scheduler input-limit removal, and #28068's GDN normalization fix;
their separate package patches are removed. The September 10 sync added
#28195's gfx1151 MMQ configurations and #28102's AMD WMMA FA dispatch.
b10909 inherited #28102 and #28330, removing their duplicate patches.
That sync added #24759's GGUF padding guard, then-post-tag #28739's empty
expert-ID guard, #28749's native-rollback initialization shortcut and
#28646's UI polling fix. b10920 now inherits #28739 too, updates #28646's
panel-recovery behavior, and adds the narrow current carries listed above.
b10938 additionally inherits #28747, #28787, #28530, #28795, #28802,
#28816, #28817, #28736 and #28742. The former two duplicate carries are
removed; the new local schema numeric guard addresses the reproduced
unchecked conversions without redesigning the inherited schema stack.
b10951 additionally inherits #28779 and #28749, so their duplicate carries
are removed. It also inherits [#26885's grammar stack optimization](https://github.com/ggml-org/llama.cpp/pull/26885):
one set lookup and fewer intermediate copies, approved by two human reviewers,
with an independent approximately 1.2× JSON-grammar result. This is specific
grammar-engine work, not an overall inference-speed claim or a fix for the
separate extreme-integer grammar-builder defect.
b10975 additionally inherits #28882, #28646, #28865/#28868, #28896 and
upstream's complete PCH removal. The former CPU/UI carries are redundant.
The local gfx1151 D=256 fallback is removed after its motivating corruption
attribution was withdrawn; reviewed upstream FA dispatch is restored.
#28549's separate MTP graph-cache identities remained carried at b10975;
b11012 now inherits its reviewed generic output/no-output arenas and
#28869's reasoning newline, removing both duplicate patches. It also inherits
#28901's fused Qwen HC operations, #28935's RDNA3.5 tile eligibility, #28013's
IM2COL access changes and #24292's RPC cache-lifetime repair.
#28333's fresh-sequence MTP reset remains carried. The RPC
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
their merged equivalents. #24546 was merged and then reverted; b10884 now
inherits reviewed successor #28552, whose dispatch still excludes RDNA3.5.
The current base also inherits #28079's rejection of unsupported IQ4_NL KV,
#28601's video-cache identity fix, and #28334's removal of deprecated load-mode
aliases. IQ4_NL previously appeared accepted while falling back to F16; the
documented F16/Q8_0 cache choices remain unchanged. b10909 additionally inherits
the reviewed #28587/#28715 image/speculation fixes and #28630's generic
MTP-only KV filter; the latter adds no new Qwen4-Exp memory saving.

For historical clarity, [#27928](https://github.com/ggml-org/llama.cpp/pull/27928)
closed in favor of #28055, and [#27974](https://github.com/ggml-org/llama.cpp/pull/27974)
and [#27874](https://github.com/ggml-org/llama.cpp/pull/27874) are narrower or
closed hipCUB approaches already superseded by the broader
[#26592](https://github.com/ggml-org/llama.cpp/pull/26592).

The September 17 review selects **b11012** (`35822af`), 20 upstream commits
beyond b10992, against live **b11010-1**. The overlapping activity inventory
contains **168** upstream entries since September 16 at 06:00 UTC, including
**38** previously tracked references. All **423** previous distinct PR/issue
URLs are preserved. All **34** existing fork PRs were refreshed across
**123** public pages; new Unsloth #217/#218 and the referenced model-load
issue were read too. Changed tracked upstream threads, deferred reviews and
timeline pagination were checked, with a final coverage-gap pass. Hidden,
deleted or sign-in-only content remains unavailable.

This is a meaningful update, not only a tag bump: reviewed HC fusion and
gfx1151 MoE dispatch tuning are now upstream, the MTP graph arenas and Qwen
reasoning newline no longer require separate patches, and the inherited RPC
graph-buffer lifetime fix closes a reported use-after-free path. The local
MTP head is adapted to the fused HC graph while retaining dtype/reshape
compatibility. There is still no new reviewed SSD-PLE reader, no supported
multi-slot MTP mode, and no reason from these code changes to download the
same compatible weights again.

The direct-PLE evidence is mixed rather than universally positive; probabilistic
MTP's new quality measurements also depend on model and exclusions. The UMA
ring was parked and the batched-WMMA design explicitly declined, while the
owned router authentication proposal still deliberately removes the child-key
boundary. These outcomes are reflected above instead of presenting old
“awaiting review” descriptions as current. Post-tag DeepSeek delimiters and
embedded-GGUF alignment are recorded for normal future inheritance, without
restarting this review for unrelated tags.

The commit-only fork check also finds EngramHalo unchanged at `1517658`
(prefetch `8eb931b`, excluded drop-behind `d87bc9e`) and FR-Spec unchanged at
`fb367b8`. Patt92 now inherits the same upstream HC fusion instead of keeping
its custom Qwen HC operators, but still carries the separate graph-ring,
RPC-slot and direct-host-compute policies that this package does not adopt.

For historical context, the September 16 review selected `b10992` (`e13469a`), 17 upstream commits
beyond b10975, against the live b10991 base package. The overlapping activity
snapshot contains **214** upstream entries since September 15 at 06:00 UTC;
**34** were previously tracked. All **398** prior distinct PR/issue URLs remain
documented. All **32** tracked fork PRs plus new Unsloth #216 and Halo #26 were
refreshed across **123** public HTML pages, including timeline pagination and
deferred reviews. The server scan adds 35 thread checks across 48 pages; the
irrelevant closed wrong-target aggregate #24252 now returns 404, and no package
decision depends on it. Five final coverage-gap checks add eight public pages;
the previously rejected 470-commit aggregate #28359 also now returns 404, so
its prior exclusion is retained without claiming to read inaccessible content.
Critical MTP/PLE API comment-since controls found no new
comments on #27836, #27742 or #28136. Hidden, deleted or sign-in-only content
cannot be reviewed.

The main inherited changes are RPC protocol 7/weights-only cache hashing,
exactly-two-device local HIP AllReduce, stride-correct shared GPU reductions
and benchmark build-version reporting. Existing MTP/PLE algorithms, sidecar
requirements and upstream D=256 FA selection remain unchanged. The local RPC
test wire format follows protocol 7 without weakening its production guards.
There is **no new SSD-PLE implementation progress**: the direct reader still
needs post-refactor review and a clean current-gfx1151 comparison with this
package's prefetch.

The review picture nevertheless moved: probabilistic MTP gained a post-RNG-fix
approval, and batched RDNA3.5 WMMA now has useful ablations and is review-ready.
Neither yet has the package-profile evidence needed for inclusion. New masked
FA tile skipping is promising but has a maintainer design objection. The owned
router authentication fix is approved and tested, but deliberately drops the
file-key child boundary; it is not silently adopted. New scheduler growth and
cooperative softmax proposals have source-level problems recorded above.
Cancellation-related single-slot MTP hangs and caller-provided M-RoPE position
overreads remain explicit limitations, not claims of malware or newly fixed
GPU behavior. No additional unmerged carry met the inclusion threshold.

For historical context, the September 15 review selected `b10975` (`4c9233c`), 24 upstream commits
beyond b10951. The overlapping activity snapshot contains **178** upstream
entries since September 14 at 06:00 UTC. All **366** previous distinct
PR/issue URLs remain in this README; **44** previously tracked upstream
threads had activity in that window and were assigned fresh public
discussion/review checks. All **30** previously tracked fork PRs were
refreshed across **118** public HTML pages, including hidden-middle timelines
and deferred inline reviews, and two newly linked fork/lab PRs were read.
Unsloth's activity query was empty. Public embedded issue comments and the
two longer server histories were checked with API pagination; hidden,
deleted or sign-in-only content remains outside the review.

The substantive new source changes are reviewed Qwen HC/PLE norm-scale
fusion inherited from upstream, the necessary exact MTP/mixed-F16 rebase,
the approved reasoning-budget newline carry and narrow automatic M-RoPE
position hardening. The updated Patt92 fork explicitly retracts its FA blame:
truncated RPC cache files caused the reported corruption. Its new graph ring
then required two lifetime repairs, reinforcing why that broader scheduler/RPC
stack is not imported. EngramHalo and the direct SSD-PLE reader remain
unchanged; the latter still lacks a post-refactor review and a clean comparison
against this package's prefetch.

Fresh promising leads include the owned one-line gfx1151 MoE tile heuristic,
larger HC fusion and smaller argsort scratch, with their limitations recorded
above. New independent projector sleep/resume evidence strengthens #28233,
but the documented profile does not enable sleep. The new RPC cache revision
resolves its hidden pending-state objection, not its partial-file safety.
New stream/metrics proposals introduce correctness or authorization-policy
concerns and stay out. The router remains restricted to serialized requests;
model-count limits do not replace admission control.

For historical context, the September 14 review selected `b10951` (`093a2f8`), 13 upstream commits
beyond b10938, against the live b10950 base recipe. The overlapping snapshot
contains **151** upstream entries since September 13 at 06:00 UTC. The prior
README's **324** distinct PR/issue URLs were inventoried: all **25** changed
tracked upstream threads were assigned fresh public discussion/review checks,
and all **30** tracked fork PRs were reread across **118** public HTML pages,
including timeline pagination and deferred inline reviews. React issue
comments were also extracted from their public embedded JSON or paginated
API responses; unavailable/deleted/sign-in-only content remains outside the
audit. The Unsloth activity query was empty; #137 nevertheless gained an
external fork commit-reference, not a new code review or test result.

The meaningful runtime changes inherited from upstream are the already-carried
Nemotron divisor guard and native rollback initialization shortcut, plus the
grammar stack optimization. The recovered GGUF padding proposal now answers
the maintainer's duplicate-assertion and regression-test feedback, so its
complete immutable diff replaces the earlier pin. EngramHalo's prefetch and
drop-behind code and Patt92's broad graph/HC stack are unchanged; no new fork
performance carry is justified.

The strongest new performance leads are scheduler retention, partial draft-KV
checkpoint serialization and deterministic large-row `TOP_K`. Their posted
evidence is NVIDIA-only and the first two remain drafts; none warrants changing
the single-APU MTP defaults yet. The causal-attention proposal now addresses
the Qwen bias-shape objection, but has no review of that final revision.
Crucially, a reported upstream HIP batch-scoring regression was withdrawn and
bisected to an unreviewed private GDN fusion; this is why matching width-one,
batched, image and dirty-state controls matter alongside perplexity.

Server compatibility proposals stay separate from inference tuning. The API-key
forwarding proposal still leaks raw child arguments, and the new query-only URL
proposal still fails a real root-route request without an explicit slash. New
Responses image conversion and reasoning-budget cache work need final review
and focused regressions; neither proves that internal MCP media conversion or
the Windows stdio pipe hang is fixed. All prior watchlist links remain.

For historical context, the September 13 review selected `b10938` (`f1e44dc`), 18 upstream commits
beyond b10920. The overlapping snapshot has 181 upstream entries and one
Unsloth entry since September 12 at 06:00 UTC. The prior README's **296**
distinct PR/issue URLs were inventoried: all **34** changed tracked upstream
threads and all **30** tracked fork PRs have fresh public discussion/review
checks, including pagination and inline threads. Publicly unavailable or
moderated content remains outside the review. All prior PR/issue links remain.

The router log-framing and cpp-httplib carries are now inherited, alongside
approved download-capacity, UI cache and schema/Qwen parser changes. Final
schema approval did not remove its numeric narrowing hazards: bounded local
sanitizer tests reproduced them, and a reviewed local range guard now fails
cleanly before conversion or exclusive-bound overflow. The unrelated router
API-key proposal remains excluded because its raw argument display/logging
would expose keys. Serial switching improves in a reported b10936 control;
concurrent admission and shared-cache downloads still need separate fixes.

EngramHalo rebased again: [prefetch `8eb931b`](https://github.com/Aristo94/EngramHalo.cpp/commit/8eb931ba36f54cb2c9bc6cd2259bf82b67bac31c)
and [drop-behind `d87bc9e`](https://github.com/Aristo94/EngramHalo.cpp/commit/d87bc9e2562914a95987e0be8db5eb1fa3ea8e02)
have the same stable patch IDs as the prior `f20885f`/`c1bbccf` revisions.
Our immutable prefetch pin plus shim stays unchanged, and the unsafe
alias-lifetime cleanup remains rejected. GenerelSchwerz #86 still has no new
review or package-baseline A/B. The only new tracked Unsloth comment offers
future M3 Max testing of #152, without results. Patt92's new graph/HC stack
adds potentially useful leads but broadens public ops, lifetimes and RPC;
its unsafe-host-compute parent still prevents an isolated package conclusion.

No new MTP/PLE performance patch crosses the inclusion threshold. Sparse
Qwen FA now has a human approval but still lacks a HIP path; the pooled-QSA
image failure remains. The separate HIP padding-stream carry gains IMbackK's
approval. New regression reports retain their actual hardware/compiler and
model scope rather than being treated as fixes for this package.

For historical context, the September 12 review selected `b10920` (`eafe15a`), 11 upstream commits
beyond b10909. The overlapping updated-issue snapshot contains 192 upstream
entries and no Unsloth entries since September 11 at 06:00 UTC. The prior
README's 272 distinct PR/issue URLs were inventoried: all 38 changed upstream
references have fresh saved public discussions, and all 30 tracked fork PRs
were checked with public timeline/review pagination. The other tracked
upstream entries had no activity in that snapshot. Hidden/deleted or
sign-in-only content remains unavailable; timestamps and bot reviews are
not human approvals. Old links are retained even when the proposal closed.

The meaningful changes are the HTTP transport fixes, router subprocess and
colored-state handling, recoverable tools-panel probing, HIP padding-stream
fix, Nemotron MTPv2 support and malformed-metadata guard. The gfx1151 D=256
WMMA fallback is a conservative response to an unisolated multi-image report,
not a benchmarked improvement. Relevant CPU/UI/local-transport tests are
recorded in the current audit; no GPU correctness or throughput claim follows
from compilation alone.

SSD-PLE still has no newly safe direct-reader or pooled-cache carry.
GenerelSchwerz #86 is unchanged and deserves a controlled comparison with our
prefetch, not blind stacking. EngramHalo's September 11 b10909 rebase rewrites
the prefetch commit as
[`f20885f`](https://github.com/Aristo94/EngramHalo.cpp/commit/f20885f2cd037a7e9dd8e20b5c819eb4451a82d1),
but changes only loader-API context already covered by our pin plus shim.
Its drop-behind rewrite
[`c1bbccf`](https://github.com/Aristo94/EngramHalo.cpp/commit/c1bbccfd84ebb94c2b31e4758406618f7a685763)
does not fix the previously reproduced alias-lifetime failure and remains
excluded. Its new Ubuntu/ROCm/XNACK lazy-hang report is unisolated, not a
reproduction with this package. FR-Spec stays at `fb367b8`, without new HIP
validation. All tracked Unsloth PR heads/discussions are unchanged.

Probabilistic MTP now fixes the reported seed/reset problems, but needs
post-fix human review and Strix validation. Batched gather now has a genuinely
selective equivalence fixture; image/dirty-state and safe-parent evidence are
still missing. The schema stack repairs its earlier reference-visit bug but
retains unchecked numeric conversions. #28762 closed after the inherited
router refactor; the distinct capacity races and optional RPC disk-cache
problem remain watched. These are substantive changes in the evidence, not
grounds for importing every promising aggregate.

For historical context, the September 11 review selected `b10909` (`a2878d3`), 25 upstream commits
beyond b10884. Its overlapping updated-issue snapshot contains 248 upstream
entries and six Unsloth entries since September 10 at 06:00 UTC. All previously
tracked fork PRs were checked, including paginated conversations, deferred
review bodies and inline threads; new GPU, MTP, PLE, loader, server and UI
proposals were screened. Hidden/deleted or sign-in-only comments remain
unavailable. A change in timestamp or an automated review is not human approval.

At that review the meaningful post-tag empty-expert guard was included without
chasing every subsequent tag. The retained MTP/hipCUB/PLE algorithms and
recommended sidecar were unchanged. SSD-PLE had a promising **smaller requested-page-prefetch
alternative**, but #28136 still lacks post-refactor approval and neither
alternative has a current gfx1151 A/B against our carried prefetch. The new
batched-gather and pooled-key proposals show useful performance leads, while
vision coverage and unsafe fork defaults still prevent inclusion. Native
ROCm TOP_K work remains unreviewed; the newer CUDA-titled #28713 would also
change our hipCUB route, so its NVIDIA results do not justify applying it.

New Unsloth [#213](https://github.com/unslothai/llama.cpp/pull/213) only repairs
an arm64 Vulkan build; [#214](https://github.com/unslothai/llama.cpp/pull/214)
copies an existing Qwen4-Exp reshape pattern into GLM5-Next, while
[#215](https://github.com/unslothai/llama.cpp/pull/215) closed as a wrong-base
aggregate. The preemption series fixes several earlier objections, but still
has no independent one-APU MTP correctness/performance evidence. New approved
schema work was a dependent, broader stack with unresolved review findings;
the router shutdown follow-up still needed latest-head review then. Their
September 12 outcomes are recorded above.

For historical context, the September 10 review selected `b10884`. Its updated-issue search snapshot
contained 151 upstream entries and 16 Unsloth entries since September 9 at
07:00 UTC, overlapping the prior review. Changed tracked discussions were read
through paginated public timelines, review bodies, and inline threads; new
server, vision, loader, MTP, HIP, RPC, and fork proposals were screened.
Hidden/deleted or sign-in-only moderated comments remain inaccessible. A new
timestamp or automated review is not itself a source change or human approval.

In that review, two new carries met the inclusion threshold: #28195 and #28102,
both with independent gfx1151 evidence and the workload limits recorded above.
Existing MTP, hipCUB, and PLE functional pins do not gain new algorithm changes.
EngramHalo's September 9 `b10884` rebase changes prefetch patch context rather
than its implementation; a new hash alone is not a new performance improvement.
Direct-read SSD-PLE #28136 still has no post-refactor approval or current
gfx1151 HIP A/B against this package. Rejection-sampling #27694 has meaningful
correctness fixes, but the independent RNG-correlation concern was unresolved
at that review (addressed September 12, still awaiting reapproval). The
vocabulary-trimmed FR-Spec branch remains unchanged and is not
enabled. None of the broad new Unsloth scheduler/RPC/preemption stacks meets
the one-APU safety/evidence threshold. New Unsloth
[#209](https://github.com/unslothai/llama.cpp/pull/209) and
[#212](https://github.com/unslothai/llama.cpp/pull/212) refresh Inkling/GLM5-Next
pins and compatibility; they do not add a native Qwen3.8 improvement. The
reported 48-tool limit in [#28522](https://github.com/ggml-org/llama.cpp/issues/28522)
was retracted after repairing the reporter's schema extraction, so it does not
justify another parser patch.

For historical context, the September 9 review selected `b10872`: 19 upstream commits, 62 changed files,
3,565 additions and 2,582 removals since b10853. The public updated-issue search
snapshot contained 214 entries since September 8; new candidates through #28631
were screened, alongside 26 recently updated Unsloth entries. Changed tracked
discussions were read using paginated public timelines, review bodies and inline
threads, with an overlapping September 8 cutoff. Forks were checked separately;
hidden/deleted or sign-in-only moderated comments remain inaccessible. Changes
in a PR's timestamp alone are not treated as new code or approval.

In that September 9 review, no new unmerged carry met the inclusion threshold. Existing #28549, #27836,
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

The previous assessment of #28102 as unfinished gfx1201-only work is obsolete:
its revised, approved AMD WMMA path now applies to gfx1151 and is inherited with
the limits above. #28181 is ppc64le-only; #28227/#28228/#28235/#28236/#28240 are disabled-backend
or cleanup work; and #28238 changes only Q4_1/Q5_1 conversion, not the Q8_0 MTP
sidecar. #28229 improves benchmark error visibility but does not change
inference. New #28218 reports a Windows/CUDA tensor-split speculative slowdown
with no HIP cause or patch, while #28241 is an old Turing CUDA CPU-MoE crash;
neither matches the documented single-device Strix Halo path. The relevant
#28232, #28233, #28242, #28243, #28265, #28302, #28303, #28305, #28313,
#28326, #28339, #28346, #28351, and #28358 candidates are retained in the
watchlist, while #28231, #28323 and #28330 are inherited and #28333 is carried.
WIP [#28267](https://github.com/ggml-org/llama.cpp/pull/28267) overlays a Q8 KV
allocation with F16 until the F16 view fills. Its newer four-commit head fixes
state restore, converts only the cache needing expansion, and supports
standalone Gemma4. Conversion still stages through host memory, with a
temporary RAM spike and pause; this remains unreviewed KV-cache work, not
SSD-backed PLE, and is excluded. Its author now plans the separately watched
#28498 rotation-format prerequisite. Issue
[#28299](https://github.com/ggml-org/llama.cpp/issues/28299) concerns Web UI
`/tools` polling receiving 403 responses and potentially triggering fail2ban;
the reviewed #28646 fix was carried then and is now inherited in b10975.
No current llama.cpp PR adapts this route to rocPRIM 4.6's native top-k API.
The carried hipCUB integration compiles full GPU argsort plus truncation when
CCCL 3.2 `DeviceTopK` is unavailable, as in the tested nightly; the graph's
`TOP_K` operation does not require that library API. #28313 proposes specialized
llama.cpp-owned HIP kernels, while closed #28366 and new successor #28671
change only the older-CUDA fallback.

The same scan found that #28244 and its one-line sparse-FA successor #28349
both closed unmerged; now-inherited #28334 only removes deprecated load-mode
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

- Remotely sourced functional patches are snapshots. Recheck their
  upstream PRs and fork commits when updating the llama.cpp tag; remove a
  package patch once an equivalent fix is upstream. Revalidate all local
  adaptations against the exact new base rather than allowing fuzzy patching.
- The reviewed #28195/#28102 tuning changes are not universal speedups or
  proof of end-to-end Flash-Next MTP performance. Test actual verification
  shapes and both F16/Q8_0 KV after ROCm upgrades; #28102 changes arithmetic
  reduction order and can change transient scratch allocation. This revision
  keeps upstream gfx1151 D=256 selection restored in b10975 after the reporter
  withdrew its corruption attribution. Separate gfx1201 reports are not
  thereby disproved; GPU numerical and dirty-cache testing remains necessary.
- The M-RoPE guard only repairs internally generated positions when `pos`
  is null. Embedding batches that provide a position pointer must still supply
  every position section; the public `llama_batch_init` allocation/API concern
  discussed in #28910 remains unresolved. A new independent Linux CPU
  [reproduction](https://github.com/ggml-org/llama.cpp/issues/28963#issuecomment-5691833641)
  confirms out-of-bounds reads and occasional changed argmax with `pos[N]`;
  providing all four initialized sections (`pos[4*N]`) resolves that case.
  Ordinary mtmd builds its own arrays;
  this is not a claim that its normal vision path was fixed by this patch.
- Inherited Web UI issue [#25790](https://github.com/ggml-org/llama.cpp/issues/25790)
  is still present despite automatic stale closure: `?q=` links submit prompts
  automatically. An authenticated user with tools explicitly enabled and
  execution permitted can trigger actions by opening a hostile link. Keep
  tools disabled unless required, require confirmation/least privilege, and
  avoid untrusted chat links. Stored API authentication does not prevent this
  confused-deputy path; it is separate from auditing downloaded patches.
- `draft-mtp` is restricted to `--np 1` and client concurrency one. Issue
  #28286 directly demonstrates cross-slot content contamination on gfx1151 at
  higher parallelism, including with HIP graphs disabled. The output can look
  plausible, so this is a confidentiality boundary, not a performance caveat.
- Single-slot mode does not prove sequential restore correctness. New
  [#28019 analysis](https://github.com/ggml-org/llama.cpp/issues/28019#issuecomment-5625760681)
  reports Qwen4-Exp recurrent-state divergence after restoring into a used
  context. Keep fresh-process and dirty-context comparisons; the startup
  shortcut in #28749 is not a fix for this separate restore path.
- Single-slot mode does not eliminate cancellation/liveness bugs either.
  A September 16 [CPU/aarch64 report](https://github.com/ggml-org/llama.cpp/issues/27388#issuecomment-5692308653)
  on b10991 with embedded Qwen3.5 MTP and parallelism one correlates client
  disconnects with a wedged `/slots` handler and shutdown timeout, while
  `/health` still succeeds; a plain-decoding control survives 12 cases.
  This is not a reproduced HIP failure or an isolated root cause. Use bounded
  request/`/slots` liveness checks and supervised restart; do not assume a
  successful `/health` proves that generation can continue.
- In router mode, `--models-max 1` is a memory/model-count limit, not a
  client-concurrency guarantee. [#28698](https://github.com/ggml-org/llama.cpp/issues/28698)
  reports a HIP admission/eviction race when requests for different models
  overlap, and [#28774](https://github.com/ggml-org/llama.cpp/issues/28774)
  describes a concurrent cold-start admission race. The new subprocess refactor
  and line-framing fix do not establish that every lifecycle race is repaired.
  Serialize model switches as well as inference requests.
- Keep `--api-key-file`, but note [#28820's resumable-stream limitation](https://github.com/ggml-org/llama.cpp/issues/28820):
  the router's internal stream lookup/deletion requests do not forward
  authorization. A targeted final-build test confirms 401 from key-protected
  children: router lookup returns no session and router deletion reports 204
  without deleting the child's session, while direct authenticated operations
  work. Ordinary routed requests pass the separate 13-case regression suite.
  Do not rely on router-mediated resumable-stream cleanup. The approved
  [#28938 proposal](https://github.com/ggml-org/llama.cpp/pull/28938) is not
  carried: it deliberately removes file-key authentication from children,
  allowing unauthenticated local access, and its environment-key case remains
  unresolved. Approval does not make that boundary change appropriate here.
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
- The new Nemotron zero-divisor guard is not general GGUF sanitization.
  Qwen4-Exp still has a per-layer FFN fallback division whose divisor is not
  comprehensively validated by the generic maximum-expert-count check.
  Malformed per-layer metadata remains a potential loader crash; this audit
  does not claim safe loading of arbitrary hostile models.
- The JSON-schema guard validates parser numeric conversions, not every
  downstream grammar operation. The inherited `maximum: -9223372036854775808`
  grammar-builder overflow and resource exhaustion from very large otherwise
  representable bounds remain outside its scope. Validate client schemas and
  keep API access trusted; a successful parser-boundary test is not a complete
  untrusted-schema security guarantee.
- The MiniCPM-V position-buffer fix removes the reproduced 1,024-entry stack
  bound, but is not a general image-size, allocation-budget or dimension-product
  guard. It does not audit bundled image codecs or establish that arbitrary
  hostile images/projectors are safe.
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
- Inherited [#24292](https://github.com/ggml-org/llama.cpp/pull/24292) closes a
  graph/buffer use-after-free but introduces a confirmed availability limit:
  freeing even an unrelated RPC buffer invalidates every server-side cached
  graph, while the client can retain and reuse its old graph UID. The server
  then rejects recomputation and disconnects the client; it does **not**
  transparently rebuild the graph. Keep the security fix, but do not rely on
  uninterrupted remote-RPC graph reuse across buffer frees. The ordinary
  local `llama-server`/HTTP model router without `--rpc` is unaffected.
- Avoid the optional `ggml-rpc-server -c` disk cache for sensitive inference:
  inherited [#28789](https://github.com/ggml-org/llama.cpp/pull/28789) now
  restricts ordinary sync/async client caching to weights, avoiding the old
  activation persistence. It does not validate or atomically replace partial
  cache files, repair old entries, authenticate callers, or stop a malicious
  client from setting the cache flag. Protocol 7 requires coordinated client
  and server upgrades. Disabling caching does not remove files already
  written. Local inference without a separate RPC server does not use this
  cache; the HTTP `llama-server` router is a different service.
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
- [Inherited unused QSA indexer V-cache removal, llama.cpp PR #28330](https://github.com/ggml-org/llama.cpp/pull/28330)
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
- [Inherited internal HIP AllReduce, llama.cpp PR #27825](https://github.com/ggml-org/llama.cpp/pull/27825)
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
- [Closed partial NextN loader redesign, llama.cpp PR #28192](https://github.com/ggml-org/llama.cpp/pull/28192)
- [Open graph/allocation-error handling, llama.cpp PR #28149](https://github.com/ggml-org/llama.cpp/pull/28149)
- [Open HIP small-copy compute kernel, llama.cpp PR #28178](https://github.com/ggml-org/llama.cpp/pull/28178)
- [Open adaptive MTP depth, llama.cpp PR #27210](https://github.com/ggml-org/llama.cpp/pull/27210)
- [Open multi-ubatch MTP serialization, llama.cpp PR #26827](https://github.com/ggml-org/llama.cpp/pull/26827)
- [Carried gfx1151 RDNA3.5 MMQ tuning, llama.cpp PR #28195](https://github.com/ggml-org/llama.cpp/pull/28195)
- [Independent gfx1151 MMQ measurements](https://github.com/ggml-org/llama.cpp/pull/28195#issuecomment-5605569760)
- [IMbackK's approval of the MMQ tuning](https://github.com/ggml-org/llama.cpp/pull/28195#pullrequestreview-5158353742)
- [Inherited AMD WMMA Flash Attention dispatch, llama.cpp PR #28102](https://github.com/ggml-org/llama.cpp/pull/28102)
- [JohannesGaessler's revised WMMA approval](https://github.com/ggml-org/llama.cpp/pull/28102#pullrequestreview-5160087812)
- [Independent gfx1151 WMMA measurements and batch-dependent regressions](https://github.com/ggml-org/llama.cpp/pull/28102#issuecomment-5609065368)
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
- [Inherited CUDA/HIP `IM2COL` access rewrite, llama.cpp PR #28013](https://github.com/ggml-org/llama.cpp/pull/28013)
- [Inherited approved F16 Flash Attention barrier fix, llama.cpp PR #27870](https://github.com/ggml-org/llama.cpp/pull/27870)
- [Reverted routed-MoE MMQ width selection, llama.cpp PR #24546](https://github.com/ggml-org/llama.cpp/pull/24546)
- [Inherited routed-MoE MMQ width selection, llama.cpp PR #28552](https://github.com/ggml-org/llama.cpp/pull/28552)
- [Open HIP IQ2/IQ3 SWAR intrinsics, llama.cpp PR #27962](https://github.com/ggml-org/llama.cpp/pull/27962)
- [Closed duplicate hipCUB reductions, llama.cpp PR #27936](https://github.com/ggml-org/llama.cpp/pull/27936)
- [Closed batched `DeviceTopK` dispatch, llama.cpp PR #28129](https://github.com/ggml-org/llama.cpp/pull/28129)
- [Open speculative-logprobs correctness, llama.cpp PR #27196](https://github.com/ggml-org/llama.cpp/pull/27196)
- [Closed `gguf-py` array-count hardening, llama.cpp PR #28131](https://github.com/ggml-org/llama.cpp/pull/28131)
- [Open symmetric Q8_0 conversion range, llama.cpp PR #25557](https://github.com/ggml-org/llama.cpp/pull/25557)
- [Closed explicit host placement under mmap, llama.cpp PR #28223](https://github.com/ggml-org/llama.cpp/pull/28223)
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
- [llama.cpp speculative decoding documentation](https://github.com/ggml-org/llama.cpp/blob/b11012/docs/speculative.md)
- [llama.cpp SPEED-Bench documentation](https://github.com/ggml-org/llama.cpp/blob/b11012/tools/server/bench/speed-bench/README.md)
- [Draft-cache total-memory warning, llama.cpp PR #28378](https://github.com/ggml-org/llama.cpp/pull/28378)
- [NumPy 1.x conversion-corruption report, llama.cpp issue #28438](https://github.com/ggml-org/llama.cpp/issues/28438)
- [Independent-request HIP memory growth, llama.cpp issue #28436](https://github.com/ggml-org/llama.cpp/issues/28436)
- [Speculative sub-batch retry proposal, Unsloth PR #182](https://github.com/unslothai/llama.cpp/pull/182)
- [Approved separate MTP graph-cache identities, llama.cpp PR #28549](https://github.com/ggml-org/llama.cpp/pull/28549#pullrequestreview-5132614946)
- [gfx1151 wrong-logits report on official unpatched builds](https://github.com/ggml-org/llama.cpp/issues/28537)
- [Narrower duplicate of the inherited host-buffer exclusion](https://github.com/ggml-org/llama.cpp/pull/28574)
- [Strix Vulkan QSA optimization isolation](https://github.com/ggml-org/llama.cpp/pull/28213#issuecomment-5570579330)
- [Long-context shared-sidecar MTP performance comparison](https://github.com/ggml-org/llama.cpp/pull/28243#issuecomment-5560422253)
- [Independent wrong-output report with host expert prefetch](https://github.com/ggml-org/llama.cpp/pull/28414#issuecomment-5575161425)
- [Strix Vulkan draft-vocabulary trimming research](https://github.com/ggml-org/llama.cpp/issues/25187#issuecomment-5553502926)
- [Video prefix-cache identity report](https://github.com/ggml-org/llama.cpp/issues/28580)
- [Inherited video frame-cache identity fix, llama.cpp PR #28601](https://github.com/ggml-org/llama.cpp/pull/28601)
- [Inherited Flash Attention type-pair selection, llama.cpp PR #28079](https://github.com/ggml-org/llama.cpp/pull/28079)
- [Inherited removal of legacy load-mode aliases, llama.cpp PR #28334](https://github.com/ggml-org/llama.cpp/pull/28334)
- [Unresolved authenticated Web UI hostile-link report](https://github.com/ggml-org/llama.cpp/issues/25790)
- [Qwen XML string-enum grammar proposal](https://github.com/ggml-org/llama.cpp/pull/28668)
- [HIP CLIP Flash Attention proposal](https://github.com/ggml-org/llama.cpp/pull/28664)
- [Image/speculation draft-position report](https://github.com/ggml-org/llama.cpp/issues/28587)
- [Inherited all-drafter image-position fix, llama.cpp PR #28715](https://github.com/ggml-org/llama.cpp/pull/28715)
- [Inherited native-rollback initialization shortcut, llama.cpp PR #28749](https://github.com/ggml-org/llama.cpp/pull/28749)
- [Carried GGUF pre-padding overflow guard, llama.cpp PR #24759](https://github.com/ggml-org/llama.cpp/pull/24759)
- [Carried empty expert-ID scheduler guard, llama.cpp PR #28739](https://github.com/ggml-org/llama.cpp/pull/28739)
- [Carried disabled-tools polling fix, llama.cpp PR #28646](https://github.com/ggml-org/llama.cpp/pull/28646)
- [Bounded requested-page PLE prefetch alternative](https://github.com/GenerelSchwerz/llama.cpp/pull/86)
- [Current rejection-sampling seed-correlation review](https://github.com/ggml-org/llama.cpp/pull/27694#discussion_r3971098855)
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
