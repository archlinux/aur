#!/usr/bin/env python3
"""Stage the runtime backend tree and its manifest from a High Tide checkout.

Usage: collect_backend.py <checkout> <output-directory>

Writes <output>/backend/... and <output>/backend-manifest.json. The allowlist is
explicit: no payload, account token, capture, Wine prefix or log can be picked up
by a glob. Missing entries are reported instead of silently producing a package
whose first launch fails.
"""
import hashlib
import json
from pathlib import Path
import shutil
import sys

root = Path(sys.argv[1]).resolve()
output = Path(sys.argv[2]).resolve()
backend = set()


def tree(folder, suffixes):
    return {p.relative_to(root).as_posix() for p in (root / folder).rglob("*")
            if p.is_file() and p.suffix in suffixes and "build" not in p.relative_to(root / folder).parts}


backend |= tree("platform/loader/src", {".java", ".in", ".MF", ".tsv", ".md"})
backend |= tree("platform/modern_compat/src/main", {".java"})
backend |= tree("stage0/gat_capture/src", {".java"})
backend |= tree("tools", {".sh"})
backend |= {f"scripts/{name}.sh" for name in
            ("run_native_loader", "run_vape_linux", "run_vape_26_2", "build_loader")}
backend |= {f"stage0/{name}" for name in (
    "setup_wine_prefix.sh", "hwid_native.sh", "setup_decoy_mc.sh", "install_mc_189.py",
    "run_extract_login.sh", "assemble_stage1_from_dump.sh", "install_auth_token.sh",
    "validate_auth_token.py", "gat_capture/build.sh", "overlays/a__E0.class")}
backend |= {f"stage0/extractor/{name}" for name in (
    "capture_vape_loopback.sh", "reassemble_vape_pcap.py", "extract_vape_resource_stream.py",
    "build_vape_stage1_jars.py", "build_stage1_manifest.py", "apply_linux_overlay.py",
    "vape-stage1-mapping-pairs.tsv", "VapeWineRuntimePatcher.exe", "VapeWineRuntimePatcher.exe.so")}
backend |= {"platform/loader/build.sh", "tools/capture_session.py", "tools/high-tide-capture-helper",
            "launcher/data/dev.hightide.Launcher.svg", "vendor/lib/asm-9.10.1.jar"}
backend |= {f"platform/native/{directory}/build/libvape_{name}_bridge.so"
            for directory, name in (("native_bridge", "native"), ("aa_bridge", "aa"),
                                    ("bridge", "ab"), ("ac_bridge", "ac"))}

sources = {relative: root / relative for relative in backend}
# The primary bridge resolves its dependencies through $ORIGIN. Ship the current
# standalone bridges, not the stale copies in the repository's nested folders.
for directory, name in (("aa_bridge", "aa"), ("bridge", "ab"), ("ac_bridge", "ac")):
    sources[f"platform/native/native_bridge/build/libvape_{name}_bridge.so"] = (
        root / f"platform/native/{directory}/build/libvape_{name}_bridge.so")

missing = sorted(relative for relative, original in sources.items() if not original.is_file())
if missing:
    sys.exit("Backend files missing from the checkout:\n  " + "\n  ".join(missing))


def mode(path):
    return 0o755 if path.suffix == ".sh" or path.stat().st_mode & 0o111 else 0o644


target = output / "backend"
shutil.rmtree(target, ignore_errors=True)
manifest = {}
for relative, original in sorted(sources.items()):
    destination = target / relative
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(original, destination)
    destination.chmod(mode(original))
    manifest[relative] = {"sha256": hashlib.sha256(original.read_bytes()).hexdigest(),
                          "mode": mode(original)}
(output / "backend-manifest.json").write_text(json.dumps(manifest, sort_keys=True, indent=2))
print(f"Staged {len(manifest)} backend files; no user payload or account data included.")
