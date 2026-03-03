# fido2-token2-git AUR Packaging Workspace

This directory is prepared for AUR submission with:

- strict allowlist `.gitignore`
- synchronized `PKGBUILD` + `.SRCINFO`
- local pre-commit quality gate for package checks

## Enable Pre-commit Hook

Run this once inside your AUR git repository clone:

```bash
cat > .git/hooks/pre-commit <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
repo_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
"$repo_root/check-aur-package.sh"
EOF
chmod +x .git/hooks/pre-commit
```

## Manual Check Command

```bash
./check-aur-package.sh
```

The check script validates:

- PKGBUILD syntax and VCS metadata (`pkgname`, `pkgver`, `pkgrel`)
- `.SRCINFO` synchronization
- desktop entry validity (if `desktop-file-validate` is installed)
- `namcap` diagnostics (if `namcap` is installed)
- basic AUR submission sanity checks (official repo / AUR name collision hints)

## Optional Strict Mode

To include a clean chroot build (recommended by ArchWiki):

```bash
AUR_CHECK_CHROOT=1 ./check-aur-package.sh
```

## Release Helper

Run all release checks and enforce clean git state:

```bash
./release-aur.sh
```

Run checks and push to AUR in one step:

```bash
./release-aur.sh --push
```

Include clean chroot build in release gate:

```bash
./release-aur.sh --chroot
```
