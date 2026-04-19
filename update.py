#!/usr/bin/env python3

import sys
import hashlib
import re
import urllib.request
import subprocess
from pathlib import Path
from typing import List, Tuple, Dict, Optional


# --- Version update ---

VCS_PREFIXES = (
    "git+", "hg+", "svn+", "bzr+",
    "git://", "hg://", "svn://", "bzr://",
)


def get_new_kernver(pkgbuild_path: Path) -> str:
    for line in pkgbuild_path.read_text().splitlines():
        if line.startswith("pkgver="):
            pkgver = line.split("=", 1)[1]
            return pkgver.replace(".reform", "-reform", 1)
    raise ValueError("pkgver not found in PKGBUILD")


def get_current_kernver(content: str, prefix: str, suffix: str) -> str:
    idx = content.find(prefix)
    if idx == -1:
        raise ValueError(f"Could not locate kernel version (prefix: {prefix!r})")
    rest = content[idx + len(prefix):]
    return rest[: rest.find(suffix)]


def update_version_in_file(path: Path, prefix: str, suffix: str, new_kernver: str) -> bool:
    content = path.read_text()
    old_kernver = get_current_kernver(content, prefix, suffix)
    if old_kernver == new_kernver:
        return False
    path.write_text(content.replace(old_kernver, new_kernver))
    print(f"  {path.name}: {old_kernver} -> {new_kernver}")
    return True


def update_versions(pkgbuild_dir: Path, new_kernver: str) -> None:
    print("Updating kernel version strings...")
    changed = any([
        update_version_in_file(
            pkgbuild_dir / "linux-mnt-reform-bin.install",
            prefix="meson-g12b-bananapi-cm4-mnt-pocket-reform-",
            suffix=".dtb",
            new_kernver=new_kernver,
        ),
        update_version_in_file(
            pkgbuild_dir / "mnt-reform-initramfs.sh",
            prefix='KVER="',
            suffix='"',
            new_kernver=new_kernver,
        ),
    ])
    if not changed:
        print(f"  Warning: pkgver appears unchanged ({new_kernver}) — did you forget to bump it?")
    print()


# --- SHA update ---

def is_vcs_url(url: str) -> bool:
    return bool(url) and url.startswith(VCS_PREFIXES)


def parse_vcs_url(url: str) -> Tuple[str, Optional[str], Optional[str]]:
    if url.startswith("git+"):
        url = url[len("git+"):]
    base, _, frag = url.partition("#")
    params = {}
    if frag:
        for part in frag.split("&"):
            if "=" in part:
                k, v = part.split("=", 1)
                params[k] = v
            elif part:
                params[part] = True
    for key in ("tag", "branch", "commit", "rev"):
        if key in params:
            return base, params[key], key
    return base, None, None


def sanitize_ref(ref: str) -> str:
    return re.sub(r"[^a-zA-Z0-9._-]+", "_", ref)


def run_git(cmd: List[str], cwd: Path = None) -> None:
    subprocess.run(cmd, cwd=cwd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)


def sha256_of_file(path: Path) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for block in iter(lambda: f.read(4096), b""):
            h.update(block)
    return h.hexdigest()


def ensure_git_repo(repo_url: str, repo_path: Path) -> None:
    if repo_path.exists() and (repo_path / ".git").exists():
        run_git(["git", "-C", str(repo_path), "remote", "set-url", "origin", repo_url])
        run_git(["git", "-C", str(repo_path), "fetch", "--tags", "--prune", "origin"])
        return
    if repo_path.exists():
        raise RuntimeError(f"Path exists but is not a git repo: {repo_path}")
    run_git(["git", "clone", repo_url, str(repo_path)])


def fetch_git_archive_sha(url: str, archive_path: Path, repo_path: Path) -> str:
    repo_url, ref, _ = parse_vcs_url(url)
    ensure_git_repo(repo_url, repo_path)
    run_git(["git", "-C", str(repo_path), "checkout", "-f", ref or "HEAD"])
    run_git(["git", "-C", str(repo_path), "archive", "--format=tar", "-o", str(archive_path), "HEAD"])
    return sha256_of_file(archive_path)


def parse_array_entries(array_content: str) -> List[str]:
    entries = []
    for line in array_content.split('\n'):
        line = line.strip().strip(',').strip('"').strip("'")
        if line and not line.startswith('#'):
            entries.append(line)
    return entries


def expand_vars(value: str, variables: Dict[str, str]) -> str:
    expanded = value
    for var_name, var_value in variables.items():
        expanded = expanded.replace(f'${{{var_name}}}', var_value)
        expanded = re.sub(rf'\${var_name}(?![a-zA-Z0-9_])', var_value, expanded)
    return expanded


def parse_source_entries(source_content: str, variables: Dict[str, str]) -> List[Dict[str, Optional[str]]]:
    sources = []
    for line in parse_array_entries(source_content):
        if '::' in line:
            filename, url = line.split('::', 1)
        elif line.startswith(('http://', 'https://') + VCS_PREFIXES):
            url = line
            repo_url, _, _ = parse_vcs_url(url) if is_vcs_url(url) else (url, None, None)
            filename = repo_url.split('/')[-1].removesuffix(".git") if is_vcs_url(url) else url.split('/')[-1]
        else:
            filename, url = line, None

        sources.append({
            'filename': expand_vars(filename.strip('"').strip("'"), variables),
            'url': expand_vars(url.strip('"').strip("'"), variables) if url else None,
            'vcs': is_vcs_url(url),
        })
    return sources


def parse_pkgbuild(pkgbuild_path: Path) -> Tuple[Dict, Dict[str, str]]:
    content = pkgbuild_path.read_text()

    variables = {}
    for line in content.split('\n'):
        line = line.strip()
        if '=' in line and not line.startswith('#'):
            m = re.match(r'^([a-zA-Z_][a-zA-Z0-9_]*)=(.+)$', line)
            if m:
                variables[m.group(1)] = m.group(2).strip('"').strip("'")

    for _ in range(5):
        changed = False
        for k, v in list(variables.items()):
            new_v = v
            for ok, ov in variables.items():
                new_v = new_v.replace(f'${{{ok}}}', ov)
                new_v = re.sub(rf'\${ok}(?![a-zA-Z0-9_])', ov, new_v)
            if new_v != v:
                variables[k] = new_v
                changed = True
        if not changed:
            break

    grouped = {}
    for m in re.finditer(r'^(source(?:_[a-zA-Z0-9_]+)?)=\((.*?)\)', content, re.DOTALL | re.MULTILINE):
        suffix = m.group(1)[len('source'):]
        grouped.setdefault(suffix, {})
        grouped[suffix]['source_array'] = m.group(1)
        grouped[suffix]['sources'] = parse_source_entries(m.group(2), variables)

    for m in re.finditer(r'^(sha256sums(?:_[a-zA-Z0-9_]+)?)=\((.*?)\)', content, re.DOTALL | re.MULTILINE):
        suffix = m.group(1)[len('sha256sums'):]
        grouped.setdefault(suffix, {})
        grouped[suffix]['sha_array'] = m.group(1)
        grouped[suffix]['shas'] = parse_array_entries(m.group(2))

    if not grouped:
        print("Error: Could not find any source arrays in PKGBUILD")
        sys.exit(1)

    return grouped, variables


def download_file(url: str, dest_path: Path) -> bool:
    try:
        print(f"  Downloading: {url}")
        with urllib.request.urlopen(url) as response:
            total = int(response.headers.get('content-length', 0))
            downloaded = 0
            with open(dest_path, 'wb') as f:
                for chunk in iter(lambda: response.read(8192), b""):
                    f.write(chunk)
                    downloaded += len(chunk)
                    if total:
                        print(f"  {downloaded/total*100:.1f}%", end='\r')
        print(f"  Downloaded: {dest_path.name}      ")
        return True
    except Exception as e:
        print(f"  Download failed: {e}")
        dest_path.unlink(missing_ok=True)
        return False


def format_sha_array(array_name: str, shas: List[str]) -> str:
    lines = [f"{array_name}=("]
    for sha in shas:
        lines.append(f"  '{sha}'")
    lines.append(")")
    return "\n".join(lines)


def update_pkgbuild_shas(pkgbuild_path: Path, updates: Dict[str, List[str]]) -> bool:
    content = pkgbuild_path.read_text()
    updated = content
    for array_name, new_shas in updates.items():
        pattern = rf'^{re.escape(array_name)}=\((.*?)\)'
        replacement = format_sha_array(array_name, new_shas)
        updated, count = re.subn(pattern, replacement, updated, flags=re.DOTALL | re.MULTILINE)
        if count == 0:
            raise RuntimeError(f"Could not find array {array_name} in PKGBUILD")
    if updated != content:
        pkgbuild_path.write_text(updated)
        return True
    return False


def prompt_replace(mismatches: list) -> bool:
    print("\n" + "=" * 70)
    print(f"Found {len(mismatches)} mismatched checksum(s):")
    for suffix, sha_array, idx, filename, expected, actual in mismatches:
        label = suffix[1:] if suffix.startswith('_') else (suffix or 'default')
        print(f"  [{label}:{idx}] {filename}")
        print(f"       Old: {expected}")
        print(f"       New: {actual}")
    print()
    try:
        answer = input("Replace all mismatched SHA256sums in PKGBUILD? [Y/n]: ").strip()
    except (EOFError, KeyboardInterrupt):
        print()
        answer = ""
    return answer.lower() in ("", "y", "yes")


def update_shas(pkgbuild_path: Path) -> None:
    pkgbuild_dir = pkgbuild_path.parent
    print(f"\nChecking SHA256 checksums...")
    print("=" * 70)

    grouped, variables = parse_pkgbuild(pkgbuild_path)

    for var in ('pkgver', 'pkgrel', '_kernver'):
        if var in variables:
            print(f"  {var} = {variables[var]}")
    print("=" * 70)

    all_match = True
    mismatches = []
    updated_sha_arrays: Dict[str, List[str]] = {}

    for suffix in sorted(grouped.keys()):
        group = grouped[suffix]
        sources = group['sources']
        expected_shas = group['shas']
        sha_array = group['sha_array']
        label = suffix[1:] if suffix.startswith('_') else (suffix or 'default')

        print(f"\nGroup: {label}")
        print("-" * 70)

        if len(sources) != len(expected_shas):
            print(f"Error: {len(sources)} sources but {len(expected_shas)} checksums in {sha_array}")
            sys.exit(1)

        new_shas = list(expected_shas)

        for i, (source, expected_sha) in enumerate(zip(sources, expected_shas), 1):
            filename = source['filename']
            url = source['url']
            source_path = pkgbuild_dir / filename

            print(f"\n[{i}/{len(sources)}] {filename}")

            if source.get('vcs') and url:
                try:
                    repo_url, ref, _ = parse_vcs_url(url)
                    archive_name = f"{filename}-{sanitize_ref(ref)}" if ref else filename
                    archive_path = (pkgbuild_dir / f"{archive_name}.tar").resolve()
                    repo_path = (pkgbuild_dir / f"{filename}-vcs").resolve()
                    if archive_path.exists():
                        print("  Using existing VCS archive")
                        actual_sha = sha256_of_file(archive_path)
                    else:
                        print("  Fetching VCS source")
                        actual_sha = fetch_git_archive_sha(url, archive_path, repo_path)
                except Exception as e:
                    print(f"  VCS fetch failed: {e}")
                    all_match = False
                    continue
            else:
                if not source_path.exists() and url:
                    if not download_file(url, source_path):
                        all_match = False
                        continue
                elif not source_path.exists():
                    print(f"  File not found (no URL to download)")
                    all_match = False
                    continue
                actual_sha = sha256_of_file(source_path)

            if expected_sha == "SKIP":
                print(f"  SKIP -> {actual_sha}")
                new_shas[i - 1] = actual_sha
                mismatches.append((suffix, sha_array, i, filename, expected_sha, actual_sha))
                all_match = False
            elif actual_sha == expected_sha:
                print(f"  OK: {actual_sha}")
            else:
                print(f"  MISMATCH\n  Old: {expected_sha}\n  New: {actual_sha}")
                new_shas[i - 1] = actual_sha
                mismatches.append((suffix, sha_array, i, filename, expected_sha, actual_sha))
                all_match = False

        updated_sha_arrays[sha_array] = new_shas

    print("\n" + "=" * 70)

    if all_match:
        print("All checksums match.")
        return

    if mismatches and prompt_replace(mismatches):
        updates = {sha_array: updated_sha_arrays[sha_array] for _, sha_array, _, _, _, _ in mismatches}
        if update_pkgbuild_shas(pkgbuild_path, updates):
            print(f"\nUpdated {len(mismatches)} SHA256sum(s) in {pkgbuild_path}")
            print("Updating .SRCINFO...")
            try:
                result = subprocess.run(
                    ["makepkg", "--printsrcinfo"],
                    cwd=pkgbuild_dir, check=True,
                    stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
                )
                (pkgbuild_dir / ".SRCINFO").write_text(result.stdout)
                print(".SRCINFO updated.")
            except FileNotFoundError:
                print("makepkg not found — .SRCINFO was NOT updated.")
            except subprocess.CalledProcessError as e:
                print(f"makepkg --printsrcinfo failed:\n{e.stderr}")
    else:
        print("No changes made.")
        sys.exit(1)


# --- Main ---

def main():
    pkgbuild_path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("PKGBUILD")

    if not pkgbuild_path.exists():
        print(f"Error: {pkgbuild_path} not found")
        sys.exit(1)

    pkgbuild_dir = pkgbuild_path.parent
    new_kernver = get_new_kernver(pkgbuild_path)
    print(f"Kernel version: {new_kernver}")
    print("=" * 70)

    update_versions(pkgbuild_dir, new_kernver)
    update_shas(pkgbuild_path)


if __name__ == "__main__":
    main()
