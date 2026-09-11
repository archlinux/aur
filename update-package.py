#!/usr/bin/env python3
"""Update intellij-idea-open-eap from JetBrains intellij-community tags.

This script was written by Grok 4.5 (medium).

Always run interactively in a terminal (no CLI flags). The script finds a
newer qualifying IDEA tag, resolves its build number (prompting when Git /
YouTrack are not enough), edits PKGBUILD, refreshes checksums / .SRCINFO,
builds with ``makepkg -s`` (exit 13 = already built), installs with
``makepkg -i``, confirms the pacman package version, verifies
``product-info.json`` from the archive and install, asks ``y`` that IDEA
launches, commits, shows ``git log -p`` of unpushed commits vs upstream,
asks ``y`` to push, then ``git push``.

Pitfalls this encodes (from PKGBUILD comments and package Git history):

- Version tags may be ``idea/2026.3-eap-2`` or bare ``2025.3-rc-2`` (no
  ``idea/`` prefix). Ignore other products (PyCharm, WebStorm, …).
- An older yyyy.r line can still get new tags after a newer line has started
  (e.g. 2026.2.2 after 2026.3-eap). Never move the package backward to an
  older yyyy.r than it already uses.
- JetBrains sometimes retargets a tag to a new commit/build, or deletes a
  version tag while leaving a build-number tag (``idea/263.4732.28``). Prefer
  a matching-hash build-number tag; fall back to YouTrack; then prompt using
  snap Help → About on the host.
- Tag marketing names can disagree with the real product version (e.g.
  ``idea/2026.2.1-preview`` was 2026.2.0.1). Prefer YouTrack's stated version
  when an article is found.
- When a tag must be pinned by commit (historical retarget), set both
  ``_git_hash_override_idea`` and ``_git_hash_override_android``.
- Tags older than one year (by Git tag creator date/time) are ignored
  entirely.
- After that age filter, IDEA-ish tags that do not match the known
  version/build formats are a hard error (listed with local display date/times).
- Among tags with the same yyyy.r.n.m, “newer” uses Git tag creator
  date/time (not eap/beta/rc kind ranks). The local ``intellij-community``
  mirror is fetched first so a retargeted remote tag gets its bumped time.

Beyond ``base-devel``:

- ``python``
- ``git``
- ``pacman-contrib`` (``updpkgsums``)
- ``shellcheck``
- ``prettier`` with ``prettier-plugin-sh``

Child commands pass through to the terminal by default. Capture only when
parsing their output for script logic (no need to also echo that output).
"""

from __future__ import annotations

import json
import re
import subprocess
import sys
import tempfile
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass, field, replace
from datetime import UTC, datetime, timedelta
from enum import Enum, auto
from pathlib import Path
from types import MappingProxyType
from typing import NoReturn

# Oldest sentinel for undated tags when ranking (timezone-aware; zone arbitrary).
_OLDEST_MOMENT = datetime.min.replace(tzinfo=UTC)

IDEA_GIT = "https://github.com/JetBrains/intellij-community.git"
ANDROID_GIT = "https://github.com/JetBrains/android.git"
YOUTRACK_ARTICLE_API = "https://youtrack.jetbrains.com/api/articles"
PKGBUILD_NAME = "PKGBUILD"
PKGNAME = "intellij-idea-open-eap"
INSTALLED_PRODUCT_INFO = Path("/usr/share/idea/product-info.json")
PRODUCT_INFO_TAR_MEMBER = "usr/share/idea/product-info.json"
# product-info.json versionSuffix matches About (e.g. "EAP"), not tag eap_N.
KIND_TO_VERSION_SUFFIX = MappingProxyType(
    {
        "eap": "EAP",
        "beta": "Beta",
        "rc": "RC",
        "preview": "Preview",
    }
)

BUILD_NUMBER_RE = re.compile(r"^\d{3}\.\d+\.\d+$")
VERSION_CORE_RE = re.compile(
    r"^(?P<yyyy>\d{4})\.(?P<r>\d+)"
    r"(?:\.(?P<n>\d+)(?:\.(?P<m>\d+))?)?"
    r"(?:-(?P<pre>[A-Za-z]+(?:-\d+)?))?$"
)
YOUTRACK_SUMMARY_RE = re.compile(
    r"^IntelliJ IDEA\s+(?P<label>.+?)\s+\((?P<build>\d+\.\d+\.\d+)\s+build\)",
    re.IGNORECASE,
)
YOUTRACK_LABEL_RE = re.compile(
    r"^(?P<ver>\d{4}\.\d+(?:\.\d+){0,2})"
    r"(?:\s+(?P<kind>EAP|Beta|RC|Preview)(?:\s+(?P<num>\d+))?)?$",
    re.IGNORECASE,
)

ASSIGNMENT_RE = re.compile(
    r"^(?P<name>_version_yyyy_r_n_m|_build_number|"
    r"_pre_release_identifier_snake_case|_tag|"
    r"_git_hash_override_idea|_git_hash_override_android)"
    r"=(?P<value>.*)$",
    re.MULTILINE,
)


class TagKind(Enum):
    """Classification of one intellij-community tag name."""

    VERSION = auto()
    BUILD = auto()
    UNRECOGNIZED = auto()
    IRRELEVANT = auto()


@dataclass(frozen=True, order=True)
class VersionKey:
    """Numeric IDEA version yyyy.r.n.m (prerelease kind is not ranked)."""

    yyyy: int
    r: int
    n: int
    m: int


@dataclass
class ParsedVersion:
    key: VersionKey
    yyyy_r_n_m: str
    pre_snake: str
    tag_core: str
    pre_num: int


@dataclass(frozen=True, order=True)
class VersionCandidate:
    """One version tag ranked for “newest” selection."""

    key: VersionKey
    moment: datetime
    pre_num: int
    name: str
    sha: str = field(compare=False)
    parsed: ParsedVersion = field(compare=False)


@dataclass
class PkgState:
    version_yyyy_r_n_m: str
    build_number: str
    pre_snake: str
    tag: str
    git_hash_override_idea: str
    git_hash_override_android: str


@dataclass(frozen=True)
class ResolvedBuild:
    """Build number resolved from Git tag, YouTrack, or interactive prompt."""

    build_number: str
    source: str
    parsed: ParsedVersion


@dataclass(frozen=True)
class DiscoveredRelease:
    """Newest qualifying IDEA tag plus resolved build (before PKGBUILD compare)."""

    version_tag: str
    idea_sha: str
    parsed: ParsedVersion
    build_number: str
    build_number_source: str


@dataclass
class UpdatePlan:
    version_tag: str
    idea_sha: str
    android_sha: str
    build_number: str
    version_yyyy_r_n_m: str
    pre_snake: str
    use_hash_overrides: bool
    source_tag_for_pkgbuild: str
    build_number_source: str


@dataclass(frozen=True)
class ProductInfo:
    """Fields from product-info.json that About exposes."""

    version: str
    version_suffix: str
    build_number: str


def eprint(*args: object) -> None:
    print(*args, file=sys.stderr)


def info(message: str) -> None:
    """Script-owned status line (not subprocess/tool output)."""
    print(f"INFO: {message}")


def warn(message: str) -> None:
    """Script-owned warning line (not subprocess/tool output)."""
    print(f"WARNING: {message}")


def short_sha(sha: str) -> str:
    return sha[:7] if len(sha) >= 7 else sha


def format_tag(name: str, sha: str) -> str:
    """Tag name with short commit hash for script-authored console lines."""
    return f"{name} ({short_sha(sha)})"


def die(message: str) -> NoReturn:
    """Print an ERROR line and exit."""
    raise SystemExit(message if message.startswith("ERROR:") else f"ERROR: {message}")


def prompt_line(message: str, *, default: str | None = None) -> str:
    suffix = f" [{default}]" if default is not None else ""
    while True:
        try:
            raw = input(f"{message}{suffix}: ").strip()
        except EOFError:
            die("stdin closed while waiting for input; re-run in a terminal")
        if raw:
            return raw
        if default is not None:
            return default
        warn("please enter a value")


def prompt_yes(message: str, *, default: bool = False) -> bool:
    hint = "Y/n" if default else "y/N"
    while True:
        try:
            raw = input(f"{message} [{hint}]: ").strip().lower()
        except EOFError:
            die("stdin closed while waiting for yes/no; re-run in a terminal")
        if raw:
            if raw in {"y", "yes"}:
                return True
            if raw in {"n", "no"}:
                return False
            warn("please answer y or n")
            continue
        return default


def run(
    args: list[str],
    *,
    cwd: Path | None = None,
    check: bool = True,
    capture: bool = False,
) -> subprocess.CompletedProcess[str]:
    """Run a child command; pass through unless ``capture`` (for parsing)."""
    # Fixed argv list from this script; not a shell string built from untrusted input.
    return subprocess.run(  # noqa: S603
        args,
        cwd=cwd,
        check=check,
        text=True,
        capture_output=capture,
    )


def http_get_json(url: str) -> object:
    if not url.startswith("https://"):
        raise ValueError(f"refusing non-HTTPS URL: {url}")
    # URL is validated as https:// above; Request+urlopen are the HTTPS JSON fetch.
    request = urllib.request.Request(  # noqa: S310
        url,
        headers={
            "Accept": "application/json",
            "User-Agent": "intellij-idea-open-eap-update-package",
        },
    )
    # Same HTTPS-only fetch as the Request above.
    with urllib.request.urlopen(request, timeout=60) as response:  # noqa: S310
        return json.load(response)


# Ensure makepkg source mirrors.


def package_startdir() -> Path:
    return Path(__file__).resolve().parent


def ensure_makepkg_source_mirrors(repo: Path) -> Path:
    """Ensure makepkg git source mirrors exist via ``makepkg -o`` if needed.

    Returns the ``intellij-community`` mirror path (used for tag creator date/times).
    """
    idea = repo / "intellij-community"
    android = repo / "idea-android"
    if idea.is_dir() and android.is_dir():
        return idea
    missing = [path.name for path in (idea, android) if not path.is_dir()]
    info(
        "bootstrapping missing makepkg source mirror(s) via makepkg -o --nodeps: "
        + ", ".join(missing)
    )
    run(["makepkg", "-o", "--nodeps"], cwd=repo)
    if not idea.is_dir():
        die(
            f"makepkg -o did not create {idea}. "
            "If SRCDEST is set away from this package directory, point the "
            "script at that location or unset SRCDEST for this run."
        )
    if not android.is_dir():
        die(f"makepkg -o did not create {android}.")
    return idea


def fetch_idea_mirror(git_dir: Path) -> None:
    """Refresh the local intellij-community mirror before reading tag date/times.

    JetBrains sometimes retargets a tag to a new commit (new creator time). A
    stale mirror would keep the old time and mis-order same yyyy.r.n.m tags.
    Makepkg mirrors use a force-updating ``+refs/*:refs/*`` fetchspec.
    """
    info(f"fetching {git_dir.name} mirror for up-to-date tag date/times")
    completed = run(
        ["git", "--git-dir", str(git_dir), "fetch", "--prune"],
        check=False,
    )
    if completed.returncode != 0:
        warn(
            f"failed to fetch {git_dir.name} mirror; "
            "tag date/times may be stale if a remote tag was retargeted"
        )


# Read PKGBUILD.


def parse_pkgbuild_version_floor(yyyy_r_n_m: str) -> tuple[int, int]:
    parts = yyyy_r_n_m.split(".")
    if len(parts) < 2:
        raise ValueError(f"invalid _version_yyyy_r_n_m: {yyyy_r_n_m}")
    return int(parts[0]), int(parts[1])


def read_pkgbuild(path: Path) -> tuple[str, PkgState]:
    text = path.read_text(encoding="utf-8")
    values: dict[str, str] = {}
    for match in ASSIGNMENT_RE.finditer(text):
        raw = match.group("value").strip()
        if raw.startswith(("'", '"')) and raw.endswith(("'", '"')) and len(raw) >= 2:
            raw = raw[1:-1]
        values[match.group("name")] = raw
    required = (
        "_version_yyyy_r_n_m",
        "_build_number",
        "_pre_release_identifier_snake_case",
        "_tag",
        "_git_hash_override_idea",
        "_git_hash_override_android",
    )
    missing = [name for name in required if name not in values]
    if missing:
        die(f"PKGBUILD missing assignments: {', '.join(missing)}")
    state = PkgState(
        version_yyyy_r_n_m=values["_version_yyyy_r_n_m"],
        build_number=values["_build_number"],
        pre_snake=values["_pre_release_identifier_snake_case"],
        tag=values["_tag"],
        git_hash_override_idea=values["_git_hash_override_idea"],
        git_hash_override_android=values["_git_hash_override_android"],
    )
    return text, state


def replace_assignments(text: str, replacements: dict[str, str]) -> str:
    new_text = text
    for name, value in replacements.items():
        pattern = re.compile(rf"^{name}=.*$", re.MULTILINE)
        rendered = f"{name}={value}"
        new_text, count = pattern.subn(rendered, new_text, count=1)
        if count != 1:
            die(f"failed to rewrite {name}")
    return new_text


# Discover release candidate.


def load_remote_tags(repo_url: str) -> dict[str, str]:
    """Return tag name → peeled commit SHA."""
    info(f"listing tags: {repo_url}")
    completed = run(
        ["git", "ls-remote", "--tags", repo_url],
        capture=True,
    )
    tags: dict[str, dict[str, str]] = {}
    for line in completed.stdout.splitlines():
        if not line.strip():
            continue
        sha, ref = line.split()
        if not ref.startswith("refs/tags/"):
            continue
        name = ref[len("refs/tags/") :]
        peeled = name.endswith("^{}")
        if peeled:
            name = name[:-3]
        bucket = tags.setdefault(name, {})
        bucket["peeled" if peeled else "tag"] = sha
    return {name: data.get("peeled") or data["tag"] for name, data in tags.items()}


def tag_core_name(tag_name: str) -> str:
    if tag_name.startswith("idea/"):
        return tag_name[5:]
    return tag_name


def classify_tag(tag_name: str) -> TagKind:
    """Classify one tag: IDEA version/build, unrecognized idea-ish, or ignore.

    Non-``idea/`` product prefixes (``pycharm/``, …) are irrelevant because of
    the slash rule — no separate product catalog.
    """
    if tag_name.startswith("idea/"):
        core = tag_name[5:]
        idea_ish = True
    elif "/" in tag_name:
        return TagKind.IRRELEVANT
    else:
        core = tag_name
        idea_ish = bool(re.match(r"^\d{4}\.", tag_name))

    if BUILD_NUMBER_RE.fullmatch(core):
        return TagKind.BUILD
    if VERSION_CORE_RE.fullmatch(core) is not None:
        return TagKind.VERSION
    if idea_ish:
        return TagKind.UNRECOGNIZED
    return TagKind.IRRELEVANT


def parse_version_core(core: str) -> ParsedVersion | None:
    match = VERSION_CORE_RE.fullmatch(core)
    if match is None:
        return None
    yyyy = int(match.group("yyyy"))
    r = int(match.group("r"))
    n = int(match.group("n") or 0)
    m = int(match.group("m") or 0)
    pre = match.group("pre")
    if pre is None:
        pre_num = 0
        pre_snake = ""
    else:
        pre_match = re.fullmatch(r"([A-Za-z]+)(?:-(\d+))?", pre)
        if pre_match is None:
            return None
        pre_num = int(pre_match.group(2) or 0)
        pre_snake = pre.lower().replace("-", "_")
    return ParsedVersion(
        key=VersionKey(yyyy, r, n, m),
        yyyy_r_n_m=f"{yyyy}.{r}.{n}.{m}",
        pre_snake=pre_snake,
        tag_core=core,
        pre_num=pre_num,
    )


def unrecognized_idea_tags(idea_tags: dict[str, str]) -> list[str]:
    """IDEA-ish names that are neither known version tags nor build-number tags."""
    return sorted(
        name for name in idea_tags if classify_tag(name) is TagKind.UNRECOGNIZED
    )


def parse_iso_datetime(raw: str) -> datetime | None:
    """Parse an ISO-8601 date/time; return None when unparseable."""
    text = raw.strip()
    if text.endswith("Z"):
        text = text[:-1] + "+00:00"
    try:
        moment = datetime.fromisoformat(text)
    except ValueError:
        return None
    if moment.tzinfo is None:
        moment = moment.replace(tzinfo=UTC)
    return moment


def format_local_iso(moment: datetime) -> str:
    """Local-zone display date/time with offset; space instead of T; no fractional seconds."""
    return moment.astimezone().isoformat(timespec="seconds").replace("T", " ", 1)


def load_local_tag_datetimes(repo: Path) -> dict[str, datetime]:
    """Return tag name → creator date/time from the local IDEA git dir."""
    git_dir = ensure_makepkg_source_mirrors(repo)
    fetch_idea_mirror(git_dir)
    completed = run(
        [
            "git",
            "--git-dir",
            str(git_dir),
            "for-each-ref",
            "--format=%(creatordate:iso-strict)\t%(refname:strip=2)",
            "refs/tags",
        ],
        check=False,
        capture=True,
    )
    if completed.returncode != 0:
        warn("failed to read tag date/times; continuing without them")
        return {}
    moments: dict[str, datetime] = {}
    for line in completed.stdout.splitlines():
        if "\t" not in line:
            continue
        raw, name = line.split("\t", 1)
        moment = parse_iso_datetime(raw)
        if moment is not None:
            moments[name] = moment
    return moments


def commit_datetime(sha: str, repo: Path | None = None) -> datetime | None:
    """Return committer date/time from the local IDEA mirror when resolvable."""
    git_dir = ensure_makepkg_source_mirrors(
        repo if repo is not None else package_startdir()
    )
    completed = run(
        ["git", "--git-dir", str(git_dir), "log", "-1", "--format=%cI", sha],
        check=False,
        capture=True,
    )
    if completed.returncode != 0:
        return None
    return parse_iso_datetime(completed.stdout.strip())


def tag_datetime(
    name: str, sha: str, tag_datetimes: dict[str, datetime]
) -> datetime | None:
    """Prefer annotated-tag creator date/time; fall back to commit date/time."""
    if name in tag_datetimes:
        return tag_datetimes[name]
    return commit_datetime(sha)


def tag_age_cutoff(now: datetime | None = None) -> datetime:
    run_now = now if now is not None else datetime.now(UTC)
    if run_now.tzinfo is None:
        run_now = run_now.replace(tzinfo=UTC)
    return run_now - timedelta(days=365)


def filter_tags_older_than_one_year(
    tags: dict[str, str],
    tag_datetimes: dict[str, datetime],
    *,
    now: datetime | None = None,
) -> dict[str, str]:
    """Drop tags whose creator date/time is more than one year before ``now``.

    Tags with no known creator date/time are kept so brand-new remote tags
    missing from the local mirror are not silently discarded.
    """
    cutoff = tag_age_cutoff(now)
    kept: dict[str, str] = {}
    for name, sha in tags.items():
        moment = tag_datetimes.get(name)
        if moment is None:
            kept[name] = sha
            continue
        if moment >= cutoff:
            kept[name] = sha
    dropped = len(tags) - len(kept)
    if dropped:
        info(
            f"ignored {dropped} tag(s) older than one year "
            f"(before {format_local_iso(cutoff)})"
        )
    return kept


def choose_version_tag(
    idea_tags: dict[str, str],
    floor: tuple[int, int],
    tag_datetimes: dict[str, datetime],
) -> VersionCandidate:
    """Pick the newest qualifying version tag.

    Order by numeric yyyy.r.n.m, then Git tag creator date/time (not
    prerelease kind ranks such as eap/beta/rc), then prerelease number, then
    tag name. Ranking may use any timezone; display uses the local zone.
    """
    best: VersionCandidate | None = None
    for name, sha in idea_tags.items():
        if classify_tag(name) is not TagKind.VERSION:
            continue
        parsed = parse_version_core(tag_core_name(name))
        if parsed is None:
            continue
        if (parsed.key.yyyy, parsed.key.r) < floor:
            continue
        # Undated tags sort as oldest so a dated peer of the same version wins.
        moment = tag_datetime(name, sha, tag_datetimes) or _OLDEST_MOMENT
        candidate = VersionCandidate(
            key=parsed.key,
            moment=moment,
            pre_num=parsed.pre_num,
            name=name,
            sha=sha,
            parsed=parsed,
        )
        if best is None or candidate > best:
            best = candidate
    if best is None:
        sample = ", ".join(sorted(idea_tags)[-15:])
        die(
            "no qualifying IDEA version tags found at or above the package floor "
            f"{floor[0]}.{floor[1]}. "
            "Expected names like idea/2026.3-eap-2 or bare 2025.3-rc-2. "
            f"Last tags seen (unsorted sample): {sample}"
        )
    return best


def fail_on_unrecognized_tags(
    unknown: list[str],
    tag_datetimes: dict[str, datetime],
    idea_tags: dict[str, str],
) -> None:
    if not unknown:
        return
    lines = [
        (
            "ERROR: IDEA-ish tags that do not match the known version or "
            "build-number formats (after ignoring tags older than one year):"
        )
    ]
    for name in unknown[:40]:
        sha = idea_tags.get(name, "")
        moment = tag_datetime(name, sha, tag_datetimes) if sha else None
        shown = format_local_iso(moment) if moment is not None else "unknown"
        label = format_tag(name, sha) if sha else name
        lines.append(f"  {shown}  {label}")
    if len(unknown) > 40:
        lines.append(f"  … and {len(unknown) - 40} more")
    lines.append(
        "Extend the version/build parser if one of these is a real release, "
        "then re-run."
    )
    raise SystemExit("\n".join(lines))


def parse_youtrack_summary(summary: str) -> tuple[ParsedVersion, str] | None:
    """Parse 'IntelliJ IDEA <label> (<build> build)' into version + build."""
    match = YOUTRACK_SUMMARY_RE.match(summary.strip())
    if match is None:
        return None
    label = match.group("label").strip()
    build = match.group("build")
    label_match = YOUTRACK_LABEL_RE.match(label)
    if label_match is None:
        return None
    ver = label_match.group("ver")
    kind = label_match.group("kind")
    num = label_match.group("num")
    if kind is None:
        core = ver
    else:
        kind_l = kind.lower()
        core = f"{ver}-{kind_l}-{num}" if num else f"{ver}-{kind_l}"
    # Prefer the label's numeric portion (may be fuller than a Git tag core).
    parts = ver.split(".")
    while len(parts) < 4:
        parts.append("0")
    yyyy_r_n_m = ".".join(parts[:4])
    yyyy, r, n, m = (int(part) for part in yyyy_r_n_m.split("."))
    parsed_core = parse_version_core(core)
    pre_snake = parsed_core.pre_snake if parsed_core is not None else ""
    pre_num = parsed_core.pre_num if parsed_core is not None else int(num or 0)
    if parsed_core is None and kind is not None:
        pre_snake = kind.lower() if num is None else f"{kind.lower()}_{num}"
    return (
        ParsedVersion(
            key=VersionKey(yyyy, r, n, m),
            yyyy_r_n_m=yyyy_r_n_m,
            pre_snake=pre_snake,
            tag_core=core,
            pre_num=pre_num,
        ),
        build,
    )


def youtrack_children(article_id: str) -> list[dict[str, str]]:
    url = (
        f"{YOUTRACK_ARTICLE_API}/{urllib.parse.quote(article_id)}"
        f"?fields=idReadable,summary,childArticles(id,idReadable,summary)"
    )
    data = http_get_json(url)
    if not isinstance(data, dict):
        raise TypeError(
            f"YouTrack article JSON was {type(data).__name__}, expected dict"
        )
    children = data.get("childArticles") or []
    if not isinstance(children, list):
        raise TypeError(
            f"YouTrack childArticles was {type(children).__name__}, expected list"
        )
    return children


def youtrack_search(query: str, top: int = 30) -> list[dict[str, str]]:
    url = f"{YOUTRACK_ARTICLE_API}?" + urllib.parse.urlencode(
        {
            "query": query,
            "fields": "idReadable,summary",
            "$top": str(top),
        }
    )
    data = http_get_json(url)
    if not isinstance(data, list):
        raise TypeError(
            f"YouTrack search JSON was {type(data).__name__}, expected list"
        )
    return data


def find_youtrack_for_tag(
    parsed_from_tag: ParsedVersion,
) -> tuple[ParsedVersion, str, str] | None:
    """Match a child of the line's 'Latest Builds' YouTrack article.

    One search for that parent, then its children — no extra free-text searches.
    """
    yyyy_r = f"{parsed_from_tag.key.yyyy}.{parsed_from_tag.key.r}"
    parent_summary = f"IntelliJ IDEA {yyyy_r} Latest Builds"
    parents = youtrack_search(parent_summary, top=10)
    line_parent = next(
        (
            article.get("idReadable")
            for article in parents
            if (article.get("summary") or "") == parent_summary
        ),
        None,
    )
    if not line_parent:
        return None

    for article in youtrack_children(line_parent):
        article_id = article.get("idReadable") or ""
        summary = article.get("summary") or ""
        if not article_id:
            continue
        parsed = parse_youtrack_summary(summary)
        if parsed is None:
            continue
        yt_version, build = parsed
        if parsed_from_tag.pre_snake:
            if yt_version.pre_snake != parsed_from_tag.pre_snake:
                continue
        elif yt_version.pre_snake:
            continue
        return yt_version, build, article_id
    return None


def prompt_build_number(version_tag: str, idea_sha: str) -> str:
    warn(
        "could not resolve a build number for "
        f"{format_tag(version_tag, idea_sha)} from a matching-hash Git tag or "
        "YouTrack"
    )
    info("recover on the host:")
    info("  1. snap install intellij-idea --classic --edge")
    info("  2. launch IDEA → Help → About")
    info("  3. copy the build number (example: 263.4732.28)")
    info(
        "or open "
        "https://youtrack.jetbrains.com/articles/IDEA-A-21/"
        "IDEA-Latest-Builds-And-Release-Notes"
    )
    while True:
        raw = prompt_line("Build number")
        if BUILD_NUMBER_RE.fullmatch(raw):
            return raw
        warn(
            f"{raw!r} is not MAJOR.MINOR.PATCH with a 3-digit major "
            "(example: 263.4732.28); try again"
        )


def resolve_build_number(
    idea_tags: dict[str, str],
    version_tag: str,
    idea_sha: str,
    parsed_from_tag: ParsedVersion,
) -> ResolvedBuild:
    """Resolve build number from a matching-hash tag, YouTrack, or a prompt."""
    matching_build_tags = sorted(
        name
        for name, sha in idea_tags.items()
        if classify_tag(name) is TagKind.BUILD and sha == idea_sha
    )
    if matching_build_tags:
        chosen = matching_build_tags[0]
        if len(matching_build_tags) > 1:
            warn(
                "multiple build-number tags share this commit: "
                + ", ".join(format_tag(name, idea_sha) for name in matching_build_tags)
            )
            info(
                "several build-number tags point at the same commit as "
                f"{format_tag(version_tag, idea_sha)}:"
            )
            for index, name in enumerate(matching_build_tags, start=1):
                info(f"  {index}. {format_tag(name, idea_sha)}")
            raw = prompt_line(
                "Choose build-number tag by number or full name",
                default="1",
            )
            if raw.isdigit():
                index = int(raw)
                if index < 1 or index > len(matching_build_tags):
                    die(f"choice {raw} is out of range")
                chosen = matching_build_tags[index - 1]
            elif raw in matching_build_tags:
                chosen = raw
            else:
                die(f"{raw!r} is not one of: {', '.join(matching_build_tags)}")
        return ResolvedBuild(
            build_number=tag_core_name(chosen),
            source=f"git tag {chosen}",
            parsed=parsed_from_tag,
        )

    warn(f"no build-number tag shares {format_tag(version_tag, idea_sha)}'s commit")
    yt = find_youtrack_for_tag(parsed_from_tag)
    if yt is not None:
        yt_version, build, article_id = yt
        info(f"YouTrack {article_id} supplies build {build}")
        if yt_version.yyyy_r_n_m != parsed_from_tag.yyyy_r_n_m:
            warn(
                "YouTrack product version "
                f"{yt_version.yyyy_r_n_m} differs from tag-derived "
                f"{parsed_from_tag.yyyy_r_n_m}; preferring YouTrack"
            )
        return ResolvedBuild(
            build_number=build,
            source=f"YouTrack {article_id}",
            parsed=yt_version,
        )

    build = prompt_build_number(version_tag, idea_sha)
    info("build number entered interactively after Git/YouTrack miss")
    return ResolvedBuild(
        build_number=build,
        source="interactive prompt",
        parsed=parsed_from_tag,
    )


def discover_release(
    state: PkgState,
    idea_tags: dict[str, str],
    *,
    repo: Path,
) -> tuple[DiscoveredRelease, dict[str, str]]:
    """Age-filter tags, choose newest version tag, resolve build number.

    Returns the discovery result and the age-filtered idea tag map (for compare).
    """
    moments = load_local_tag_datetimes(repo)
    idea_tags = filter_tags_older_than_one_year(idea_tags, moments)
    floor = parse_pkgbuild_version_floor(state.version_yyyy_r_n_m)
    fail_on_unrecognized_tags(unrecognized_idea_tags(idea_tags), moments, idea_tags)
    chosen = choose_version_tag(idea_tags, floor, moments)
    resolved = resolve_build_number(
        idea_tags,
        chosen.name,
        chosen.sha,
        chosen.parsed,
    )
    info(
        f"chose {format_tag(chosen.name, chosen.sha)}; "
        f"build {resolved.build_number} via {resolved.source}"
    )
    discovered = DiscoveredRelease(
        version_tag=chosen.name,
        idea_sha=chosen.sha,
        parsed=resolved.parsed,
        build_number=resolved.build_number,
        build_number_source=resolved.source,
    )
    return discovered, idea_tags


# Compare to PKGBUILD and complete plan.


def compare_to_pkgbuild(
    state: PkgState,
    discovered: DiscoveredRelease,
    idea_tags: dict[str, str],
) -> UpdatePlan | None:
    """Return a plan skeleton when PKGBUILD differs; None when already current."""
    version_tag = discovered.version_tag
    idea_sha = discovered.idea_sha
    parsed = discovered.parsed
    build_number = discovered.build_number

    # PKGBUILD may still name a version tag JetBrains deleted after retargeting;
    # history then pinned via build-number tag or hash overrides.
    if state.tag and state.tag not in idea_tags:
        warn(
            f"PKGBUILD _tag {state.tag} is missing from intellij-community; "
            "JetBrains may have deleted or rewritten it"
        )
    elif (
        state.tag
        and state.tag in idea_tags
        and state.tag == version_tag
        and idea_tags[state.tag] != idea_sha
    ):
        warn(
            f"tag {format_tag(state.tag, idea_tags[state.tag])} commit moved on "
            f"the remote (now {short_sha(idea_sha)})"
        )

    same_release = (
        state.tag == version_tag
        and state.build_number == build_number
        and state.version_yyyy_r_n_m == parsed.yyyy_r_n_m
        and state.pre_snake == parsed.pre_snake
        and not state.git_hash_override_idea
    )
    if same_release:
        return None

    # Retarget: same version tag name as PKGBUILD, but commit/build moved.
    if state.tag == version_tag and state.build_number != build_number:
        warn(
            f"tag {format_tag(version_tag, idea_sha)} retargeted: build "
            f"{state.build_number} → {build_number}"
        )

    return UpdatePlan(
        version_tag=version_tag,
        idea_sha=idea_sha,
        android_sha="",
        build_number=build_number,
        version_yyyy_r_n_m=parsed.yyyy_r_n_m,
        pre_snake=parsed.pre_snake,
        use_hash_overrides=False,
        source_tag_for_pkgbuild=version_tag,
        build_number_source=discovered.build_number_source,
    )


def complete_plan(plan: UpdatePlan, android_tags: dict[str, str]) -> UpdatePlan:
    """Fill android SHA / hash overrides when the android tag is missing."""
    android_sha = android_tags.get(plan.version_tag)
    if android_sha is not None:
        return replace(plan, android_sha=android_sha)

    warn(
        f"android repo lacks tag {format_tag(plan.version_tag, plan.idea_sha)}; "
        "hash overrides need the matching android commit SHA"
    )
    info(f"look up tags at {ANDROID_GIT} or the android mirror checkout")
    android_sha = prompt_line("Android commit SHA")
    info("android SHA entered interactively")
    return replace(
        plan,
        android_sha=android_sha,
        use_hash_overrides=True,
        source_tag_for_pkgbuild="",
    )


# Apply PKGBUILD edit.


def apply_plan(pkgbuild_text: str, plan: UpdatePlan) -> str:
    replacements = {
        "_version_yyyy_r_n_m": plan.version_yyyy_r_n_m,
        "_build_number": plan.build_number,
        "_pre_release_identifier_snake_case": plan.pre_snake,
        "_tag": plan.source_tag_for_pkgbuild,
        "_git_hash_override_idea": plan.idea_sha if plan.use_hash_overrides else "",
        "_git_hash_override_android": (
            plan.android_sha if plan.use_hash_overrides else ""
        ),
    }
    return replace_assignments(pkgbuild_text, replacements)


def prettier_plugin_path() -> str:
    candidates = [
        "/usr/lib/node_modules/prettier-plugin-sh/lib/index.cjs",
        str(Path.home() / ".local/lib/node_modules/prettier-plugin-sh/lib/index.cjs"),
    ]
    for path in candidates:
        if Path(path).is_file():
            return path
    return "prettier-plugin-sh"


def post_edit_verify(repo: Path) -> None:
    info("refreshing checksums, formatting PKGBUILD, and regenerating .SRCINFO")
    run(["updpkgsums"], cwd=repo)
    run(
        [
            "shellcheck",
            "--shell=bash",
            "--exclude=SC2034,SC2154,SC2164",
            PKGBUILD_NAME,
        ],
        cwd=repo,
    )
    run(
        [
            "prettier",
            "--plugin",
            prettier_plugin_path(),
            "--parser",
            "sh",
            PKGBUILD_NAME,
            "--write",
        ],
        cwd=repo,
    )
    srcinfo = run(["makepkg", "--printsrcinfo"], cwd=repo, capture=True)
    (repo / ".SRCINFO").write_text(srcinfo.stdout, encoding="utf-8")


def print_plan(
    state: PkgState,
    plan: UpdatePlan,
    *,
    idea_tags: dict[str, str],
) -> None:
    if state.tag and state.tag in idea_tags:
        current_tag = format_tag(state.tag, idea_tags[state.tag])
    else:
        current_tag = state.tag or "(none)"
    info(
        f"current: tag={current_tag} version={state.version_yyyy_r_n_m} "
        f"build={state.build_number} pre={state.pre_snake or '(release)'}"
    )
    info(
        f"update:  tag={format_tag(plan.version_tag, plan.idea_sha)} "
        f"version={plan.version_yyyy_r_n_m} "
        f"build={plan.build_number} pre={plan.pre_snake or '(release)'}"
    )
    if plan.use_hash_overrides:
        info(
            f"source mode: hash overrides "
            f"(idea={plan.idea_sha} android={plan.android_sha})"
        )
    else:
        info(
            "source mode: tag "
            f"{format_tag(plan.source_tag_for_pkgbuild, plan.idea_sha)}"
        )
    git_tag_prefix = "git tag "
    if plan.build_number_source.startswith(git_tag_prefix):
        build_tag = plan.build_number_source[len(git_tag_prefix) :]
        info("build number source: git tag " f"{format_tag(build_tag, plan.idea_sha)}")
    else:
        info(f"build number source: {plan.build_number_source}")


# Build and install.


def planned_pkgver(plan: UpdatePlan) -> str:
    pkgver = f"{plan.version_yyyy_r_n_m}.{plan.build_number}"
    if plan.pre_snake:
        pkgver = f"{pkgver}.{plan.pre_snake}"
    return pkgver


def find_built_package(repo: Path, plan: UpdatePlan) -> Path | None:
    pattern = f"{PKGNAME}-{planned_pkgver(plan)}-*-x86_64.pkg.tar.*"
    matches = sorted(path for path in repo.glob(pattern) if path.is_file())
    return matches[-1] if matches else None


def pkgrel_from_pkgbuild(repo: Path) -> str:
    match = re.search(
        r"^pkgrel=(\d+)\s*$",
        (repo / PKGBUILD_NAME).read_text(encoding="utf-8"),
        re.MULTILINE,
    )
    if match is None:
        die(f"could not read pkgrel from {repo / PKGBUILD_NAME}")
    return match.group(1)


def confirm_pacman_installed(repo: Path, plan: UpdatePlan) -> None:
    expected = f"{planned_pkgver(plan)}-{pkgrel_from_pkgbuild(repo)}"
    completed = run(["pacman", "-Q", PKGNAME], check=False, capture=True)
    if completed.returncode != 0:
        die(f"pacman does not report {PKGNAME} as installed")
    parts = completed.stdout.strip().split()
    if len(parts) != 2:
        die(f"unexpected pacman -Q {PKGNAME} output: {completed.stdout!r}")
    actual = parts[1]
    if actual != expected:
        die(
            f"pacman reports {PKGNAME} {actual}, expected {expected}; "
            "install the package built from this PKGBUILD before continuing"
        )
    info(f"pacman: {PKGNAME} {actual} is installed")


def build_package(repo: Path, plan: UpdatePlan) -> Path:
    """Build with makepkg -s; exit 13 means the archive already exists."""
    info("running makepkg -s (build only)")
    completed = run(["makepkg", "-s"], cwd=repo, check=False)
    if completed.returncode not in {0, 13}:
        die(f"makepkg -s failed with exit status {completed.returncode}")
    if completed.returncode == 13:
        info("continuing with the existing already-built archive")
    built = find_built_package(repo, plan)
    if built is None:
        die(
            "no package matching "
            f"{PKGNAME}-{planned_pkgver(plan)}-*-x86_64.pkg.tar.* was found "
            "after makepkg -s"
        )
    return built


def build_and_install(repo: Path, plan: UpdatePlan) -> bool:
    """Build, install, and confirm via pacman. Return True when that ran."""
    if not prompt_yes(
        "Build and install the package with makepkg now?",
        default=True,
    ):
        warn(
            "skipping makepkg; install this PKGBUILD on the workstation before "
            "the product-info and launch checks"
        )
        return False

    package_path = build_package(repo, plan)
    info(f"installing {package_path.name} with makepkg -i")
    run(["makepkg", "-i"], cwd=repo)
    confirm_pacman_installed(repo, plan)
    return True


# Verify product-info and launch.


def expected_product_info(plan: UpdatePlan) -> ProductInfo:
    """About/product-info version line uses yyyy.r plus suffix kind, not eap_N."""
    parts = plan.version_yyyy_r_n_m.split(".")
    if len(parts) < 2:
        die(f"invalid plan version_yyyy_r_n_m: {plan.version_yyyy_r_n_m}")
    version = f"{parts[0]}.{parts[1]}"
    if not plan.pre_snake:
        suffix = ""
    else:
        kind = plan.pre_snake.split("_", 1)[0]
        suffix = KIND_TO_VERSION_SUFFIX.get(kind, kind.upper())
    return ProductInfo(version, suffix, plan.build_number)


def format_about_version(product: ProductInfo) -> str:
    if product.version_suffix:
        return f"{product.version} {product.version_suffix}"
    return product.version


def parse_product_info_json(raw: str) -> ProductInfo:
    try:
        payload = json.loads(raw)
    except json.JSONDecodeError as error:
        die(f"product-info.json is not valid JSON: {error}")
    if not isinstance(payload, dict):
        die(f"product-info.json was {type(payload).__name__}, expected object")
    version = payload.get("version")
    build_number = payload.get("buildNumber")
    suffix = payload.get("versionSuffix") or ""
    if not isinstance(version, str) or not version:
        die("product-info.json missing string 'version'")
    if not isinstance(build_number, str) or not build_number:
        die("product-info.json missing string 'buildNumber'")
    if not isinstance(suffix, str):
        die("product-info.json 'versionSuffix' must be a string when present")
    return ProductInfo(version, suffix, build_number)


def read_product_info_from_package(package_path: Path) -> ProductInfo:
    completed = run(
        ["tar", "-xOf", str(package_path), PRODUCT_INFO_TAR_MEMBER],
        capture=True,
    )
    return parse_product_info_json(completed.stdout)


def verify_product_info(
    source: str, actual: ProductInfo, expected: ProductInfo
) -> None:
    info(
        f"{source}: version={format_about_version(actual)!r} "
        f"build={actual.build_number}"
    )
    mismatches: list[str] = []
    if actual.version != expected.version:
        mismatches.append(
            f"version {actual.version!r} != expected {expected.version!r}"
        )
    if actual.version_suffix != expected.version_suffix:
        mismatches.append(
            f"versionSuffix {actual.version_suffix!r} != expected "
            f"{expected.version_suffix!r}"
        )
    if actual.build_number != expected.build_number:
        mismatches.append(
            f"buildNumber {actual.build_number!r} != expected "
            f"{expected.build_number!r}"
        )
    if mismatches:
        die(f"{source} does not match the planned release: " + "; ".join(mismatches))
    info(f"{source}: matches planned release")


def confirm_release_and_launch(
    repo: Path, plan: UpdatePlan, *, installed: bool
) -> None:
    """Verify product-info; require y that IDEA launches.

    When ``installed`` (makepkg ran): require the built archive and installed
    product-info.json, then verify both. Otherwise: best-effort verify of
    whatever is present, warn on misses.
    """
    expected = expected_product_info(plan)
    info(
        "expected About-style version="
        f"{format_about_version(expected)!r} build={expected.build_number}"
    )
    info(f"(tag form remains {tag_core_name(plan.version_tag)!r})")

    package_path = find_built_package(repo, plan)
    package_pattern = f"{PKGNAME}-{planned_pkgver(plan)}-*-x86_64.pkg.tar.*"

    if installed:
        if package_path is None:
            die(f"makepkg ran but no package matching {package_pattern} was found")
        if not INSTALLED_PRODUCT_INFO.is_file():
            die(
                f"makepkg install finished but {INSTALLED_PRODUCT_INFO} is missing; "
                "not committing"
            )
        info(f"reading {PRODUCT_INFO_TAR_MEMBER} from {package_path.name}")
        verify_product_info(
            f"package {package_path.name}",
            read_product_info_from_package(package_path),
            expected,
        )
        info(f"reading installed {INSTALLED_PRODUCT_INFO}")
        verify_product_info(
            "installed product-info.json",
            parse_product_info_json(INSTALLED_PRODUCT_INFO.read_text(encoding="utf-8")),
            expected,
        )
    else:
        if package_path is not None:
            info(f"reading {PRODUCT_INFO_TAR_MEMBER} from {package_path.name}")
            verify_product_info(
                f"package {package_path.name}",
                read_product_info_from_package(package_path),
                expected,
            )
        else:
            warn(f"no built package matching {package_pattern} found to verify")

        if INSTALLED_PRODUCT_INFO.is_file():
            info(f"reading installed {INSTALLED_PRODUCT_INFO}")
            verify_product_info(
                "installed product-info.json",
                parse_product_info_json(
                    INSTALLED_PRODUCT_INFO.read_text(encoding="utf-8")
                ),
                expected,
            )
        else:
            warn(
                f"{INSTALLED_PRODUCT_INFO} not found; install this package on the "
                "workstation before the launch check"
            )

    info("launch IDEA (Help → About should match the expected line above)")
    if not prompt_yes("Does IDEA launch successfully?", default=False):
        die("IDEA launch not confirmed; not committing")


# Commit and push.


def commit_update(repo: Path, plan: UpdatePlan) -> None:
    subject = f"Update to {plan.version_tag} tag"
    if len(subject) > 50:
        subject = f"Update to {plan.build_number}"
    if plan.use_hash_overrides:
        message = (
            f"{subject}\n\n"
            f"Pinned idea={plan.idea_sha} android={plan.android_sha} "
            "via hash overrides.\n"
        )
    else:
        message = subject + "\n"
    with tempfile.NamedTemporaryFile("w", encoding="utf-8", delete=False) as handle:
        handle.write(message)
        path = handle.name
    try:
        run(["git", "add", PKGBUILD_NAME, ".SRCINFO"], cwd=repo)
        # Natural git identity (config / env); no script override.
        run(["git", "commit", "-F", path], cwd=repo)
    finally:
        Path(path).unlink()
    info(f"committed: {subject}")


def upstream_branch(repo: Path) -> str:
    completed = run(
        ["git", "rev-parse", "--abbrev-ref", "@{upstream}"],
        cwd=repo,
        check=False,
        capture=True,
    )
    upstream = completed.stdout.strip()
    if completed.returncode != 0 or not upstream:
        die(
            "no upstream branch configured (git rev-parse @{upstream} failed); "
            "set upstream before push"
        )
    return upstream


def show_unpushed_log(repo: Path, upstream: str) -> None:
    info(f"unpushed commits relative to {upstream} (full patches):")
    # Interactive: let git write the log/diff straight to the terminal.
    run(
        ["git", "log", f"{upstream}..HEAD", "-p", "-U"],
        cwd=repo,
    )


def commit_and_push(repo: Path, plan: UpdatePlan) -> None:
    """Commit after launch confirm, show unpushed diff, then push on y."""
    commit_update(repo, plan)
    upstream = upstream_branch(repo)
    show_unpushed_log(repo, upstream)
    if not prompt_yes(f"Push unpushed commits to {upstream}?", default=False):
        die("push declined; commit(s) remain local only")
    info(f"running git push (to {upstream})")
    run(["git", "push"], cwd=repo)
    info("push finished")


# Program entry.


def main() -> int:
    repo = package_startdir()
    pkgbuild_path = repo / PKGBUILD_NAME
    if not pkgbuild_path.is_file():
        die(f"missing {pkgbuild_path}")

    info(f"package directory: {repo}")
    ensure_makepkg_source_mirrors(repo)

    text, state = read_pkgbuild(pkgbuild_path)
    idea_tags = load_remote_tags(IDEA_GIT)
    if state.tag and state.tag in idea_tags:
        current_tag = format_tag(state.tag, idea_tags[state.tag])
    else:
        current_tag = state.tag or "(none)"
    info(
        f"current: tag={current_tag} "
        f"version={state.version_yyyy_r_n_m} build={state.build_number} "
        f"pre={state.pre_snake or '(release)'}"
    )

    discovered, idea_tags = discover_release(
        state,
        idea_tags,
        repo=repo,
    )
    plan = compare_to_pkgbuild(state, discovered, idea_tags)
    if plan is None:
        info("PKGBUILD already matches the newest qualifying IDEA tag; nothing to do")
        return 0
    plan = complete_plan(plan, load_remote_tags(ANDROID_GIT))

    print_plan(state, plan, idea_tags=idea_tags)
    if not prompt_yes("Apply these PKGBUILD changes?", default=True):
        die("stopped before editing PKGBUILD")

    info(f"writing {PKGBUILD_NAME}")
    pkgbuild_path.write_text(apply_plan(text, plan), encoding="utf-8")
    post_edit_verify(repo)

    installed = build_and_install(repo, plan)
    confirm_release_and_launch(repo, plan, installed=installed)
    commit_and_push(repo, plan)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except subprocess.CalledProcessError as error:
        eprint(f"ERROR: {error}")
        raise SystemExit(error.returncode) from error
