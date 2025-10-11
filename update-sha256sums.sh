#!/usr/bin/env bash
set -euo pipefail

# Step-by-step, modular sha256 updater for PKGBUILD files.
# Supports generic GitHub repos via CLI options and a dry-run mode.
#
# Quick examples:
#   ./update-sha256sums.sh                         # uses PKGBUILD next to this script
#   ./update-sha256sums.sh -p /path/to/PKGBUILD    # explicit PKGBUILD
#   ./update-sha256sums.sh -r Firstp1ck/Pacsea     # explicit repo
#   ./update-sha256sums.sh -r owner/repo -a bin    # explicit repo + asset
#   ./update-sha256sums.sh -v 1.2.3                # version -> tag=v1.2.3
#   ./update-sha256sums.sh -t v1.2.3               # exact tag
#   ./update-sha256sums.sh -n                      # dry run (no file edits)
#
# Notes:
# - By default, this script:
#   1) Reads pkgver from PKGBUILD
#   2) Deduces repo from PKGBUILD url (if not given)
#   3) Assumes GitHub with tag prefix 'v' (override via -t or --tag-prefix)
#   4) Downloads release asset (default name 'Pacsea') and tagged source tarball
#   5) Updates two-entry sha256sums array (binary on header line, source on next line)
#
# Requirements: curl, sha256sum, sed, grep, awk

#############################################
# Defaults
#############################################
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd -P)
PKGFILE="$script_dir/PKGBUILD"
REPO="Firstp1ck/Pacsea"                 # owner/repo
ASSET_NAME="Pacsea"     # release asset file name
VERSION="v0.4.0"              # e.g. 0.4.0
TAG="v0.4.0"                  # e.g. v0.4.0
TAG_PREFIX="v"          # used when TAG is not provided
BINARY_URL=""           # optional explicit URL override
SOURCE_URL=""           # optional explicit URL override
DRY_RUN=false

STEP=0

#############################################
# Helpers
#############################################
usage() {
  cat <<'EOF'
Usage:
  update-sha256sums.sh [options]

Options:
  -p, --pkgbuild PATH         Path to PKGBUILD (default: PKGBUILD next to this script)
  -r, --repo OWNER/REPO       GitHub repo in owner/repo form (auto-detected from PKGBUILD url if possible)
  -a, --asset NAME            Release asset filename (default: Pacsea)
  -v, --version X.Y.Z         Version; tag is built as TAG_PREFIX+version (default prefix: 'v')
  -t, --tag TAG               Exact tag to use (e.g. v0.4.0). Overrides --version/--tag-prefix
      --tag-prefix PFX        Tag prefix when using --version (default: v)
      --binary-url URL        Override binary download URL (disables repo/asset inference)
      --source-url URL        Override source tarball URL (disables repo inference)
  -n, --dry-run               Show actions and computed hashes but do not modify files
  -h, --help                  Show this help

Examples:
  ./update-sha256sums.sh -p ./PKGBUILD
  ./update-sha256sums.sh -r Firstp1ck/Pacsea -a Pacsea -v 0.4.0
  ./update-sha256sums.sh -t v0.4.0

After updating, regenerate .SRCINFO:
  makepkg --printsrcinfo > .SRCINFO
EOF
}

log_step() {
  STEP=$((STEP+1))
  echo "[$STEP] $*" >&2
}

die() {
  echo "Error: $*" >&2
  exit 1
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "Missing required command: $1"
}

parse_repo_from_url() {
  # Extract owner/repo from a URL like https://github.com/Owner/Repo
  # Returns via echo or empty if not parsable
  local url_line repo
  url_line=$(grep -E '^[[:space:]]*url=' "$PKGFILE" | head -n1 | cut -d '=' -f2- | tr -d '"' | tr -d "'")
  if [[ -n "${url_line:-}" ]]; then
    repo=$(echo "$url_line" | sed -nE 's#^.*/github\.com/([^/]+)/([^/]+)/?$#\1/\2#p')
    [[ -n "${repo:-}" ]] && echo "$repo"
  fi
}

#############################################
# Parse args
#############################################
if [[ $# -gt 0 ]]; then
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -p|--pkgbuild)
        PKGFILE="$2"; shift 2;;
      -r|--repo)
        REPO="$2"; shift 2;;
      -a|--asset)
        ASSET_NAME="$2"; shift 2;;
      -v|--version)
        VERSION="$2"; shift 2;;
      -t|--tag)
        TAG="$2"; shift 2;;
      --tag-prefix)
        TAG_PREFIX="$2"; shift 2;;
      --binary-url)
        BINARY_URL="$2"; shift 2;;
      --source-url)
        SOURCE_URL="$2"; shift 2;;
      -n|--dry-run)
        DRY_RUN=true; shift;;
      -h|--help)
        usage; exit 0;;
      *)
        # Backward-compat: allow a single positional PKGBUILD path
        if [[ "$1" != -* && "$#" -eq 1 ]]; then
          PKGFILE="$1"; shift
        else
          echo "Unknown option: $1" >&2
          usage
          exit 2
        fi
        ;;
    esac
  done
fi

#############################################
# Validations & discovery
#############################################
require_cmd curl
require_cmd sha256sum
require_cmd sed
require_cmd grep
require_cmd awk

[[ -f "$PKGFILE" ]] || die "PKGBUILD not found: $PKGFILE"

log_step "Reading pkgver from $PKGFILE"
if [[ -z "${VERSION:-}" ]]; then
  VERSION=$(grep -E '^[[:space:]]*pkgver=' "$PKGFILE" | head -n1 | cut -d '=' -f2 || true)
  [[ -n "${VERSION:-}" ]] || die "Failed to read pkgver from $PKGFILE. Provide --version or --tag."
fi

if [[ -z "${TAG:-}" ]]; then
  TAG="${TAG_PREFIX}${VERSION}"
fi

if [[ -z "${REPO:-}" && -z "${BINARY_URL:-}" ]]; then
  log_step "Trying to deduce repo from PKGBUILD url"
  REPO=$(parse_repo_from_url || true)
fi

if [[ -z "${BINARY_URL:-}" ]]; then
  if [[ -z "${REPO:-}" ]]; then
    die "Repo could not be determined. Provide --repo OWNER/REPO or --binary-url/--source-url."
  fi
  BINARY_URL="https://github.com/${REPO}/releases/download/${TAG}/${ASSET_NAME}"
fi

if [[ -z "${SOURCE_URL:-}" ]]; then
  if [[ -z "${REPO:-}" ]]; then
    die "Source URL could not be determined. Provide --repo or --source-url."
  fi
  SOURCE_URL="https://github.com/${REPO}/archive/refs/tags/${TAG}.tar.gz"
fi

echo "Repo:         ${REPO:-"(n/a) (custom URLs)"}" >&2
console_output=""
echo "Version:      ${VERSION}" >&2
console_output+=""
echo "Tag:          ${TAG}" >&2
console_output+=""
echo "Asset name:   ${ASSET_NAME}" >&2
echo "Binary URL:   ${BINARY_URL}" >&2
echo "Source URL:   ${SOURCE_URL}" >&2

#############################################
# Download artifacts and compute hashes
#############################################
log_step "Downloading artifacts for ${TAG}"
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

bin_path="$tmpdir/${ASSET_NAME}"
src_path="$tmpdir/src-${TAG}.tar.gz"

curl -fsSL -o "$bin_path" "$BINARY_URL"
curl -fsSL -o "$src_path" "$SOURCE_URL"

log_step "Computing sha256 sums"
sha_bin=$(sha256sum "$bin_path" | awk '{print $1}')
sha_src=$(sha256sum "$src_path" | awk '{print $1}')

echo "  binary:  $sha_bin" >&2
echo "  source:  $sha_src" >&2

#############################################
# Update PKGBUILD
#############################################
log_step "Locating sha256sums=( in $PKGFILE"
sha_line=$(grep -n '^[[:space:]]*sha256sums\=(' "$PKGFILE" | head -n1 | cut -d: -f1 || true)
[[ -n "${sha_line:-}" ]] || die "Could not find sha256sums=( in $PKGFILE"

if $DRY_RUN; then
  echo "[dry-run] Would update $PKGFILE at line $sha_line and the next line with the following values:" >&2
  echo "[dry-run]   first entry (binary): $sha_bin" >&2
  echo "[dry-run]   second entry (source): $sha_src" >&2
else
  log_step "Updating sha256sums entries"
  # Replace quoted content on the sha256sums header line (first entry) and the next line (second entry).
  sed -i "${sha_line}s/'[^']*'/'${sha_bin//\//\/}'/" "$PKGFILE"
  sed -i "$((sha_line+1))s/'[^']*'/'${sha_src//\//\/}'/" "$PKGFILE"
  echo "Updated sha256sums in $PKGFILE" >&2
fi

echo >&2
echo "Next steps:" >&2
echo "  makepkg --printsrcinfo > .SRCINFO" >&2
echo "  git add $PKGFILE .SRCINFO && git commit -m 'Update checksums for ${TAG}'" >&2

exit 0


