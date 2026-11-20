#!/usr/bin/env python3
"""Update the intellij-idea-open-eap AUR package to the newest IDEA tag.

This script was written by Grok and Claude with a mix of effort levels.

Run the script in a terminal. It takes no options and asks questions as it
goes. A run does these steps:

1. Find the newest IDEA release tag in JetBrains' ``intellij-community``
   repository and look up its build number.
2. Write the new version to PKGBUILD, update its checksums, check and format
   it, and regenerate ``.SRCINFO``.
3. Build the package with ``makepkg -Csc`` and install it with
   ``makepkg -i`` unless that release is already installed.
4. Check the version in ``product-info.json`` in both the package file and
   the installed copy.
5. Show what Help > About in IDEA should say and ask whether it does.
6. Commit PKGBUILD and ``.SRCINFO``.
7. Show the commits that are not pushed yet and ask before pushing them.
8. Offer to delete the package file.

If the PKGBUILD is already at the newest tag, running the script again
continues where an earlier run stopped. It starts at step 3 if the PKGBUILD
and ``.SRCINFO`` changes are not committed yet and at step 7 if they are
committed but not pushed.

Pitfalls the script handles, from PKGBUILD comments and the package's Git
history:

- Version tags look like ``idea/2026.3-eap-2`` or, without the ``idea/``
  prefix, ``2025.3-rc-2``. Tags for other products, such as ``pycharm/...``,
  are ignored.
- An older yyyy.r line can get new tags after a newer line has started (for
  example 2026.2.2 after 2026.3-eap), so the script never moves the package
  back to an older yyyy.r line.
- JetBrains sometimes moves a tag to a new commit and build. It has also
  deleted a version tag but kept a build-number tag (``idea/263.4732.28``).
  The script takes the build number from a build-number tag on the same
  commit, then from YouTrack, and otherwise asks for it. Help > About in the
  closed-source build from snap shows it.
- A tag name can disagree with the real product version
  (``idea/2026.2.1-preview`` was 2026.2.0.1), so a version found in YouTrack
  wins over the tag's.
- To build from specific commits, for example after JetBrains moves a tag,
  set both ``_git_hash_override_idea`` and ``_git_hash_override_android``.
  The script sets them itself when JetBrains' ``android`` repository lacks
  the tag.
- Tags created more than a year ago are ignored. A newer tag that looks like
  an IDEA tag but matches neither the version nor the build-number format
  stops the script, with a list of such tags and their date/times.
- Tags with the same yyyy.r.n.m rank by the date/time each tag was created,
  not by kind (EAP, beta, RC). The script fetches its local
  ``intellij-community`` mirror first, so a moved tag has its new date/time.

Packages needed besides ``base-devel``:

- ``python``
- ``git``
- ``pacman-contrib`` (for ``updpkgsums``)
- ``shellcheck``
- ``prettier`` with ``prettier-plugin-sh``

Commands the script runs write directly to the terminal. Capture a command's
output only when the script needs to parse it.
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

# date/time given to a tag with no known date/time, so it ranks below every dated tag
_OLDEST_MOMENT = datetime.min.replace(tzinfo=UTC)

IDEA_GIT = "https://github.com/JetBrains/intellij-community.git"
ANDROID_GIT = "https://github.com/JetBrains/android.git"
YOUTRACK_ARTICLE_API = "https://youtrack.jetbrains.com/api/articles"
PKGBUILD_NAME = "PKGBUILD"
PKGNAME = "intellij-idea-open-eap"
INSTALLED_PRODUCT_INFO = Path("/usr/share/idea/product-info.json")
PRODUCT_INFO_TAR_MEMBER = "usr/share/idea/product-info.json"
# tag pre-release kind to the `versionSuffix` that `product-info.json` and About show
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
    r"^(?P<version>\d{4}\.\d+(?:\.\d+){0,2})"
    r"(?:\s+(?P<kind>EAP|Beta|RC|Preview)(?:\s+(?P<number>\d+))?)?$",
    re.IGNORECASE,
)

# PKGBUILD variables that this script reads and rewrites
ASSIGNMENT_RE = re.compile(
    r"^(?P<name>_version_yyyy_r_n_m|_build_number|"
    r"_pre_release_identifier_snake_case|_tag|"
    r"_git_hash_override_idea|_git_hash_override_android)"
    r"=(?P<value>.*)$",
    re.MULTILINE,
)


class TagKind(Enum):
    """List the kinds of ``intellij-community`` tags.

    VERSION is a release tag (``idea/2026.3-eap-2``), BUILD is a build-number
    tag (``idea/263.4732.28``), UNRECOGNIZED is a tag that looks like IDEA's
    but has neither format, and IRRELEVANT is any other tag, such as another
    product's.
    """

    VERSION = auto()
    BUILD = auto()
    UNRECOGNIZED = auto()
    IRRELEVANT = auto()


@dataclass(frozen=True, order=True)
class VersionKey:
    """Hold the numbers of an IDEA version, yyyy.r.n.m, in sort order."""

    yyyy: int
    r: int
    n: int
    m: int


@dataclass
class ParsedVersion:
    """Hold an IDEA version parsed from a tag or a YouTrack title.

    ``pre_snake`` is the pre-release part as PKGBUILD writes it (``eap_2``,
    ``rc``, or empty for a release), and ``pre_num`` is its number (2 for
    ``eap_2``, otherwise 0).
    """

    key: VersionKey
    yyyy_r_n_m: str
    pre_snake: str
    tag_core: str
    pre_num: int


@dataclass(frozen=True, order=True)
class VersionCandidate:
    """Hold a version tag and the fields that rank it when choosing the newest.

    The fields compare in order: version, tag date/time, pre-release number,
    then tag name.
    """

    key: VersionKey
    moment: datetime
    pre_num: int
    name: str
    sha: str = field(compare=False)
    parsed: ParsedVersion = field(compare=False)


@dataclass
class PkgState:
    """Hold the PKGBUILD variables that this script manages."""

    version_yyyy_r_n_m: str
    build_number: str
    pre_snake: str
    tag: str
    git_hash_override_idea: str
    git_hash_override_android: str


@dataclass(frozen=True)
class ResolvedBuild:
    """Hold a build number, where it came from, and the version that source gives."""

    build_number: str
    source: str
    parsed: ParsedVersion


@dataclass(frozen=True)
class DiscoveredRelease:
    """Hold the newest qualifying IDEA tag and its build number."""

    version_tag: str
    idea_sha: str
    parsed: ParsedVersion
    build_number: str
    build_number_source: str


@dataclass
class UpdatePlan:
    """Hold the values that an update writes into PKGBUILD.

    With ``use_hash_overrides``, PKGBUILD pins both repositories by commit, and
    ``source_tag_for_pkgbuild`` is empty.
    """

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
    """Hold the ``product-info.json`` fields that Help > About shows."""

    version: str
    version_suffix: str
    build_number: str


def info(message: str) -> None:
    """Print an INFO status line."""
    print(f"INFO: {message}")


def warn(message: str) -> None:
    """Print a WARNING status line."""
    print(f"WARNING: {message}")


def short_sha(sha: str) -> str:
    return sha[:7]


def format_tag(name: str, sha: str) -> str:
    """Format a tag name with its short commit hash, for status lines."""
    return f"{name} ({short_sha(sha)})"


def die(message: str) -> NoReturn:
    """Print an ERROR line and exit."""
    raise SystemExit(message if message.startswith("ERROR:") else f"ERROR: {message}")


def prompt_line(message: str, *, default: str | None = None) -> str:
    """Ask for a line of text.

    An empty answer gives ``default`` when there is one; otherwise the question
    repeats.
    """
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
    """Ask a yes-or-no question; an empty answer gives ``default``."""
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
    """Run a command; its output goes to the terminal unless ``capture`` is set."""
    # The arguments come from this script, and no shell parses them.
    return subprocess.run(  # noqa: S603
        args,
        cwd=cwd,
        check=check,
        text=True,
        capture_output=capture,
    )


def http_get_json(url: str) -> object:
    """Fetch JSON from an HTTPS URL."""
    if not url.startswith("https://"):
        raise ValueError(f"refusing non-HTTPS URL: {url}")
    # The check above lets only `https://` URLs through.
    request = urllib.request.Request(  # noqa: S310
        url,
        headers={
            "Accept": "application/json",
            "User-Agent": "intellij-idea-open-eap-update-package",
        },
    )
    # This opens the HTTPS request built above.
    with urllib.request.urlopen(request, timeout=60) as response:  # noqa: S310
        return json.load(response)


# Make sure the makepkg source mirrors exist.


def package_startdir() -> Path:
    """Return the package directory, which holds this script."""
    return Path(__file__).resolve().parent


def ensure_makepkg_source_mirrors(repo: Path) -> Path:
    """Clone the Git source mirrors with ``makepkg -o`` if they are missing.

    Return the ``intellij-community`` mirror, which the script reads tag
    date/times from.
    """
    idea = repo / "intellij-community"
    android = repo / "idea-android"
    if idea.is_dir() and android.is_dir():
        return idea
    missing = [path.name for path in (idea, android) if not path.is_dir()]
    info(
        "cloning missing makepkg source mirrors with makepkg -o --nodeps: "
        + ", ".join(missing)
    )
    run(["makepkg", "-o", "--nodeps"], cwd=repo)
    if not idea.is_dir():
        die(
            f"makepkg -o did not create {idea}. If SRCDEST is set, unset it "
            "for this run so that makepkg puts the mirrors in the package directory."
        )
    if not android.is_dir():
        die(f"makepkg -o did not create {android}.")
    return idea


def fetch_idea_mirror(git_dir: Path) -> None:
    """Fetch the local ``intellij-community`` mirror before reading tag date/times.

    JetBrains sometimes moves a tag to a new commit, which gives the tag a new
    date/time. Without a fetch, the mirror keeps the old date/time, and tags
    with the same yyyy.r.n.m can rank in the wrong order. The fetch updates
    moved tags because ``makepkg`` sets up its mirrors to fetch
    ``+refs/*:refs/*``.
    """
    info(f"fetching {git_dir.name} mirror for up-to-date tag date/times")
    completed = run(
        ["git", "--git-dir", str(git_dir), "fetch", "--prune"],
        check=False,
    )
    if completed.returncode != 0:
        warn(
            f"failed to fetch the {git_dir.name} mirror; "
            "a tag that JetBrains moved may still have its old date/time"
        )


# Read PKGBUILD.


def parse_pkgbuild_version_floor(yyyy_r_n_m: str) -> tuple[int, int]:
    """Return the yyyy.r line of PKGBUILD's version, the oldest line to update to."""
    parts = yyyy_r_n_m.split(".")
    if len(parts) < 2:
        raise ValueError(f"invalid _version_yyyy_r_n_m: {yyyy_r_n_m}")
    return int(parts[0]), int(parts[1])


def read_pkgbuild(path: Path) -> tuple[str, PkgState]:
    """Read PKGBUILD's text and the variables that this script manages."""
    text = path.read_text(encoding="utf-8")
    values: dict[str, str] = {}
    for match in ASSIGNMENT_RE.finditer(text):
        raw = match.group("value").strip()
        is_quoted = len(raw) >= 2 and raw[0] in "'\"" and raw[-1] in "'\""
        values[match.group("name")] = raw[1:-1] if is_quoted else raw
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
    """Return PKGBUILD text with the variables in ``replacements`` set to new values."""
    text_work = text
    for name, value in replacements.items():
        pattern = re.compile(rf"^{name}=.*$", re.MULTILINE)
        text_work, count = pattern.subn(f"{name}={value}", text_work, count=1)
        if count != 1:
            die(f"failed to rewrite {name}")
    return text_work


def print_pkgbuild_state(state: PkgState, idea_tags: dict[str, str]) -> None:
    """Print the release that PKGBUILD is at now."""
    tag = (
        format_tag(state.tag, idea_tags[state.tag])
        if state.tag in idea_tags
        else state.tag or "(none)"
    )
    info(
        f"current: tag={tag} version={state.version_yyyy_r_n_m} "
        f"build={state.build_number} pre={state.pre_snake or '(release)'}"
    )


# Find the newest release.


def load_remote_tags(repo_url: str) -> dict[str, str]:
    """Map each tag in a remote repository to the commit it points to.

    For an annotated tag, ``git ls-remote`` also lists the tag's commit on a
    line ending in ``^{}``, and the map takes that commit.
    """
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
        ref_name = ref.removeprefix("refs/tags/")
        name = ref_name.removesuffix("^{}")
        tags.setdefault(name, {})["peeled" if name != ref_name else "tag"] = sha
    return {name: data.get("peeled") or data["tag"] for name, data in tags.items()}


def tag_core_name(tag_name: str) -> str:
    """Remove the ``idea/`` prefix from a tag name."""
    return tag_name.removeprefix("idea/")


def classify_tag(tag_name: str) -> TagKind:
    """Classify a tag as an IDEA version, a build number, unrecognized, or irrelevant.

    A tag with a prefix other than ``idea/``, such as ``pycharm/``, belongs to
    another product. A tag with no prefix is IDEA's when it starts with a year.
    """
    if tag_name.startswith("idea/"):
        core = tag_core_name(tag_name)
        looks_like_idea = True
    elif "/" in tag_name:
        return TagKind.IRRELEVANT
    else:
        core = tag_name
        looks_like_idea = bool(re.match(r"^\d{4}\.", tag_name))

    if BUILD_NUMBER_RE.fullmatch(core):
        return TagKind.BUILD
    if VERSION_CORE_RE.fullmatch(core) is not None:
        return TagKind.VERSION
    if looks_like_idea:
        return TagKind.UNRECOGNIZED
    return TagKind.IRRELEVANT


def parse_version_core(core: str) -> ParsedVersion | None:
    """Parse a version tag that has no ``idea/`` prefix.

    Return None if the tag does not match the version format.
    """
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
    """List the IDEA tags that match neither the version nor the build-number format."""
    return sorted(
        name for name in idea_tags if classify_tag(name) is TagKind.UNRECOGNIZED
    )


def parse_iso_datetime(raw: str) -> datetime | None:
    """Parse an ISO 8601 date/time or return None if it does not parse.

    A date/time without a zone is taken as UTC.
    """
    try:
        moment = datetime.fromisoformat(raw.strip())
    except ValueError:
        return None
    return moment.replace(tzinfo=UTC) if moment.tzinfo is None else moment


def format_local_iso(moment: datetime) -> str:
    """Format a date/time for local display, like 2026-09-11 09:47:07-06:00."""
    return moment.astimezone().isoformat(timespec="seconds").replace("T", " ", 1)


def load_local_tag_datetimes(repo: Path) -> dict[str, datetime]:
    """Fetch the ``intellij-community`` mirror and read when each tag was created."""
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


def commit_datetime(sha: str) -> datetime | None:
    """Read a commit's date/time from the local mirror.

    Return None if the mirror does not have the commit.
    """
    git_dir = ensure_makepkg_source_mirrors(package_startdir())
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
    """Return when a tag was created, falling back to its commit's date/time."""
    if name in tag_datetimes:
        return tag_datetimes[name]
    return commit_datetime(sha)


def filter_tags_older_than_one_year(
    tags: dict[str, str],
    tag_datetimes: dict[str, datetime],
) -> dict[str, str]:
    """Drop tags created more than a year ago.

    A tag with no known date/time stays so that a new remote tag that the
    local mirror lacks is not lost.
    """
    cutoff = datetime.now(UTC) - timedelta(days=365)
    kept: dict[str, str] = {}
    for name, sha in tags.items():
        moment = tag_datetimes.get(name)
        if moment is None or moment >= cutoff:
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
    """Pick the newest version tag on PKGBUILD's yyyy.r line or a newer line.

    Tags rank by yyyy.r.n.m, then by the date/time the tag was created, then by
    pre-release number, then by name. The kind (EAP, beta, RC) does not count.
    """
    candidates: list[VersionCandidate] = []
    for name, sha in idea_tags.items():
        if classify_tag(name) is not TagKind.VERSION:
            continue
        parsed = parse_version_core(tag_core_name(name))
        if parsed is None:
            continue
        if (parsed.key.yyyy, parsed.key.r) < floor:
            continue
        # An undated tag ranks as oldest, so a dated tag with the same version wins.
        moment = tag_datetime(name, sha, tag_datetimes) or _OLDEST_MOMENT
        candidates.append(
            VersionCandidate(
                key=parsed.key,
                moment=moment,
                pre_num=parsed.pre_num,
                name=name,
                sha=sha,
                parsed=parsed,
            )
        )
    if not candidates:
        sample = ", ".join(sorted(idea_tags)[-15:])
        die(
            f"no IDEA version tags found for {floor[0]}.{floor[1]} or newer. "
            "Expected names like idea/2026.3-eap-2 or 2025.3-rc-2. "
            f"Last 15 tags by name: {sample}"
        )
    return max(candidates)


def fail_on_unrecognized_tags(
    unknown: list[str],
    tag_datetimes: dict[str, datetime],
    idea_tags: dict[str, str],
) -> None:
    """Stop with a list of IDEA tags in a format the script does not know."""
    if not unknown:
        return
    listed_limit = 40
    lines = [
        (
            "ERROR: these IDEA tags match neither the version nor the build-number "
            "format (tags older than one year are already left out):"
        )
    ]
    for name in unknown[:listed_limit]:
        sha = idea_tags.get(name, "")
        moment = tag_datetime(name, sha, tag_datetimes) if sha else None
        shown = format_local_iso(moment) if moment is not None else "unknown"
        label = format_tag(name, sha) if sha else name
        lines.append(f"  {shown}  {label}")
    if len(unknown) > listed_limit:
        lines.append(f"  ... and {len(unknown) - listed_limit} more")
    lines.append(
        "If one of these is a real release, extend the tag parsing in this script "
        "and run it again."
    )
    raise SystemExit("\n".join(lines))


def parse_youtrack_summary(summary: str) -> tuple[ParsedVersion, str] | None:
    """Parse a YouTrack title like ``IntelliJ IDEA 2026.3 EAP 2 (263.4732.28 build)``.

    Return the version and the build number. For a title in another form,
    return None.
    """
    match = YOUTRACK_SUMMARY_RE.match(summary.strip())
    if match is None:
        return None
    label_match = YOUTRACK_LABEL_RE.match(match.group("label").strip())
    if label_match is None:
        return None
    # The title's "2026.3 EAP 2" becomes the tag form "2026.3-eap-2".
    core = "-".join(
        part.lower() for part in label_match.group("version", "kind", "number") if part
    )
    parsed = parse_version_core(core)
    return None if parsed is None else (parsed, match.group("build"))


def youtrack_children(article_id: str) -> list[dict[str, str]]:
    """Return the IDs and titles of a YouTrack article's child articles."""
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
    """Search YouTrack articles and return the IDs and titles of the first ``top``."""
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
    """Find the YouTrack article for a tag's release.

    Search once for the line's article (such as "IntelliJ IDEA 2026.3 Latest
    Builds") and take the first child article whose title has the same
    pre-release part as the tag (EAP 2 for ``eap_2`` or none for a release).
    Return its version, build number, and article ID. If no child article
    matches, return None.
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
        youtrack_version, build = parsed
        if youtrack_version.pre_snake == parsed_from_tag.pre_snake:
            return youtrack_version, build, article_id
    return None


def prompt_build_number(version_tag: str, idea_sha: str) -> str:
    """Ask for the build number, with steps for finding it."""
    warn(
        f"found no build number for {format_tag(version_tag, idea_sha)} in a "
        "build-number tag on the same commit or in YouTrack"
    )
    info("to find the build number:")
    info("  1. snap install intellij-idea --classic --edge")
    info("  2. launch IDEA → Help → About")
    info("  3. copy the build number (example: 263.4732.28)")
    info(
        "or look it up at "
        "https://youtrack.jetbrains.com/articles/IDEA-A-21/"
        "IDEA-Latest-Builds-And-Release-Notes"
    )
    while True:
        raw = prompt_line("Build number")
        if BUILD_NUMBER_RE.fullmatch(raw):
            return raw
        warn(f"{raw!r} is not a build number like 263.4732.28; try again")


def prompt_build_tag(build_tags: list[str], version_tag: str, idea_sha: str) -> str:
    """Ask which of several build-number tags on the version tag's commit to use."""
    warn(
        "several build-number tags point at the same commit as "
        f"{format_tag(version_tag, idea_sha)}:"
    )
    for index, name in enumerate(build_tags, start=1):
        info(f"  {index}. {format_tag(name, idea_sha)}")
    raw = prompt_line("Choose build-number tag by number or full name", default="1")
    if raw in build_tags:
        return raw
    if not raw.isdigit():
        die(f"{raw!r} is not one of: {', '.join(build_tags)}")
    index = int(raw)
    if index < 1 or index > len(build_tags):
        die(f"choice {raw} is out of range")
    return build_tags[index - 1]


def resolve_build_number(
    idea_tags: dict[str, str],
    version_tag: str,
    idea_sha: str,
    parsed_from_tag: ParsedVersion,
) -> ResolvedBuild:
    """Find the build number for a version tag.

    Take it from a build-number tag on the same commit, then from YouTrack,
    and otherwise ask for it.
    """
    matching_build_tags = sorted(
        name
        for name, sha in idea_tags.items()
        if classify_tag(name) is TagKind.BUILD and sha == idea_sha
    )
    if matching_build_tags:
        chosen = (
            matching_build_tags[0]
            if len(matching_build_tags) == 1
            else prompt_build_tag(matching_build_tags, version_tag, idea_sha)
        )
        return ResolvedBuild(
            build_number=tag_core_name(chosen),
            source=f"git tag {chosen}",
            parsed=parsed_from_tag,
        )

    warn(
        "no build-number tag points at the same commit as "
        f"{format_tag(version_tag, idea_sha)}"
    )
    youtrack_match = find_youtrack_for_tag(parsed_from_tag)
    if youtrack_match is not None:
        youtrack_version, build, article_id = youtrack_match
        info(f"YouTrack article {article_id} gives build {build}")
        if youtrack_version.yyyy_r_n_m != parsed_from_tag.yyyy_r_n_m:
            warn(
                f"YouTrack gives version {youtrack_version.yyyy_r_n_m}, but the tag "
                f"suggests {parsed_from_tag.yyyy_r_n_m}; using YouTrack's"
            )
        return ResolvedBuild(
            build_number=build,
            source=f"YouTrack {article_id}",
            parsed=youtrack_version,
        )

    build = prompt_build_number(version_tag, idea_sha)
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
    """Find the newest qualifying version tag and its build number.

    Return that release and the tags that are left after dropping tags older
    than a year.
    """
    moments = load_local_tag_datetimes(repo)
    recent_tags = filter_tags_older_than_one_year(idea_tags, moments)
    floor = parse_pkgbuild_version_floor(state.version_yyyy_r_n_m)
    fail_on_unrecognized_tags(unrecognized_idea_tags(recent_tags), moments, recent_tags)
    chosen = choose_version_tag(recent_tags, floor, moments)
    resolved = resolve_build_number(
        recent_tags,
        chosen.name,
        chosen.sha,
        chosen.parsed,
    )
    info(
        f"chose {format_tag(chosen.name, chosen.sha)}; "
        f"build {resolved.build_number} via {resolved.source}"
    )
    release = DiscoveredRelease(
        version_tag=chosen.name,
        idea_sha=chosen.sha,
        parsed=resolved.parsed,
        build_number=resolved.build_number,
        build_number_source=resolved.source,
    )
    return release, recent_tags


# Compare with PKGBUILD and complete the plan.


def compare_to_pkgbuild(
    state: PkgState,
    discovered: DiscoveredRelease,
    idea_tags: dict[str, str],
) -> UpdatePlan | None:
    """Plan an update if PKGBUILD is not at the discovered release.

    Return None if it already is.
    """
    version_tag = discovered.version_tag
    idea_sha = discovered.idea_sha
    parsed = discovered.parsed
    build_number = discovered.build_number

    # JetBrains has deleted tags after moving them to a new commit. The package
    # then used a build-number tag or the hash overrides.
    if state.tag and state.tag not in idea_tags:
        warn(
            f"PKGBUILD _tag {state.tag} is missing from intellij-community; "
            "JetBrains may have deleted or moved it"
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

    if state.tag == version_tag and state.build_number != build_number:
        warn(
            f"tag {format_tag(version_tag, idea_sha)} moved from build "
            f"{state.build_number} to build {build_number}"
        )

    return plan_from_discovered(discovered)


def plan_from_discovered(discovered: DiscoveredRelease) -> UpdatePlan:
    """Plan an update that builds the discovered release from its tag.

    The android commit SHA is left empty for ``complete_plan`` to fill in.
    """
    return UpdatePlan(
        version_tag=discovered.version_tag,
        idea_sha=discovered.idea_sha,
        android_sha="",
        build_number=discovered.build_number,
        version_yyyy_r_n_m=discovered.parsed.yyyy_r_n_m,
        pre_snake=discovered.parsed.pre_snake,
        use_hash_overrides=False,
        source_tag_for_pkgbuild=discovered.version_tag,
        build_number_source=discovered.build_number_source,
    )


def complete_plan(plan: UpdatePlan, android_tags: dict[str, str]) -> UpdatePlan:
    """Add the android repository's commit for the release to the plan.

    If the android repository lacks the tag, ask for the commit and pin both
    repositories by commit instead of by tag.
    """
    android_sha = android_tags.get(plan.version_tag)
    if android_sha is not None:
        return replace(plan, android_sha=android_sha)

    warn(
        "the android repository has no tag "
        f"{format_tag(plan.version_tag, plan.idea_sha)}; enter its matching "
        "commit to pin both repositories by commit"
    )
    info(f"find the commit at {ANDROID_GIT} or in the idea-android mirror")
    android_sha = prompt_line("Android commit SHA")
    return replace(
        plan,
        android_sha=android_sha,
        use_hash_overrides=True,
        source_tag_for_pkgbuild="",
    )


# Edit PKGBUILD.


def apply_plan(pkgbuild_text: str, plan: UpdatePlan) -> str:
    """Return PKGBUILD text with the plan's values written in."""
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
    """Find the ``prettier-plugin-sh`` entry file or fall back to the package name."""
    candidates = [
        "/usr/lib/node_modules/prettier-plugin-sh/lib/index.cjs",
        str(Path.home() / ".local/lib/node_modules/prettier-plugin-sh/lib/index.cjs"),
    ]
    for path in candidates:
        if Path(path).is_file():
            return path
    return "prettier-plugin-sh"


def refresh_pkgbuild_and_srcinfo(repo: Path) -> None:
    """Update PKGBUILD's checksums, check and format it, and regenerate ``.SRCINFO``."""
    info(
        "updating checksums, checking and formatting PKGBUILD, "
        "and regenerating .SRCINFO"
    )
    run(["updpkgsums"], cwd=repo)
    # ShellCheck exclusions: `makepkg` reads the PKGBUILD's variables (SC2034), sets
    # `$srcdir` and `$pkgdir` (SC2154), and stops when a `cd` fails (SC2164).
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
    """Print the current release and the planned update."""
    print_pkgbuild_state(state, idea_tags)
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
        info(f"build number source: git tag {format_tag(build_tag, plan.idea_sha)}")
    else:
        info(f"build number source: {plan.build_number_source}")


# Build and install.


def planned_pkgver(plan: UpdatePlan) -> str:
    """Return the pkgver that PKGBUILD computes for the plan."""
    pkgver = f"{plan.version_yyyy_r_n_m}.{plan.build_number}"
    return f"{pkgver}.{plan.pre_snake}" if plan.pre_snake else pkgver


def built_package_pattern(plan: UpdatePlan) -> str:
    """Return the filename pattern of the plan's built package."""
    return f"{PKGNAME}-{planned_pkgver(plan)}-*-x86_64.pkg.tar.*"


def find_built_package(repo: Path, plan: UpdatePlan) -> Path | None:
    """Find the plan's built package file; return None if there is none."""
    matches = sorted(
        path for path in repo.glob(built_package_pattern(plan)) if path.is_file()
    )
    return matches[-1] if matches else None


def pkgrel_from_pkgbuild(repo: Path) -> str:
    """Read pkgrel from PKGBUILD."""
    match = re.search(
        r"^pkgrel=(\d+)\s*$",
        (repo / PKGBUILD_NAME).read_text(encoding="utf-8"),
        re.MULTILINE,
    )
    if match is None:
        die(f"could not read pkgrel from {repo / PKGBUILD_NAME}")
    return match.group(1)


def planned_package_version(repo: Path, plan: UpdatePlan) -> str:
    """Return the ``pkgver-pkgrel`` that ``pacman`` reports for the planned release."""
    return f"{planned_pkgver(plan)}-{pkgrel_from_pkgbuild(repo)}"


def installed_package_version() -> str | None:
    """Ask ``pacman`` for the installed ``pkgver-pkgrel``.

    Return None if the package is not installed.
    """
    completed = run(["pacman", "-Q", PKGNAME], check=False, capture=True)
    if completed.returncode != 0:
        return None
    parts = completed.stdout.strip().split()
    if len(parts) != 2:
        die(f"unexpected pacman -Q {PKGNAME} output: {completed.stdout!r}")
    return parts[1]


def confirm_pacman_installed(repo: Path, plan: UpdatePlan) -> None:
    """Stop unless ``pacman`` reports the planned version as installed."""
    expected = planned_package_version(repo, plan)
    actual = installed_package_version()
    if actual is None:
        die(f"pacman does not report {PKGNAME} as installed")
    if actual != expected:
        die(
            f"pacman reports {PKGNAME} {actual}, expected {expected}; "
            "install the package built from this PKGBUILD before continuing"
        )
    info(f"pacman: {PKGNAME} {actual} is installed")


def make_build_dirs_removable(repo: Path) -> None:
    """Make ``src`` and ``pkg`` writable so that ``makepkg`` can delete them.

    The PKGBUILD sets ``HOME`` to ``$srcdir`` for Bazel, which leaves read-only
    files that the cleanup of ``makepkg -C`` and ``-c`` cannot delete.
    """
    for name in ("src", "pkg"):
        path = repo / name
        if path.is_dir() and not path.is_symlink():
            run(["chmod", "-R", "u+w", "--", str(path)], check=False)


def build_package(repo: Path, plan: UpdatePlan) -> Path:
    """Build the package with ``makepkg -Csc`` and return the package file.

    ``-C`` (``--cleanbuild``) deletes ``$srcdir`` before the build, and ``-c``
    (``--clean``) deletes the work files after it. Together they keep files
    from an earlier build out of this one (see the ``makepkg`` page on the
    ArchWiki). The Git mirrors stay in the package directory, so a clean build
    does not clone them from GitHub again. ``makepkg`` exits with status 13
    when the package file already exists, and the script then uses that file.
    """
    make_build_dirs_removable(repo)
    info("running makepkg -Csc (clean build, install dependencies, clean up)")
    completed = run(["makepkg", "-Csc"], cwd=repo, check=False)
    if completed.returncode not in {0, 13}:
        die(f"makepkg -Csc failed with exit status {completed.returncode}")
    if completed.returncode == 13:
        info("using the package file that was already built")
    built = find_built_package(repo, plan)
    if built is None:
        die(
            f"no package file matching {built_package_pattern(plan)} "
            "after makepkg -Csc"
        )
    return built


def build_and_install(repo: Path, plan: UpdatePlan) -> None:
    """Build and install the package; then check that ``pacman`` reports it."""
    package_path = build_package(repo, plan)
    info(f"installing {package_path.name} with makepkg -i")
    run(["makepkg", "-i"], cwd=repo)
    confirm_pacman_installed(repo, plan)


# Check the installed release.


def expected_product_info(plan: UpdatePlan) -> ProductInfo:
    """Return the version that ``product-info.json`` and Help > About should show.

    The version is yyyy.r.n.m with trailing zero parts dropped, down to yyyy.r
    (2026.3.0.0 shows as 2026.3, and 2026.3.1.0 as 2026.3.1). The suffix is the
    pre-release kind without the tag's number (``eap_2`` shows as EAP).
    """
    parts = plan.version_yyyy_r_n_m.split(".")
    if len(parts) < 2:
        die(f"invalid plan version_yyyy_r_n_m: {plan.version_yyyy_r_n_m}")
    while len(parts) > 2 and parts[-1] == "0":
        parts.pop()
    version = ".".join(parts)
    kind = plan.pre_snake.split("_", 1)[0]
    suffix = KIND_TO_VERSION_SUFFIX.get(kind, kind.upper()) if kind else ""
    return ProductInfo(version, suffix, plan.build_number)


def format_about_version(product: ProductInfo) -> str:
    """Format a version as About shows it, like ``2026.3.1 Preview``."""
    suffix = product.version_suffix
    return f"{product.version} {suffix}" if suffix else product.version


def parse_product_info_json(raw: str) -> ProductInfo:
    """Read the version fields from the text of a ``product-info.json``."""
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
    """Read ``product-info.json`` from a built package file."""
    completed = run(
        ["tar", "-xOf", str(package_path), PRODUCT_INFO_TAR_MEMBER],
        capture=True,
    )
    return parse_product_info_json(completed.stdout)


def verify_product_info(
    source: str, actual: ProductInfo, expected: ProductInfo
) -> None:
    """Print a ``product-info.json`` version and stop unless it is the expected one.

    ``source`` names the copy of ``product-info.json`` in the messages.
    """
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
    repo: Path, plan: UpdatePlan, *, package_required: bool
) -> None:
    """Check ``product-info.json``; then ask whether IDEA launches and About matches.

    The installed ``product-info.json`` has to match the planned release. When
    ``makepkg`` ran in this run, ``package_required`` is true, and the built
    package file also has to exist and match. Otherwise the package file is
    checked only if it is there.
    """
    expected = expected_product_info(plan)
    package_path = find_built_package(repo, plan)
    if package_path is not None:
        verify_product_info(
            f"package {package_path.name}",
            read_product_info_from_package(package_path),
            expected,
        )
    elif package_required:
        die(
            "makepkg ran, but there is no package file matching "
            f"{built_package_pattern(plan)}"
        )
    else:
        warn(f"no package file matching {built_package_pattern(plan)} to check")

    if not INSTALLED_PRODUCT_INFO.is_file():
        die(f"{INSTALLED_PRODUCT_INFO} is missing after install; not committing")
    verify_product_info(
        "installed product-info.json",
        parse_product_info_json(INSTALLED_PRODUCT_INFO.read_text(encoding="utf-8")),
        expected,
    )

    print(
        "Launch IDEA. Help → About should show:\n"
        f"  IntelliJ IDEA {format_about_version(expected)}\n"
        f"  Build #IC-{expected.build_number}"
    )
    if not prompt_yes("Does IDEA launch and show that in About?", default=False):
        die("IDEA launch or About not confirmed; not committing")


# Commit and push.


def commit_update(repo: Path, plan: UpdatePlan) -> None:
    """Commit PKGBUILD and ``.SRCINFO``.

    The subject is "Update to <tag> tag" or, when that would be longer than 50
    characters, "Update to <build number>".
    """
    tag_subject = f"Update to {plan.version_tag} tag"
    subject = (
        tag_subject if len(tag_subject) <= 50 else f"Update to {plan.build_number}"
    )
    message = (
        f"{subject}\n\n"
        f"Pinned idea={plan.idea_sha} android={plan.android_sha} via hash overrides.\n"
        if plan.use_hash_overrides
        else f"{subject}\n"
    )
    with tempfile.NamedTemporaryFile("w", encoding="utf-8", delete=False) as handle:
        handle.write(message)
        path = handle.name
    try:
        run(["git", "add", PKGBUILD_NAME, ".SRCINFO"], cwd=repo)
        # Git's own configuration sets the author.
        run(["git", "commit", "-F", path], cwd=repo)
    finally:
        Path(path).unlink()
    info(f"committed: {subject}")


def upstream_branch(repo: Path) -> str:
    """Return the current branch's upstream, such as ``origin/master``."""
    completed = run(
        ["git", "rev-parse", "--abbrev-ref", "@{upstream}"],
        cwd=repo,
        check=False,
        capture=True,
    )
    upstream = completed.stdout.strip()
    if completed.returncode != 0 or not upstream:
        die(
            "the current branch has no upstream; "
            "set one with git branch --set-upstream-to before pushing"
        )
    return upstream


def push_unpushed(repo: Path, upstream: str) -> None:
    """Show the unpushed commits with their changes and push them if confirmed."""
    info(f"commits not pushed to {upstream} yet:")
    # `git log` writes to the terminal, so it can use its pager.
    run(
        ["git", "log", f"{upstream}..HEAD", "-p", "-U"],
        cwd=repo,
    )
    if not prompt_yes(f"Push these commits to {upstream}?", default=False):
        die("push declined; the commits stay local")
    info(f"pushing to {upstream}")
    run(["git", "push"], cwd=repo)
    info("push finished")


def prompt_delete_built_packages(repo: Path, plan: UpdatePlan) -> None:
    """Offer to delete the plan's built package files."""
    paths = sorted(
        path for path in repo.glob(built_package_pattern(plan)) if path.is_file()
    )
    if not paths:
        info("no built package file to delete")
        return
    info("built package files:")
    for path in paths:
        print(f"  {path.name}")
    if not prompt_yes("Delete these package files?", default=False):
        info("keeping the package files")
        return
    for path in paths:
        path.unlink()
        info(f"deleted {path.name}")


# Finish an update, including one that an earlier run stopped partway through.


def finish_update(repo: Path, plan: UpdatePlan) -> None:
    """Install the planned release unless it is already installed.

    Then check the installed release, commit, push, and offer to delete the
    built package file.
    """
    planned_version = planned_package_version(repo, plan)
    if installed_package_version() == planned_version:
        info(f"{PKGNAME} {planned_version} is already installed; skipping makepkg")
        confirm_release_and_launch(repo, plan, package_required=False)
    else:
        build_and_install(repo, plan)
        confirm_release_and_launch(repo, plan, package_required=True)
    commit_update(repo, plan)
    push_unpushed(repo, upstream_branch(repo))
    prompt_delete_built_packages(repo, plan)


def continue_unfinished_update(repo: Path, plan: UpdatePlan) -> None:
    """Continue an update when the PKGBUILD is already at the newest release.

    If the PKGBUILD and ``.SRCINFO`` changes are not committed, an earlier run
    stopped before committing, so this refreshes the checksums and
    ``.SRCINFO`` and continues from the install step. If they are committed
    but not pushed, this goes straight to the push step. Otherwise there is
    nothing to do.
    """
    changed = run(
        ["git", "status", "--porcelain", "--", PKGBUILD_NAME, ".SRCINFO"],
        cwd=repo,
        capture=True,
    )
    if changed.stdout.strip():
        info(
            f"{PKGBUILD_NAME} is already at {plan.version_tag} but not committed; "
            "continuing that update"
        )
        refresh_pkgbuild_and_srcinfo(repo)
        finish_update(repo, plan)
        return

    upstream = upstream_branch(repo)
    unpushed = run(
        ["git", "rev-list", "--count", f"{upstream}..HEAD"],
        cwd=repo,
        capture=True,
    )
    if int(unpushed.stdout) == 0:
        info(
            "PKGBUILD is already at the newest IDEA tag, and everything is pushed; "
            "nothing to do"
        )
        return
    info(f"{plan.version_tag} is committed but not pushed; going to the push step")
    push_unpushed(repo, upstream)
    prompt_delete_built_packages(repo, plan)


# Run the script.


def main() -> int:
    repo = package_startdir()
    pkgbuild_path = repo / PKGBUILD_NAME
    if not pkgbuild_path.is_file():
        die(f"missing {pkgbuild_path}")

    info(f"package directory: {repo}")
    ensure_makepkg_source_mirrors(repo)

    text, state = read_pkgbuild(pkgbuild_path)
    idea_tags = load_remote_tags(IDEA_GIT)
    print_pkgbuild_state(state, idea_tags)

    discovered, recent_tags = discover_release(
        state,
        idea_tags,
        repo=repo,
    )
    draft_plan = compare_to_pkgbuild(state, discovered, recent_tags)
    if draft_plan is None:
        continue_unfinished_update(repo, plan_from_discovered(discovered))
        return 0
    plan = complete_plan(draft_plan, load_remote_tags(ANDROID_GIT))

    print_plan(state, plan, idea_tags=recent_tags)
    info(f"writing the planned values to {PKGBUILD_NAME}")
    pkgbuild_path.write_text(apply_plan(text, plan), encoding="utf-8")
    refresh_pkgbuild_and_srcinfo(repo)
    finish_update(repo, plan)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except subprocess.CalledProcessError as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(error.returncode) from error
