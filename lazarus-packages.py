#!/usr/bin/env python
import json
import os
import subprocess
import sys
import urllib.request
import zipfile
from pathlib import Path
from xml.etree import ElementTree as ET

def _normalize_dep(dep):
    dep = dep.strip()
    if not dep:
        return ""
    if "(" in dep:
        dep = dep.split("(", 1)[0]
    return dep.strip()

def _package_contains(pkg, needle):
    needle = _normalize_dep(needle)
    if not needle:
        return False
    target = needle if needle.lower().endswith(".lpk") else f"{needle}.lpk"
    return any(f.get("Name", "").lower() == target.lower() for f in pkg["packages"])

def _match_packages(packages, name):
    name_l = name.lower()
    matches = [
        p
        for p in packages
        if p.get("DisplayName", "").lower() == name_l
        or p.get("Name", "").lower() == name_l
    ]
    if not matches:
        matches = [p for p in packages if _package_contains(p, name)]
    return matches

def _get_dependencies(packages, pkg, seen):
    pkg_name = pkg.get("Name", "")
    if pkg_name in seen:
        return []
    seen.add(pkg_name)
    deps = []
    for pkg_file in pkg.get("packages", []):
        dep_str = pkg_file.get("DependenciesAsString", "")
        for dep in dep_str.split(","):
            dep = _normalize_dep(dep)
            if not dep:
                continue
            for candidate in packages:
                if candidate.get("Name") == pkg_name:
                    continue
                if _package_contains(candidate, dep):
                    deps.append(candidate)
                    deps.extend(_get_dependencies(packages, candidate, seen))
    return deps

def main():
    repo_base = os.environ["LAZARUS_PKG_REPO"]
    temp_dir = Path(os.environ["LAZARUS_PKG_TMP"])
    lazarusdir = os.environ["LAZARUSDIR"]
    project_file = Path("heidisql.lpi")

    if not project_file.exists():
        raise SystemExit("heidisql.lpi not found")

    tree = ET.parse(project_file)
    required = []
    for elem in tree.findall(".//RequiredPackages/Item/PackageName"):
        value = elem.get("Value")
        if value:
            required.append(value.strip())

    required = [r for r in required if r]
    print("Required packages from LPI:", ", ".join(required) if required else "none")
    if not required:
        sys.exit(0)

    with urllib.request.urlopen(f"{repo_base}/packagelist.json") as resp:
        package_list = json.load(resp)

    packages = []
    for key, value in package_list.items():
        if not key.startswith("PackageData"):
            continue
        idx = key[len("PackageData") :]
        pkg = dict(value)
        pkg["PackageBaseDir"] = pkg.get("PackageBaseDir", "").replace("\\", "")
        files = []
        for entry in package_list.get(f"PackageFiles{idx}", []):
            entry = dict(entry)
            entry["RelativeFilePath"] = entry.get("RelativeFilePath", "").replace(
                "\\", ""
            )
            files.append(entry)
        pkg["packages"] = files
        packages.append(pkg)

    to_install = []
    seen_names = set()

    def _add_pkg(pkg):
        key = pkg.get("DisplayName") or pkg.get("Name")
        if key and key not in seen_names:
            seen_names.add(key)
            to_install.append(pkg)

    for req in required:
        matches = _match_packages(packages, req)
        if not matches:
            print(f"Skipping non-repo package: {req}")
            continue
        for pkg in matches:
            for dep in _get_dependencies(packages, pkg, set()):
                _add_pkg(dep)
            _add_pkg(pkg)

    if not to_install:
        print("No Lazarus packages to install from repository.")
        sys.exit(0)

    print("Installing Lazarus packages from repository:")
    for pkg in to_install:
        print(f"  - {pkg.get('DisplayName') or pkg.get('Name')}")

    temp_dir.mkdir(parents=True, exist_ok=True)

    for pkg in to_install:
        repo_file = pkg.get("RepositoryFileName")
        if not repo_file:
            raise SystemExit(f"Missing RepositoryFileName for {pkg.get('DisplayName')}")
        url = f"{repo_base}/{repo_file}"
        zip_path = temp_dir / repo_file
        print(f"Downloading {url}")
        with urllib.request.urlopen(url) as resp, open(zip_path, "wb") as out:
            out.write(resp.read())
        extract_dir = temp_dir / (pkg.get("RepositoryFileHash") or repo_file)
        extract_dir.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(zip_path) as zf:
            zf.extractall(extract_dir)
        base_dir = extract_dir / pkg.get("PackageBaseDir", "")
        for pkg_file in pkg.get("packages", []):
            pkg_path = (
                base_dir
                / pkg_file.get("RelativeFilePath", "")
                / pkg_file.get("Name", "")
            )
            print(f"Building {pkg_path}")
            subprocess.run(
                ["lazbuild", f"--lazarusdir={lazarusdir}", str(pkg_path)],
                check=True,
            )

if __name__ == "__main__":
    main()
