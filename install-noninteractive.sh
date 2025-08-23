#!/usr/bin/env bash
set -euo pipefail

# Usage: install-noninteractive.sh "$pkgdir"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <pkgdir>" >&2
    exit 1
fi

pkgdir="$1"
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Prepare destination directory for Neovim config
mkdir -p "$pkgdir/usr/share/rootvim"

# Copy all configuration files from rootvim-main directory in source
if [ ! -d "$srcdir/rootvim-main" ]; then
    echo "Error: rootvim-main directory not found in $srcdir" >&2
    exit 1
fi

cp -r "$srcdir/rootvim-main/"* "$pkgdir/usr/share/rootvim/" || {
    echo "Error: failed to copy configuration files" >&2
    exit 1
}

# Create Python virtual environment inside package directory
GLOBAL_PY="$pkgdir/usr/share/rootvim/.globalPython"

python3 -m venv "$GLOBAL_PY" || {
    echo "Error: failed to create Python virtual environment" >&2
    exit 1
}

# Upgrade pip and essentials silently
"$GLOBAL_PY/bin/pip" install --upgrade pip setuptools wheel >/dev/null || {
    echo "Error: failed to upgrade pip, setuptools, wheel" >&2
    exit 1
}

# Install pynvim only
"$GLOBAL_PY/bin/pip" install --no-cache-dir pynvim >/dev/null || {
    echo "Error: failed to install pynvim" >&2
    exit 1
}

exit 0

