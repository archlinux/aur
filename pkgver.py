#!/usr/bin/env python3
import yaml
import urllib.request
import xml.etree.ElementTree as ET  # wants to call Home
import subprocess
import re


def get_xivlauncher_commit():
    with urllib.request.urlopen(
        "https://raw.githubusercontent.com/flathub/dev.goats.xivlauncher/master/dev.goats.xivlauncher.yml"
    ) as f:
        flatpak_manifest = yaml.safe_load(f)
    for module in flatpak_manifest["modules"]:
        if module["name"] == "xivlauncher":
            for source in module["sources"]:
                if (
                    isinstance(source, dict)
                    and "url" in source.keys()
                    and source["url"]
                    == "https://github.com/goatcorp/FFXIVQuickLauncher.git"
                ):
                    return source["commit"]
    raise Exception("Could not get current XIVLauncher commit hash")


def get_version(commit):
    with urllib.request.urlopen(
        f"https://raw.githubusercontent.com/goatcorp/FFXIVQuickLauncher/{commit}/src/XIVLauncher.Core/XIVLauncher.Core.csproj"
    ) as f:
        csproj = ET.fromstring(f.read())
    for propertygroup in csproj.findall("PropertyGroup"):
        version = propertygroup.find("Version")
        if isinstance(
            version, ET.Element
        ):  # we cant check the existence, since bool(obj) calls obj.__len__ which for this element is 0
            return version.text
    raise Exception("Could not determine latest XIVLauncher version")


if __name__ == "__main__":
    commit = get_xivlauncher_commit()
    version = get_version(commit)
    subprocess.run(
        ["git", "tag", "-a", "-m", version, version, commit],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    git_describe = subprocess.run(
        ["git", "describe", "--long", "--match", version], capture_output=True
    )
    print(
        re.sub(r"([^-]*-g)", r"r\1", git_describe.stdout.decode())
        .strip()
        .replace("-", ".")
    )
