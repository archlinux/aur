# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-ai-dynamo
pkgver=1.5.0
pkgrel=1
_commit=b83b1d9304ebfc624709ac46db32b1b6f1ff1615
pkgdesc='NVIDIA Dynamo: datacenter-scale distributed inference serving framework (Python)'
arch=('any')
url='https://github.com/ai-dynamo/dynamo'
license=('Apache-2.0')
depends=(
  'python'
  'python-ai-dynamo-runtime=1.5.0'
  'python-aiohttp>=3.13.5'
  'python-aiohttp<4.0'
  'python-httpx=0.28.1'
  'python-kubernetes>=32.0.1'
  'python-kubernetes<37.0.0'
  'python-msgspec>=0.19.0'
  'python-prometheus_client>=0.23.1'
  'python-prometheus_client<1.0'
  'python-pydantic>=2.10.6'
  'python-pydantic<2.14'
  'python-pyzmq>=26.0.0'
  'python-transformers>=4.56.0'
  'python-uvloop>=0.21.0'
  'python-yaml=6.0.3'
  'python-yarl'
  'python-zstandard>=0.23.0'
  'python-zstandard<1.0'
  'python-typing_extensions>=4.10.0'
  'python-tqdm>=4.0.0'
)
optdepends=(
  # AISimulate is optional on Python 3.14 in the upstream metadata.
  'python-aisimulate=0.12.0: planner and router simulation plugins'
  'python-aiconfigurator=0.12.0: AIConfigurator planner and profiler'
  'python-aiconfigurator-core=0.12.0: mocker performance modeling'
  'python-filterpy=1.4.5: Kalman load prediction for the SLA planner (dynamo.planner)'
  'python-grpcio: planner plugin transport and registry gateway'
  'python-protobuf: planner plugin protocol messages'
  'python-plotly>=6.0.1: planner diagnostic dashboards'
  'python-pmdarima=2.1.1: ARIMA load forecasting for the SLA planner'
  'python-prometheus-api-client>=0.6.0: planner queries to a Prometheus server'
  'python-prometheus-api-client<1.0.0: planner client API compatibility ceiling'
  'python-prophet>=1.1.7: Prophet load forecasting for the SLA planner'
  'python-prophet<2.0.0: Prophet load forecasting compatibility ceiling'
  'python-scikit-learn>=1.7.2: planner performance models'
  'python-scikit-learn<2.0.0: planner performance-model compatibility ceiling'
  'python-scipy>=1.14.0: profiler interpolation and analysis'
  'python-scipy<2.0.0: profiler interpolation compatibility ceiling'

  # Common multimodal, storage, profiling, and model-inspection helpers.
  'python-fsspec: directory-backed multimodal media loading and output storage'
  'python-huggingface-hub: mocker and profiler model metadata'
  'python-imageio>=2.37.0: image and video frame handling'
  'python-imageio-ffmpeg>=0.6.0: MP4 encoding for generated video'
  'python-matplotlib: forward-pass metric and profiler plots'
  'python-nixl: Python NIXL multimodal tensor transfer support'
  'python-numpy: planner, profiler, mocker, multimodal, and backend array operations'
  'python-nvtx: DYN_NVTX profiling annotations'
  'python-packaging: vLLM multimodal cache version handling'
  'python-pandas: planner forecasts and profiler data frames'
  'python-pillow: image and video inputs'
  'python-pytorch: multimodal tensor transfer and embedding caches'
  'python-safetensors: multimodal tensor serialization'

  # Backend stacks are shipped in the wheel but remain optional.  Keep the
  # current upstream 1.5.0 targets. Pins describe upstream GPU configurations;
  # they are not evidence that newer backend versions are incompatible.
  'python-accelerate>=0.17.0: SGLang diffusion backend runtime support'
  'python-blake3>=1.0.0: vLLM and TensorRT-LLM multimodal hashing (requires <2.0.0)'
  'python-blake3<2.0.0: vLLM and TensorRT-LLM multimodal hashing ceiling'
  'python-cupy>=13.6.0: SGLang multimodal CUDA array support'
  'python-diffusers: vLLM-Omni diffusion and video export helpers'
  'python-gpu-memory-service=0.9.0: optional GMS loading for vLLM, SGLang, and TensorRT-LLM (currently unavailable in Arch/AUR)'
  'python-kvbm=1.5.0: KVBM connectors for vLLM and TensorRT-LLM (currently unavailable in Arch/AUR)'
  'python-librosa>=0.10.0: vLLM-Omni audio processing'
  'python-modelexpress=0.5.0: vLLM and SGLang P2P model loading (currently unavailable in Arch/AUR)'
  'python-omegaconf: vLLM-Omni stage configuration'
  'python-ray>=2.55.0: vLLM distributed execution'
  'sglang=0.5.18: upstream SGLang backend target; GPU execution untested'
  'python-soundfile>=0.13.1: vLLM-Omni audio input and output'
  'python-tensorrt-llm=1.3.0rc25: upstream TensorRT-LLM target; GPU execution untested'
  'python-tokenspeed: experimental TokenSpeed backend (upstream is source-only and currently unavailable in Arch/AUR)'
  'python-tritonclient: Triton Inference Server backend client and protocol helpers'
  'python-tritonserver: Triton Inference Server backend (currently unavailable in Arch/AUR)'
  'python-vllm=0.28.0: upstream vLLM backend target; GPU execution untested'
  'python-vllm-omni: optional multimodal backend; independent upstream version required'

  # AIConfigurator's optional web application imports Gradio directly.
  'python-gradio: profiler web interface'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'git')
checkdepends=(
  'python-aiconfigurator=0.12.0'
  'python-aiconfigurator-core=0.12.0'
  'etcd'
  'nats-server'
  'python-aiofiles'
  'python-boto3'
  'python-coverage'
  'python-datasets'
  'python-filelock'
  'python-filterpy=1.4.5'
  'python-fsspec'
  'python-grpcio'
  'python-hf-xet'
  'python-httpx'
  'python-huggingface-hub'
  'python-imageio'
  'python-kubernetes-asyncio'
  'python-matplotlib'
  'python-nats-py>=2.12.0'
  'python-nats-py<3.0.0'
  'python-nixl'
  'python-numpy'
  'python-openai'
  'python-packaging'
  'python-pandas'
  'python-pillow'
  'python-plotly>=6.0.1'
  'python-pmdarima>=2.1.1'
  'python-pmdarima<3.0.0'
  'python-prometheus-api-client>=0.6.0'
  'python-prometheus-api-client<1.0.0'
  'python-prophet>=1.1.7'
  'python-prophet<2.0.0'
  'python-protobuf'
  'python-psutil'
  'python-pytorch'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-benchmark'
  'python-pytest-cov'
  'python-pytest-forked'
  'python-pytest-httpserver'
  'python-pytest-order'
  'python-pytest-rerunfailures'
  'python-pytest-timeout'
  'python-pytest-xdist'
  'python-requests'
  'python-safetensors'
  'python-scikit-learn>=1.7.2'
  'python-scikit-learn<2.0.0'
  'python-scipy>=1.14.0'
  'python-scipy<2.0.0'
  'python-tabulate'
  'python-tritonclient'
)
source=(
  "git+https://github.com/ai-dynamo/dynamo.git#commit=${_commit}"
  'python314-test-lifecycle.patch'
  'optional-simulation-test.patch'
)
sha256sums=(
  'SKIP'
  '29dfe9fa8ae6091508a24ec458ec3a20da4bb8ab6544812cf68763606d2e9aea'
  'b08fa89cdaf735434295c56fed78dfd485c41b8fc8817acc8c80ce8caa790cf7'
)

pkgver() { echo "$pkgver"; }

prepare() {
  cd dynamo
  # Allow Arch's stable aiohttp series for the compatibility trial. This does
  # not backport the response-parser fix in GHSA-cq5v-8q36-5273.
  sed -i 's/aiohttp>=3\.14\.3,<4\.0/aiohttp>=3.13.5,<4.0/' pyproject.toml
  # Arch currently packages Kubernetes 36.  The planner uses stable client
  # surfaces covered by the upstream connector tests; accept that API series.
  sed -i 's/kubernetes>=32\.0\.1,<33\.0\.0/kubernetes>=32.0.1,<37.0.0/' pyproject.toml
  # Retain explicit resource cleanup and realistic mocks with Python 3.14.
  patch -Np1 --fuzz=0 -i "$srcdir/python314-test-lifecycle.patch"
  # Match the other optional AISimulate suites when the plugin is absent.
  patch -Np1 --fuzz=0 -i "$srcdir/optional-simulation-test.patch"
}

build() {
  cd dynamo
  python -m build --wheel --no-isolation
}

check() {
  cd dynamo

  # The combined CPU integration suite creates many native runtimes and service
  # sockets. Slurm's inherited soft limit of 1024 is insufficient; retain the
  # suite and raise only this check process's limit within the hard limit.
  if (( $(ulimit -Sn) < 8192 )); then
    ulimit -Sn 8192
  fi

  local test_root="$srcdir/test-install"
  local site_packages
  local pytest_tmp="$srcdir/pytest-tmp"
  local manifest_root="$srcdir/test-manifests"
  local hf_home="$srcdir/hf-home"
  rm -rf "$test_root" "$pytest_tmp" "$manifest_root" "$hf_home"
  python -m installer --destdir="$test_root" dist/*.whl
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  install -d -m700 "$manifest_root" "$pytest_tmp" "$hf_home"

  # Check the release's planner layout before selecting the CPU suite.
  # Exclude the external deployment trees and their associated helper tests;
  # this package's retained scope exercises the in-process runtime and planner.
  local ignore_manifest="$manifest_root/collection-ignores"
  python - "$ignore_manifest" <<'PY'
import ast
import sys
from pathlib import Path

root = Path.cwd()
planner_root = root / "components/src/dynamo/planner/tests"
planner_files = sorted(planner_root.rglob("test_*.py"))
expected_core = {
    "components/src/dynamo/planner/tests/unit/test_advisory_mode.py",
    "components/src/dynamo/planner/tests/unit/test_aic_interpolation.py",
    "components/src/dynamo/planner/tests/unit/test_perf_metrics_priority.py",
}


def dotted_name(node: ast.AST) -> str | None:
    parts: list[str] = []
    while isinstance(node, ast.Attribute):
        parts.append(node.attr)
        node = node.value
    if isinstance(node, ast.Name):
        parts.append(node.id)
        return ".".join(reversed(parts))
    return None


def contains_marker(node: ast.AST, marker: str) -> bool:
    target = f"pytest.mark.{marker}"
    return any(dotted_name(child) == target for child in ast.walk(node))


def has_module_marker(tree: ast.Module, marker: str) -> bool:
    for statement in tree.body:
        value = None
        if isinstance(statement, ast.Assign) and any(
            isinstance(target, ast.Name) and target.id == "pytestmark"
            for target in statement.targets
        ):
            value = statement.value
        elif (
            isinstance(statement, ast.AnnAssign)
            and isinstance(statement.target, ast.Name)
            and statement.target.id == "pytestmark"
        ):
            value = statement.value
        if value is not None and contains_marker(value, marker):
            return True
    return False


planner_marked: list[str] = []
planner_core: set[str] = set()
for path in planner_files:
    relative = path.relative_to(root).as_posix()
    tree = ast.parse(path.read_text(encoding="utf-8"), filename=relative)
    if has_module_marker(tree, "planner"):
        planner_marked.append(relative)
    else:
        planner_core.add(relative)

if len(planner_files) != 80 or len(planner_marked) != 77:
    raise SystemExit(
        f"unexpected planner marker layout: files={len(planner_files)} "
        f"marked={len(planner_marked)}"
    )
if planner_core != expected_core:
    raise SystemExit(
        "unexpected dependency-light planner set: "
        f"actual={sorted(planner_core)} expected={sorted(expected_core)}"
    )

deploy_roots = [
    root / "tests/deploy",
    root / "tests/fault_tolerance/deploy",
]
deploy_tests: list[tuple[str, str]] = []
missing_post_merge: list[tuple[str, str]] = []
for deploy_root in deploy_roots:
    for path in sorted(deploy_root.rglob("test_*.py")):
        relative = path.relative_to(root).as_posix()
        tree = ast.parse(path.read_text(encoding="utf-8"), filename=relative)
        for node in ast.walk(tree):
            if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)) and node.name.startswith("test_"):
                item = (relative, node.name)
                deploy_tests.append(item)
                if not any(contains_marker(decorator, "post_merge") for decorator in node.decorator_list):
                    missing_post_merge.append(item)

if len(deploy_tests) != 47:
    raise SystemExit(
        f"unexpected deployment marker layout: tests={deploy_tests} "
        f"missing_post_merge={missing_post_merge}"
    )

ignore_paths = [
    deploy_root.relative_to(root).as_posix() for deploy_root in deploy_roots
]
# Upstream manylinux wheel publication tests require /opt/dynamo/wheelhouse
# and multiple Python interpreters; they do not target Arch package installation.
ignore_paths.append("tests/wheels/test_dynamo_wheel_smoke.py")
Path(sys.argv[1]).write_text("".join(f"{path}\n" for path in ignore_paths), encoding="utf-8")
print(
    f"AST collection proof planner_files={len(planner_files)} "
    f"planner_marked_included={len(planner_marked)} planner_core={len(planner_core)} "
    f"deployment_tree_tests_excluded={len(deploy_tests)}"
)
PY
  local -a collection_ignores=()
  local ignore_path
  while IFS= read -r ignore_path; do
    [[ -n $ignore_path ]] || continue
    collection_ignores+=("--ignore=$ignore_path")
  done < "$ignore_manifest"
  ((${#collection_ignores[@]} == 3))

  # Match both upstream CPU stages, including the now-available planner.
  # GPU inference backend stacks retain their separate hardware CI surfaces.
  # Pytest 9 cleanup handlers
  # inherited by pytest-forked children can remove a shared basetemp while later
  # tests still need it. Build a canonical manifest, prove an exact disjoint
  # forked/plain partition, then give each forked source file and each plain
  # stage a distinct basetemp. The selected manifest is executed exactly once.
  local test_failure=0
  local marker_all='pre_merge and gpu_0 and not (vllm or sglang or trtllm)'
  # Representative CPU coverage of the router topology and transport matrix.
  # Keep bindings + worker/token lookup from the large multi-router/mocker
  # topology/transport/soak matrix; other CPU modules and fresh installed usage
  # remain covered. This changes testing only, never shipped capabilities.
  local representative='not test_router_e2e_with_mockers or test_kv_router_bindings or test_query_instance_id_returns_worker_and_tokens'
  # Tests intentionally leave loop-break requests running (implicit cancellation
  # is not implemented upstream). Tear those requests down explicitly AFTER
  # their assertions, and wait for generators before closing the event loop.
  python - "$srcdir/dynamo/lib/bindings/python/tests/cancellation/test_cancellation.py" <<'PY'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text()
if "self._aur_inflight" not in text:
    replacements = [
        (
            '        self.context_metadata: dict[str, str] = {}\n',
            '        self.context_metadata: dict[str, str] = {}\n'
            '        self._aur_inflight = []\n',
        ),
        (
            '        async for response in method(request, context):\n'
            '            yield response\n',
            '        done = asyncio.Event()\n'
            '        self._aur_inflight.append((context, done))\n'
            '        try:\n'
            '            async for response in method(request, context):\n'
            '                yield response\n'
            '        finally:\n'
            '            done.set()\n',
        ),
        (
            '    # Cleanup - cancel server task\n',
            '    # Complete outstanding requests before shutting down the server.\n'
            '    for context, done in handler._aur_inflight:\n'
            '        context.stop_generating()\n'
            '    if handler._aur_inflight:\n'
            '        await asyncio.wait_for(\n'
            '            asyncio.gather(*(done.wait() for _, done in handler._aur_inflight)),\n'
            '            timeout=5,\n'
            '        )\n'
            '    # Cleanup - cancel server task\n',
        ),
    ]
    for old, new in replacements:
        assert text.count(old) == 1, old
        text = text.replace(old, new)
    path.write_text(text)
PY
  local marker_parallel='pre_merge and parallel and gpu_0 and not (vllm or sglang or trtllm)'
  local marker_serial='pre_merge and not parallel and gpu_0 and not (vllm or sglang or trtllm)'

  _collect_manifest() {
    local label="$1"
    local marker="$2"
    local allow_empty="${3:-0}"
    local output="$manifest_root/$label.collect"
    local rc=0
    install -d "$pytest_tmp"
    # grpcio >= 1.80 initializes Abseil logging when imported.  This opt-out is
    # provided by grpcio for processes where another native extension already
    # initialized the shared Abseil logger; pytest's whole-tree collection is
    # such a process.  The gRPC tests still collect and run in full.
    # Load the real PyTorch compiler before pytest prepends backend source
    # directories: dynamo/triton otherwise looks like a top-level Triton package.
    GRPC_PYTHON_DISABLE_ABSL_INIT_LOG=1 \
      HF_HOME="$hf_home" \
      HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 \
      PYTHONPATH="$test_root$site_packages:$PWD" \
        python -c 'import torch._dynamo; import pytest; raise SystemExit(pytest.main())' -n 0 --continue-on-collection-errors --collect-only \
          -q --color=no --basetemp="$pytest_tmp/$label-collect" \
          -o cache_dir="$pytest_tmp/$label-collect-cache" -m "$marker" \
          -k "$representative" \
          "${collection_ignores[@]}" \
          > "$output" || rc=$?
    if ((rc != 0 && !(allow_empty && rc == 5))); then
      printf 'collection failed: %s rc=%s\n' "$label" "$rc" >&2
      cat "$output" >&2
      return 1
    fi
    sed -n '/::/p' "$output" | LC_ALL=C sort -u > "$manifest_root/$label.all"
    if [[ ! -s $manifest_root/$label.all ]] && (( ! allow_empty )); then
      printf 'empty collection manifest: %s rc=%s\n' "$label" "$rc" >&2
      cat "$output" >&2
      return 1
    fi
    printf 'collected %s=%s rc=%s\n' "$label" \
      "$(wc -l < "$manifest_root/$label.all")" "$rc"
  }

  _prove_partition() {
    local whole="$1"
    local left="$2"
    local right="$3"
    local label="$4"
    LC_ALL=C sort "$left" "$right" > "$manifest_root/$label.joined"
    uniq -d "$manifest_root/$label.joined" > "$manifest_root/$label.overlap"
    if [[ -s $manifest_root/$label.overlap ]]; then
      printf 'partition overlap: %s\n' "$label" >&2
      cat "$manifest_root/$label.overlap" >&2
      return 1
    fi
    LC_ALL=C sort -u "$manifest_root/$label.joined" > "$manifest_root/$label.union"
    if ! cmp -s "$whole" "$manifest_root/$label.union"; then
      printf 'partition union mismatch: %s whole=%s union=%s\n' \
        "$label" "$(wc -l < "$whole")" \
        "$(wc -l < "$manifest_root/$label.union")" >&2
      comm -3 "$whole" "$manifest_root/$label.union" | head -50 >&2
      return 1
    fi
    printf 'partition proof %s overlap=0 union=exact\n' "$label"
  }

  _split_forked_by_file() {
    local stage="$1"
    local part path node
    for part in kserve cancellation deprecated http; do
      : > "$manifest_root/$stage.$part"
    done
    while IFS= read -r node; do
      path="${node%%::*}"
      case "$path" in
        lib/bindings/python/tests/test_kserve_grpc.py)
          part=kserve ;;
        lib/bindings/python/tests/cancellation/*)
          part=cancellation ;;
        lib/bindings/python/tests/test_deprecated_enable_nats.py)
          part=deprecated ;;
        lib/bindings/python/tests/test_http_server.py)
          part=http ;;
        *)
          printf 'unpartitioned forked test: %s\n' "$node" >&2
          return 1 ;;
      esac
      printf '%s\n' "$node" >> "$manifest_root/$stage.$part"
    done < "$manifest_root/$stage.forked.all"
    LC_ALL=C sort \
      "$manifest_root/$stage.kserve" \
      "$manifest_root/$stage.cancellation" \
      "$manifest_root/$stage.deprecated" \
      "$manifest_root/$stage.http" \
      > "$manifest_root/$stage.forked-files.joined"
    uniq -d "$manifest_root/$stage.forked-files.joined" \
      > "$manifest_root/$stage.forked-files.overlap"
    if [[ -s $manifest_root/$stage.forked-files.overlap ]]; then
      printf 'forked file overlap: %s\n' "$stage" >&2
      cat "$manifest_root/$stage.forked-files.overlap" >&2
      return 1
    fi
    LC_ALL=C sort -u "$manifest_root/$stage.forked-files.joined" \
      > "$manifest_root/$stage.forked-files.union"
    if ! cmp -s "$manifest_root/$stage.forked.all" \
      "$manifest_root/$stage.forked-files.union"; then
      printf 'forked file union mismatch: %s\n' "$stage" >&2
      comm -3 "$manifest_root/$stage.forked.all" \
        "$manifest_root/$stage.forked-files.union" | head -50 >&2
      return 1
    fi
    printf 'forked file proof %s overlap=0 union=exact\n' "$stage"
  }

  _run_manifest() {
    local label="$1"
    local manifest="$2"
    local -a nodes=()
    mapfile -t nodes < "$manifest"
    ((${#nodes[@]})) || return 0
    rm -rf "$pytest_tmp/$label" "$pytest_tmp/$label-cache"
    install -d "$pytest_tmp"
    # The collected CPU suite declares one Hugging Face model.  Upstream's
    # session fixtures download it once, under a file lock, and immediately
    # switch all test processes to offline mode.  Give that lifecycle a clean,
    # private cache and permit network access only during fixture setup.
    env -u HF_HUB_OFFLINE -u TRANSFORMERS_OFFLINE \
      GRPC_PYTHON_DISABLE_ABSL_INIT_LOG=1 HF_HOME="$hf_home" \
      PYTHONPATH="$test_root$site_packages:$PWD" \
      python -c 'import torch._dynamo; import pytest; raise SystemExit(pytest.main())' -s -n 0 --continue-on-collection-errors -vv --tb=short \
        --basetemp="$pytest_tmp/$label" -o cache_dir="$pytest_tmp/$label-cache" \
        --durations=10 "${nodes[@]}" || test_failure=1
  }

  _collect_manifest canonical "$marker_all"
  _collect_manifest parallel "$marker_parallel"
  _collect_manifest serial "$marker_serial"
  _collect_manifest parallel.forked "($marker_parallel) and forked" 1
  _collect_manifest parallel.plain "($marker_parallel) and not forked" 1
  _collect_manifest serial.forked "($marker_serial) and forked" 1
  _collect_manifest serial.plain "($marker_serial) and not forked" 1

  _prove_partition "$manifest_root/canonical.all" \
    "$manifest_root/parallel.all" "$manifest_root/serial.all" stages
  _prove_partition "$manifest_root/parallel.all" \
    "$manifest_root/parallel.forked.all" "$manifest_root/parallel.plain.all" \
    parallel
  _prove_partition "$manifest_root/serial.all" \
    "$manifest_root/serial.forked.all" "$manifest_root/serial.plain.all" \
    serial
  _split_forked_by_file parallel
  _split_forked_by_file serial

  printf 'coverage canonical=%s parallel=%s serial=%s overlap=0 union=exact\n' \
    "$(wc -l < "$manifest_root/canonical.all")" \
    "$(wc -l < "$manifest_root/parallel.all")" \
    "$(wc -l < "$manifest_root/serial.all")"
  printf 'partition parallel_forked=%s parallel_plain=%s serial_forked=%s serial_plain=%s overlap=0 union=exact\n' \
    "$(wc -l < "$manifest_root/parallel.forked.all")" \
    "$(wc -l < "$manifest_root/parallel.plain.all")" \
    "$(wc -l < "$manifest_root/serial.forked.all")" \
    "$(wc -l < "$manifest_root/serial.plain.all")"
  sha256sum "$manifest_root/canonical.all" "$manifest_root/stages.union"

  local stage part
  for stage in parallel serial; do
    for part in kserve cancellation deprecated http; do
      _run_manifest "$stage-$part" "$manifest_root/$stage.$part"
    done
    _run_manifest "$stage-plain" "$manifest_root/$stage.plain.all"
  done

  DYNAMO_STAGED_ROOT="$test_root" PYTHONPATH="$test_root$site_packages" \
    python - <<'PY'
import os
from pathlib import Path

import dynamo
import dynamo.common
from dynamo.runtime import DistributedRuntime

root = Path(os.environ['DYNAMO_STAGED_ROOT']).resolve()
assert Path(dynamo.common.__file__).resolve().is_relative_to(root)
assert DistributedRuntime is not None
PY
  # Diagnose every independent suite group, but retain a hard failure if any
  # group failed. Never promote a partial or masked test result.
  return "$test_failure"
}

package() {
  cd dynamo
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Upstream's wheel includes its entire in-tree pytest suite and advertises
  # four pytest-only plugins. Keep that wheel intact for check(), then remove
  # only those development files from the production package.  Guard the exact
  # input and output manifests so no runtime module can be removed silently.
  python - "${pkgdir}" <<'PY'
import base64
import configparser
import csv
import hashlib
import importlib.util
import shutil
import sys
from pathlib import Path, PurePosixPath

pkgdir = Path(sys.argv[1])
site_packages = list(pkgdir.glob("usr/lib/python*/site-packages"))
if len(site_packages) != 1:
    raise SystemExit(f"unexpected site-packages roots: {site_packages}")
site = site_packages[0]

dist_infos = list(site.glob("ai_dynamo-*.dist-info"))
if len(dist_infos) != 1 or dist_infos[0].name != "ai_dynamo-1.5.0.dist-info":
    raise SystemExit(f"unexpected dist-info roots: {dist_infos}")
dist_info = dist_infos[0]
record = dist_info / "RECORD"
entry_points = dist_info / "entry_points.txt"

plugins = configparser.ConfigParser(interpolation=None)
plugins.read(entry_points, encoding="utf-8")
if dict(plugins["pytest11"]) != {
    f"{backend}_tests": f"dynamo.{backend}.tests.conftest"
    for backend in ("sglang", "triton", "trtllm", "vllm")
}:
    raise SystemExit("unexpected pytest entry points")
production_plugins = {
    group: dict(plugins[group]) for group in plugins.sections() if group != "pytest11"
}
assert set(production_plugins) == {
    "aisimulate.sweep_config_providers", "aisimulate.runner_factories",
    "aisimulate.config_adapters",
}

with record.open(newline="", encoding="utf-8") as stream:
    rows = list(csv.reader(stream))
if any(len(row) != 3 for row in rows):
    raise SystemExit("malformed wheel RECORD")


def is_test_path(path: str) -> bool:
    parts = PurePosixPath(path).parts
    return bool(parts and parts[0] == "dynamo" and "tests" in parts)


def manifest_hash(selected_rows: list[list[str]]) -> str:
    payload = "".join(
        f"{','.join(row)}\n" for row in sorted(selected_rows, key=lambda row: row[0])
    )
    return hashlib.sha256(payload.encode()).hexdigest()


def path_hash(selected_rows: list[list[str]]) -> str:
    payload = "".join(f"{row[0]}\n" for row in sorted(selected_rows, key=lambda row: row[0]))
    return hashlib.sha256(payload.encode()).hexdigest()


dynamo_rows = [row for row in rows if row[0].startswith("dynamo/")]
test_rows = [row for row in dynamo_rows if is_test_path(row[0])]
production_rows = [row for row in dynamo_rows if not is_test_path(row[0])]
# Derive the cleanup partition from this exact built wheel, not counts and
# content hashes from an older release. Freeze every production RECORD row
# before removing only directories whose path component is literally tests.
expected_groups = set()
for row in test_rows:
    parts = PurePosixPath(row[0]).parts
    index = parts.index("tests")
    expected_groups.add(PurePosixPath(*parts[: index + 1]).as_posix())
entry_point_path = entry_points.relative_to(site).as_posix()
assert test_rows and production_rows and expected_groups
assert len({row[0] for row in rows}) == len(rows)
assert sum(row[0] == entry_point_path for row in rows) == 1
before_paths = path_hash(production_rows)
before_manifest = manifest_hash(production_rows)
before_content = {}
for row in production_rows:
    path = site / row[0]
    assert path.is_file() and path.resolve().is_relative_to(site.resolve())
    before_content[row[0]] = hashlib.sha256(path.read_bytes()).hexdigest()
print(f"wheel partition production={len(production_rows)} tests={len(test_rows)} "
      f"production_paths={before_paths} production_manifest={before_manifest}")

recorded_test_files = {row[0] for row in test_rows}
expected_test_bytecode = {
    Path(
        importlib.util.cache_from_source(
            str(site / row[0]), optimization=optimization
        )
    )
    .relative_to(site)
    .as_posix()
    for row in test_rows
    if row[0].endswith(".py")
    for optimization in ("", "1")
}
installed_test_files = {
    path.relative_to(site).as_posix()
    for path in (site / "dynamo").rglob("*")
    if path.is_file() and "tests" in path.relative_to(site / "dynamo").parts
}
if (
    installed_test_files != recorded_test_files | expected_test_bytecode
):
    raise SystemExit("installed test tree differs from wheel RECORD")

for relative in sorted(expected_groups, reverse=True):
    test_dir = site / relative
    if not test_dir.is_dir():
        raise SystemExit(f"missing recorded test directory: {relative}")
    shutil.rmtree(test_dir)
plugins.remove_section("pytest11")
with entry_points.open("w", encoding="utf-8") as stream:
    plugins.write(stream)
payload = entry_points.read_bytes()
entry_digest = base64.urlsafe_b64encode(hashlib.sha256(payload).digest()).rstrip(b"=").decode()

removed_paths = recorded_test_files
filtered_rows = [row for row in rows if row[0] not in removed_paths]
for row in filtered_rows:
    if row[0] == entry_point_path:
        row[1:] = ["sha256=" + entry_digest, str(len(payload))]
with record.open("w", newline="", encoding="utf-8") as stream:
    csv.writer(stream, lineterminator="\n").writerows(filtered_rows)

post_dynamo = [row for row in filtered_rows if row[0].startswith("dynamo/")]
if (
    len(filtered_rows) != len(rows) - len(removed_paths)
    or len(post_dynamo) != len(production_rows)
    or any(is_test_path(row[0]) for row in filtered_rows)
    or path_hash(post_dynamo) != before_paths
    or manifest_hash(post_dynamo) != before_manifest
    or any(hashlib.sha256((site / path).read_bytes()).hexdigest() != digest
           for path, digest in before_content.items())
    or {group: dict(plugins[group]) for group in plugins.sections()} != production_plugins
    or any(
        "tests" in path.relative_to(site / "dynamo").parts
        for path in (site / "dynamo").rglob("*")
    )
):
    raise SystemExit("production wheel cleanup postcondition failed")
PY

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
