"""Build a pm store whose required tools are the system's own binaries.

Usage: python system-tools.py <hermes tree> <store dir> [<system bin dir>]

Since v0.21.6 Hermes resolves node, npm, ffmpeg, ripgrep, python and uv
through its package manager (pm), which never counts a PATH copy: without a
pm store the TUI and npx/uvx MCP servers fail (lazy installs are disabled
here), and a partial per-user store makes every start warn "install out of
sync". Each tool in TOOLS gets a store entry of symlinks into the system bin
dir, recorded in facts.json under the pin the lockfile names, so pm treats
the tools from depends=() as installed. A manifest.json beside the store
selects pm's bundled layout: optional tools (browser, ...) still go to the
user's own ~/.hermes/tools.

python and uv serve uvx MCP servers and pm's own runtime. Upstream would also
run Hermes's children and service units on a store python, without the venv;
keep-venv-interpreter.patch turns that off for this package.

Only node and npm keep pm's PATH env: npx/node MCP servers find them through
it. pm.activate() also puts these two dirs first on PATH for every process
Hermes starts, so its children run the system node and npm even when the
user's PATH prefers another one (nvm, volta); that is upstream's store-first
design. The others carry no env, so pm puts no dir of theirs on PATH: Hermes
only steps past PATH dirs inside its home when it resolves a user's bare MCP
command, so such dirs would shadow the user's own python3, ffmpeg or rg there.
Lookups through pm get the store binary directly.
"""
import json
import sys
from pathlib import Path

tree, store = Path(sys.argv[1]), Path(sys.argv[2])
# Resolved: the symlinks store this path as written.
sysbin = Path(sys.argv[3] if len(sys.argv) > 3 else "/usr/bin").resolve()
sys.path.insert(0, str(tree))

from pm import paths  # noqa: E402
from pm.install import current_target  # noqa: E402
from pm.lock import Facts, Lockfile  # noqa: E402
from pm.registry import get_package, tool_roots, walk  # noqa: E402
from pm.store import tree_digest  # noqa: E402

# pm package -> system commands in its store entry. The first one is the
# binary pm resolves, the others ship next to it.
TOOLS = {
    "node": ("node",),
    "npm": ("npm", "npx"),
    "ffmpeg": ("ffmpeg", "ffprobe"),
    "ripgrep": ("rg",),
    "python": ("python3",),
    "uv": ("uv", "uvx"),
}
ON_PATH = ("node", "npm")

target = current_target()
lockfile = Lockfile(paths.lockfile_path())  # the lock of the tree imported above
# What a source install of this tree publishes (pm's own selection), plus uv
# for uvx. A tool upstream adds or drops must be decided on here, not
# skipped silently.
expected = {dep.name for dep in walk(tool_roots(lockfile.names()) + ["uv"])
            if dep.missing_reason(target) is None}
if expected != set(TOOLS):
    sys.exit(f"system-tools: pm now requires {sorted(expected)}, TOOLS lists {sorted(TOOLS)}")

store.mkdir(parents=True)
facts = Facts(store / "facts.json")
for name, commands in TOOLS.items():
    package = get_package(name)
    version = lockfile.version(name)
    entry = store / package.store_entry(version, target)
    binary = package.binary(entry, target)
    if binary is None:
        sys.exit(f"system-tools: pm names no binary for {name}")
    for command in commands:
        source = sysbin / command
        if not source.exists():
            sys.exit(f"system-tools: {source} is missing (needed for {name})")
        binary.parent.mkdir(parents=True, exist_ok=True)
        (binary.parent / command).symlink_to(source)
    if not binary.exists():
        sys.exit(f"system-tools: {binary} was not created for {name}")
    env = package.env(entry, target) if name in ON_PATH else {}
    facts.record(name, version, entry.name, env, store,
                 target=target, artifacts=[a["sha256"] for a in lockfile.artifacts(name, target)],
                 digest=tree_digest(entry))
    print(f"system-tools: {name} {version} -> {', '.join(commands)}")
(store / "facts.json").chmod(0o644)
(store.parent / "manifest.json").write_text(
    json.dumps({"comment": "selects pm's bundled layout for the system-tools store"}) + "\n")
