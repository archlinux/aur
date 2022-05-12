#!/usr/bin/env python3
import hashlib
import json
import pathlib
import re
import sys
import typing

import jinja2
import requests
from github import Github


REPO_NAME = "fleetdm/fleet"
VERSION_PATTERN = re.compile(r"orbit-v([0-9]+\.[0-9]+\.[0-9]+)")

REPO = Github().get_repo(REPO_NAME)
METADATA_PATH = pathlib.Path("./metadata.json")


class TagInfo(typing.TypedDict):
    name: str
    pkgver: str
    commit_sha: str
    tarball_url: str


class Metadata(typing.TypedDict):
    tag_info: TagInfo
    release_sha512sum: str
    pkgrel: int


def query_latest_tag_info() -> TagInfo:
    for tag in REPO.get_tags():
        match = VERSION_PATTERN.match(tag.name)
        if match is not None:
            return {
                "name": tag.name,
                "pkgver": match.group(1),
                "commit_sha": tag.commit.sha,
                "tarball_url": f"https://github.com/{REPO_NAME}/archive/refs/tags/{tag.name}.tar.gz",
            }

    raise RuntimeError("No tag matching pattern found.")


def refresh_metadata(tag_info: TagInfo) -> Metadata:
    release_sha512sum: typing.Optional[str] = None
    pkgrel = 1
    if METADATA_PATH.exists():
        old_metadata: Metadata = json.loads(METADATA_PATH.read_text())
        if tag_info["name"] == old_metadata["tag_info"]["name"]:
            # Existing release, no need to re-compute checksum.
            release_sha512sum = old_metadata["release_sha512sum"]
            # Get pkgrel from existing metadata.
            pkgrel = old_metadata["pkgrel"]
        else:
            # New release, reset pkgrel.
            pkgrel = 1

    metadata: Metadata = {
        "tag_info": tag_info,
        "release_sha512sum": (
            release_sha512sum or compute_remote_checksum(tag_info["tarball_url"])
        ),
        "pkgrel": pkgrel,
    }

    METADATA_PATH.write_text(json.dumps(metadata, sort_keys=True, indent=2))
    return metadata


def compute_remote_checksum(url: str, sumfunc=hashlib.sha512, chunk_size=1024) -> str:
    s = sumfunc()
    with requests.get(url, stream=True) as resp:
        for content in resp.iter_content(chunk_size=chunk_size):
            s.update(content)
    return s.hexdigest()


def render_pkgbuild(metadata: Metadata) -> None:
    env = jinja2.Environment(loader=jinja2.FileSystemLoader("."))
    env.globals["sha512sum"] = lambda path: hashlib.sha512(
        pathlib.Path(path).read_bytes()
    ).hexdigest()
    template = env.get_template("./PKGBUILD.jinja")
    result = template.render(metadata=metadata)
    pathlib.Path("./PKGBUILD").write_text(result)


def main() -> bool:
    tag_info = query_latest_tag_info()
    metadata = refresh_metadata(tag_info)
    render_pkgbuild(metadata)
    return True


if __name__ == "__main__":
    sys.exit(not bool(main()))
