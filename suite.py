#!/usr/bin/env python3
# Run upstream's test suite against the package's build and judge the
# result by the package's own test list.
#
#   suite.py run   --arch ARCH --src SRC --build BUILD --runs RUNS [--jobs N] LIST...
#   suite.py judge --arch ARCH RUN LIST...
#   suite.py skips --arch ARCH LIST...
#
# ARCH is the package architecture (x86_64, aarch64). SRC is the tree,
# BUILD its build directory, RUNS where edgy keeps its runs, RUN one such
# run. `run` writes the skip lists, runs edgy over every suite, then
# judges the run; `judge` judges an existing run; `skips` prints the tests
# the lists skip on ARCH.
#
# The list: one line per test that is not plain. A test with no line is
# expected to compile, link and run as its own type says, and to print
# what upstream recorded.
#
#   <path> [<key>=<value>]... [<reference>]
#
#   <path>        the test, relative to tests/tests (imported/gnu/c/x.sft.c)
#   target=A,B    runs only where the package's target is one of A, B
#   lib=X         needs library X, which the run does not provide
#   headers=X     needs the headers of X, which the run does not provide
#   skip=A,B      skipped on A, B whatever the requirements say
#   noskip=A,B    run on A, B whatever the requirements say
#   A=STATUS      the result expected on A (x86_64=COMP aarch64=CRASH)
#   <reference>   one bare word: a discussion or issue number
#
# A requirement the run cannot provide skips the test. The run provides
# target=ARCH and nothing else.
#
# STATUS names where the test stops and how; a test with an expected
# STATUS has only its status compared, not its output:
#
#   PASS   as its type says              COMP   stops at compile, diagnosed
#   ICE    internal error or crash       LINK   stops at link
#   EXEC   runs, wrong exit status       CRASH  runs, dies of a signal
#   DIFF   passes, output differs from upstream's recording
#
# edgy declines a test whose own options the build cannot satisfy
# (REQUIREMENTS NOT MET); a declined case is no result and is never
# judged. Exit status: 0 when every regression is expected, 1 otherwise.
import argparse, os, re, subprocess, sys, tarfile
from pathlib import Path

CONFIGS = ("edg_x86_64", "edg_x86_64_cp")
STATUSES = ("PASS", "COMP", "ICE", "LINK", "EXEC", "CRASH", "DIFF")
REQUIREMENT_KEYS = ("target", "lib", "headers")
SWITCH_KEYS = ("skip", "noskip")
EXECUTED_TYPES = ("lp", "ln", "rp", "rn", "ra")
LINK_ERROR = re.compile(r"undefined reference|ld returned|cannot find -l|relocation")
INTERNAL_ERROR = re.compile(r"internal error|assertion failed|Abort")


class Entry:
    def __init__(self, path):
        self.path = path
        self.requirements = {}
        self.skip = set()
        self.noskip = set()
        self.expect = {}
        self.reference = None

    def runs_on(self, arch):
        if arch in self.skip:
            return False
        if arch in self.noskip:
            return True
        for key, values in self.requirements.items():
            if key != "target" or arch not in values:
                return False
        return True


def read_lists(files):
    entries = {}
    for f in files:
        for n, line in enumerate(Path(f).read_text().splitlines(), 1):
            line = line.split("#", 1)[0].strip()
            if not line:
                continue
            tokens = line.split()
            e = entries.setdefault(tokens[0], Entry(tokens[0]))
            for t in tokens[1:]:
                if "=" not in t:
                    if e.reference is not None:
                        sys.exit(f"{f}:{n}: two references: {e.reference} {t}")
                    e.reference = t
                    continue
                key, value = t.split("=", 1)
                if key in REQUIREMENT_KEYS:
                    e.requirements.setdefault(key, set()).update(value.split(","))
                elif key == "skip":
                    e.skip.update(value.split(","))
                elif key == "noskip":
                    e.noskip.update(value.split(","))
                elif value in STATUSES:
                    e.expect[key] = value
                else:
                    sys.exit(f"{f}:{n}: unknown field {t}")
    return entries


def skipped(entries, arch):
    return sorted(p for p, e in entries.items() if not e.runs_on(arch))


def write_skip_lists(src, entries, arch):
    """edgy reads tests/flakey-tests/<config>/<suite>.txt, one path per line
    relative to the suite, and skips those tests under --no-flakey-tests."""
    by_suite = {}
    for p in skipped(entries, arch):
        suite, rel = p.split("/", 1)
        by_suite.setdefault(suite, []).append(rel)
    root = Path(src) / "tests" / "flakey-tests"
    for cfg in CONFIGS:
        d = root / cfg
        d.mkdir(parents=True, exist_ok=True)
        for old in d.glob("*.txt"):
            old.unlink()
        for suite, rels in by_suite.items():
            (d / f"{suite}.txt").write_text(
                f"# edgcpp-git: tests the package's list skips on {arch}\n"
                + "".join(f"{r}\n" for r in rels))
    return sum(len(v) for v in by_suite.values())


def run_edgy(src, build, runs, jobs):
    env = os.environ.copy()
    env.pop("EDG_USE_SYSTEM_HEADERS", None)
    env["PATH"] = f"{src}/dev_tools/bin:{env['PATH']}"
    env["PYTHONPATH"] = f"{src}/dev_tools/pylibs"
    script = f"""
set -eu
. "{build}/environment.sh"
export EDG_GCC_INCL_SCRAPE="$(edg-scrape-compiler gcc --lang c++ includes)"
export EDG_GCC_CINCL_SCRAPE="$(edg-scrape-compiler gcc --lang c includes)"
export EDG_GCC_VER_SCRAPE="$(edg-scrape-compiler gcc version)"
cd "{build}"
edgy -j {jobs} --runs-dir "{runs}" --disp-run-dir --no-flakey-tests all || true
"""
    out = subprocess.run(["bash", "-c", script], env=env, stdout=subprocess.PIPE,
                         stderr=subprocess.STDOUT, text=True).stdout
    sys.stdout.write(out)
    m = re.search(r"^Run output directory: (.+)$", out, re.M)
    if not m:
        sys.exit("edgy did not report its run directory")
    return Path(m.group(1).strip())


def parse_elog_line(line):
    """'+ <path> <type>:<options>:<STATUS>:<remark>' -> (path, type, status)."""
    path, rest = line[2:].split(" ", 1)
    fields = rest.split(":")
    return path, fields[0], fields[2] if len(fields) > 2 else ""


def diff_text(run, cfg, test):
    stem = re.sub(r"\.[sm]ft\.[^.]+$", "", test)
    kind = ".mft" if ".mft." in test else ".sft"
    try:
        with tarfile.open(run / cfg / f"{stem}{kind}.rt.tar.gz") as t:
            return "".join(t.extractfile(m).read().decode("utf-8", "replace")
                           for m in t.getmembers() if m.name.endswith("change.diff"))
    except (OSError, tarfile.TarError):
        return ""


def our_status(edgy_status, test_type, diff):
    """Map edgy's status word to the list's STATUS, or None for no result."""
    base, _, modifiers = edgy_status.partition("--")
    if base in ("REQUIREMENTS NOT MET", "SKIPPED", "MISSING COMMAND"):
        return None
    compile_step = base.endswith("(COMPILE)")
    base = base.replace("(COMPILE)", "").replace("(REGEX)", "")
    if base == "PASS":
        return "DIFF" if "OUTPUT MISMATCH" in modifiers else "PASS"
    if base == "ABORT":
        return "ICE"
    if base == "CATASTROPHE":
        # Exit status above 2: an internal error, or a catastrophic
        # diagnostic (#error, a missing header), which is a compile stop.
        return "ICE" if INTERNAL_ERROR.search(diff) else "COMP"
    if base == "RUNTIME ABORT":
        return "CRASH"
    # FAIL or BADC
    if test_type in EXECUTED_TYPES and compile_step:
        return "LINK" if LINK_ERROR.search(diff) else "COMP"
    if test_type in EXECUTED_TYPES:
        return "EXEC"
    return "COMP"


def observe(run):
    """Every regression and every output mismatch of the run, by test:
    {path: set of STATUS}. Regressions come from regressions.elog;
    mismatches on otherwise passing tests from changes.elog."""
    seen = {}
    for cfg in CONFIGS:
        for name in ("regressions.elog", "changes.elog"):
            f = run / cfg / name
            if not f.exists():
                continue
            for line in f.read_text().splitlines():
                if not line.startswith("+ "):
                    continue
                path, test_type, status = parse_elog_line(line)
                if name == "changes.elog" and not status.startswith("PASS--OUTPUT MISMATCH"):
                    continue
                diff = diff_text(run, cfg, path) if "(COMPILE)" in status or "CATASTROPHE" in status else ""
                s = our_status(status, test_type, diff)
                if s is not None:
                    seen.setdefault(path, set()).add(s)
    return seen


def judge(run, entries, arch, show_diffs):
    seen = observe(run)
    expected, unexpected, diffs, notseen = [], [], [], []
    for path, statuses in sorted(seen.items()):
        want = entries[path].expect.get(arch, "PASS") if path in entries else "PASS"
        for s in sorted(statuses):
            if s == "PASS":
                continue
            if s == want:
                expected.append(path)
            elif s == "DIFF":
                # With an expected failure this is the failure not
                # happening, which "not seen" below reports.
                if want == "PASS":
                    diffs.append(path)
            else:
                unexpected.append(f"{path} {arch}={s}")
    for path, e in sorted(entries.items()):
        want = e.expect.get(arch)
        if want and want != "PASS" and want not in seen.get(path, set()):
            notseen.append(f"{path} {arch}={want}")
    print(f"== {run.name} on {arch}: {len(expected)} expected, {len(unexpected)} unexpected, "
          f"{len(notseen)} expected but not seen, {len(diffs)} passing with output differences")
    if unexpected:
        print("-- unexpected (list lines):")
        print("\n".join(unexpected))
    if notseen:
        print("-- expected but not seen:")
        print("\n".join(notseen))
    if show_diffs and diffs:
        print("-- passing, output differs:")
        print("\n".join(f"{p} {arch}=DIFF" for p in diffs))
    return not unexpected


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("action", choices=("run", "judge", "skips"))
    ap.add_argument("--arch", required=True)
    ap.add_argument("--src")
    ap.add_argument("--build")
    ap.add_argument("--runs")
    ap.add_argument("--jobs", type=int, default=os.cpu_count() or 1)
    ap.add_argument("--diffs", action="store_true", help="list the passing tests whose output differs")
    ap.add_argument("rest", nargs="+", help="LIST... (judge: RUN LIST...)")
    a = ap.parse_args()
    if a.action == "skips":
        print("\n".join(skipped(read_lists(a.rest), a.arch)))
        return
    if a.action == "judge":
        run, lists = Path(a.rest[0]), a.rest[1:]
        sys.exit(0 if judge(run, read_lists(lists), a.arch, a.diffs) else 1)
    if not (a.src and a.build and a.runs):
        ap.error("run needs --src, --build and --runs")
    entries = read_lists(a.rest)
    n = write_skip_lists(a.src, entries, a.arch)
    print(f"== skipping {n} tests on {a.arch}")
    run = run_edgy(a.src, a.build, a.runs, a.jobs)
    sys.exit(0 if judge(run, entries, a.arch, a.diffs) else 1)


if __name__ == "__main__":
    main()
