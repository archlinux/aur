#!/usr/bin/env bash
# Helper script to test AUR packaging for shrimply-git
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

echo "==> 1. Checking PKGBUILD syntax..."
bash -n PKGBUILD
echo "    PKGBUILD syntax is valid."

echo "==> 2. Generating and validating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO
echo "    .SRCINFO generated successfully."

echo "==> 3. Checking installed dependencies on host system..."
missing_deps=0
deps=()
while IFS= read -r line; do
  deps+=("$line")
done < <(sed -n '/^depends=(/,/)/p;/^makedepends=(/,/)/p' PKGBUILD | grep -E "^\s*'[a-zA-Z0-9_-]+" | sed -E "s/^\s*'([^']+).*/\1/")

for dep in "${deps[@]}"; do
  if pacman -Q "$dep" &>/dev/null; then
    echo "    [OK] $dep ($(pacman -Q "$dep" | awk '{print $2}'))"
  elif pacman -Si "$dep" &>/dev/null; then
    echo "    [OFFICIAL REPO] $dep (can be installed via pacman)"
    missing_deps=$((missing_deps + 1))
  else
    echo "    [AUR PACKAGE] $dep (can be installed via paru / yay)"
    missing_deps=$((missing_deps + 1))
  fi
done

if [ "$missing_deps" -gt 0 ]; then
  echo "==> Note: $missing_deps dependency/dependencies can be resolved via pacman or your AUR helper."
fi

echo "==> 4. Checking Rust toolchain (nightly-2026-04-03)..."
if rustup run nightly-2026-04-03 rustc --version &>/dev/null; then
  echo "    [OK] $(rustup run nightly-2026-04-03 rustc --version)"
else
  echo "    [MISSING] rustup toolchain nightly-2026-04-03 is not yet installed."
  echo "    Run: rustup toolchain install nightly-2026-04-03 --profile minimal"
fi

echo "==> 5. Usage options:"
echo "    - Fast verification (sources + prepare):"
echo "        makepkg --nobuild -s"
echo "    - Install with paru (resolves AUR packages optix, shader-slang, python-manimgl):"
echo "        paru -S shrimply-git"
