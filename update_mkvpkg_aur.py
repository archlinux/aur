#!/usr/bin/env python3
import subprocess
import os
import urllib.request
import json

db_path = "/mnt/v/Data/makepkg/packages/MKVPKG.db.tar.gz"
projects_dir = "/home/v/Projects"

def run_cmd(cmd):
    try:
        return subprocess.check_output(cmd, shell=True, text=True).strip()
    except Exception:
        return ""

def get_mkvpkg_packages():
    output = run_cmd("pacman -Slq MKVPKG")
    return output.splitlines() if output else []

def get_local_ver(pkg):
    output = run_cmd(f"pacman -Si MKVPKG/{pkg}")
    for line in output.splitlines():
        if line.startswith("Version"):
            return line.split(":")[1].strip()
    return None

def query_aur(packages):
    results = {}
    for i in range(0, len(packages), 50):
        batch = packages[i:i+50]
        params = "&".join(f"arg[]={pkg}" for pkg in batch)
        url = f"https://aur.archlinux.org/rpc/?v=5&type=info&{params}"
        try:
            req = urllib.request.Request(url, headers={'User-Agent': 'paru-wrapper-updater'})
            with urllib.request.urlopen(req, timeout=10) as response:
                data = json.loads(response.read().decode('utf-8'))
                for res in data.get('results', []):
                    results[res['Name']] = res['Version']
        except Exception as e:
            print(f"Error querying AUR for batch: {e}")
    return results

def main():
    if not os.path.exists(db_path):
        return

    pkgs = get_mkvpkg_packages()
    unmodified_pkgs = []
    local_versions = {}

    for pkg in pkgs:
        proj_path = os.path.join(projects_dir, pkg)
        if not os.path.isdir(proj_path):
            ver = get_local_ver(pkg)
            if ver:
                unmodified_pkgs.append(pkg)
                local_versions[pkg] = ver

    if not unmodified_pkgs:
        return

    aur_versions = query_aur(unmodified_pkgs)
    db_changed = False

    for pkg in unmodified_pkgs:
        aur_ver = aur_versions.get(pkg)
        local_ver = local_versions.get(pkg)
        if aur_ver and local_ver:
            try:
                res = int(subprocess.check_output(["vercmp", aur_ver, local_ver], text=True).strip())
                if res > 0:
                    print(f"[paru-wrapper] Newer version {aur_ver} of public package '{pkg}' found in AUR (local repo has {local_ver}). Removing from MKVPKG to trigger upgrade...")
                    subprocess.run(["repo-remove", "-w", db_path, pkg])
                    db_changed = True
            except Exception as e:
                print(f"Error comparing version for {pkg}: {e}")

    if db_changed:
        subprocess.run(["sudo", "pacman", "-Sy"])

if __name__ == "__main__":
    main()
