#!/usr/bin/bash

set -euo pipefail

msg() {
    echo "[*] $*" >&2
}

warn() {
    echo "WARNING: $*" >&2
}

fail() {
    echo "[*] $*" >&2
    exit 1
}

cmd() {
    echo "[$] $*" >&2
    "$@"
}

confirm() {
    local reply
    local question=${1:-Continue?}

    while true; do
        read -r -p "[?] ${question} [y/N] " reply || return 1

        case "$reply" in
            [Yy] | [Yy][Ee][Ss])
                return 0
                ;;
            [Nn] | [Nn][Oo] | "")
                return 1
                ;;
            *)
                msg "please answer y or n"
                ;;
        esac
    done
}

tmp_files=()

cleanup() {
    if ((${#tmp_files[@]})); then
        rm -rf -- "${tmp_files[@]}"
    fi
}

new_tmp() {
    local tmp
    tmp="$(mktemp)" || fail "unable to create temporary file"
    tmp_files+=("$tmp")
    printf '%s\n' "$tmp"
}

new_tmp_dir() {
    local tmp
    tmp="$(mktemp -d)" || fail "unable to create temporary directory"
    tmp_files+=("$tmp")
    printf '%s\n' "$tmp"
}

trap cleanup EXIT

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$script_dir"

[[ -f PKGBUILD ]] || fail "PKGBUILD not found in ${script_dir}"
[[ -f .SRCINFO ]] || fail ".SRCINFO not found in ${script_dir}"
cmd git rev-parse --show-toplevel >/dev/null || fail "not inside a git worktree"
cmd git diff --cached --quiet || fail "git index is not clean; commit or unstage existing changes first"
cmd git diff --quiet -- PKGBUILD .SRCINFO || fail "PKGBUILD or .SRCINFO has unstaged changes; clean them up first"

latest_ref="$(cmd git ls-remote --refs --tags --sort=-v:refname https://github.com/can1357/oh-my-pi.git 'v*.*.*' | awk 'NR == 1 { print $2 }')"
latest_tag="${latest_ref##*/v}"

if [[ -z $latest_ref ]]; then
    fail "unable to extract latest release ref"
fi

if [[ $latest_tag != *.*.* ]]; then
    fail "invalid version number: ${latest_tag}"
fi

msg "latest release: ${latest_tag}"

pkgver="$(awk -F= '/^pkgver=/{print $2; exit}' PKGBUILD)"
pkgver="${pkgver//[[:space:]]/}"

if [[ -z $pkgver ]]; then
    fail "unable to extract pkgver from PKGBUILD"
fi

if [[ $pkgver != *.*.* ]]; then
    fail "invalid pkgver in PKGBUILD: ${pkgver}"
fi

msg "current pkgver: ${pkgver}"

pkgname="$(awk -F= '/^pkgname=/{print $2; exit}' PKGBUILD)"
pkgname="${pkgname//[[:space:]]/}"

if [[ -z $pkgname ]]; then
    fail "unable to extract pkgname from PKGBUILD"
fi

if [[ $pkgver == "$latest_tag" ]]; then
    msg "PKGBUILD already tracks the latest release"
    exit 0
fi

if ! confirm "Update PKGBUILD from ${pkgver} to ${latest_tag}?"; then
    msg "aborted"
    exit 0
fi

pkgbuild_tmp="$(new_tmp)"
awk -v latest_tag="$latest_tag" '
BEGIN {
    updated_pkgver = 0
    updated_pkgrel = 0
}
/^pkgver=/ && !updated_pkgver {
    print "pkgver=" latest_tag
    updated_pkgver = 1
    next
}
/^pkgrel=/ && !updated_pkgrel {
    print "pkgrel=1"
    updated_pkgrel = 1
    next
}
{
    print
}
END {
    exit((updated_pkgver && updated_pkgrel) ? 0 : 1)
}
' PKGBUILD >"$pkgbuild_tmp"  || fail "unable to update pkgver/pkgrel in PKGBUILD"
cmd mv "$pkgbuild_tmp" PKGBUILD

cmd makepkg || fail "makepkg failed"
cmd makepkg --printsrcinfo >.SRCINFO  || fail "failed to regenerate .SRCINFO"

runtime_dir="$(new_tmp_dir)"
smoke_output="$(
    cmd env HOME="${runtime_dir}/home" XDG_DATA_HOME="${runtime_dir}/xdg" \
        pkg/oh-my-pi/usr/bin/omp --smoke-test
)" || fail "failed to run omp --smoke-test"
if [[ $smoke_output != "smoke-test: ok" ]]; then
    fail "unexpected omp --smoke-test output: ${smoke_output}"
fi
cmd git add PKGBUILD .SRCINFO
cmd git --no-pager diff --cached

if ! confirm "Does the staged diff look good?"; then
    msg "leaving staged changes for manual review"
    exit 0
fi

cmd git commit -m "upstream release: ${latest_tag}" || fail "git commit failed"

if confirm "Push commit to origin?"; then
    cmd git push origin || fail "git push failed"
else
    msg "commit created but not pushed"
fi
