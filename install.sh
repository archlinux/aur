#!/usr/bin/env sh
set -e

# pre-commit
cat > ./.git/hooks/pre-commit <<EOF
#!/bin/sh
set -e

# make sure the package builds
makepkg --syncdeps --clean --force

# bump .SRCINFO
makepkg --printsrcinfo > ".SRCINFO" && git add ".SRCINFO"
EOF
chmod +x ./.git/hooks/pre-commit
