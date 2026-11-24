#!/bin/bash
set -euo pipefail

base=${AWS_S3_RELEASES_URL_BASE:-https://kei-cli-releases.s3.us-east-1.amazonaws.com}

usage() {
    cat <<'USAGE'
Usage: checksum.sh [PKGVERSION]

Print the x86_64 and aarch64 sha256sums for a kei-cli release, read from the
release's own checksums file.

Arguments:
  PKGVERSION    Version to look up (default: upstream's latest.txt)

Options:
  -h, --help    Show this help

Environment:
  AWS_S3_RELEASES_URL_BASE  Release bucket base URL (default: the public
                            kei-cli-releases endpoint)
USAGE
}

case "${1:-}" in
    -h | --help)
        usage
        exit 0
        ;;
    -*)
        echo "unknown option: $1" >&2
        usage >&2
        exit 2
        ;;
esac

ver=${1:-$(curl -fsSL "$base/kei-cli/latest.txt" | tr -d '[:space:]')}
ver=${ver#v}

echo "version: $ver"
curl -fsSL "$base/kei-cli/$ver/kei-cli_${ver}_checksums.txt" |
    while read -r sum file; do
        case "$file" in
            *_Linux_x86_64.tar.gz) echo "x86_64:  $sum" ;;
            *_Linux_arm64.tar.gz) echo "aarch64: $sum" ;;
        esac
    done
