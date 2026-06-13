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

extract_bun_depend() {
    local package_json_path=$1
    local requirement

    [[ -f $package_json_path ]] || return 1

    requirement="$(awk -F'"' '
BEGIN {
    in_engines = 0
}
/^[[:space:]]*"engines"[[:space:]]*:/ {
    in_engines = 1
    next
}
in_engines && /^[[:space:]]*}/ {
    in_engines = 0
}
in_engines && $2 == "bun" {
    print $4
    found = 1
    exit
}
END {
    exit(found ? 0 : 1)
}
' "$package_json_path")" || return 1

    case "$requirement" in
        \>\=[0-9]*)
            ;;
        *)
            return 1
            ;;
    esac

    if [[ $requirement == *[[:space:]]* ]]; then
        return 1
    fi

    printf 'bun%s\n' "$requirement"
}

current_bun_makedepend() {
    awk '
/^makedepends=\(/ {
    line = $0
    sub(/^makedepends=\(/, "", line)
    sub(/\)[[:space:]]*$/, "", line)

    count = split(line, deps, /[[:space:]]+/)
    for (i = 1; i <= count; i++) {
        dep = deps[i]
        gsub(/\047/, "", dep)
        if (dep ~ /^bun($|[<>=])/) {
            print dep
            found = 1
            exit
        }
    }
}
END {
    exit(found ? 0 : 1)
}
' PKGBUILD
}

update_bun_makedepend() {
    local bun_dep=$1
    local pkgbuild_tmp

    pkgbuild_tmp="$(new_tmp)"
    awk -v bun_dep="$bun_dep" '
function emit_dependency(dep) {
    if (dep == "" || dep ~ /^bun($|[<>=])/) {
        return
    }

    printf " \047%s\047", dep
}
BEGIN {
    updated = 0
}
/^makedepends=\(/ && !updated {
    line = $0
    sub(/^makedepends=\(/, "", line)
    sub(/\)[[:space:]]*$/, "", line)

    printf "makedepends=(\047%s\047", bun_dep
    count = split(line, deps, /[[:space:]]+/)
    for (i = 1; i <= count; i++) {
        dep = deps[i]
        gsub(/\047/, "", dep)
        emit_dependency(dep)
    }
    print ")"

    updated = 1
    next
}
{
    print
}
END {
    exit(updated ? 0 : 1)
}
' PKGBUILD >"$pkgbuild_tmp" || fail "unable to update bun make dependency in PKGBUILD"
    cmd mv "$pkgbuild_tmp" PKGBUILD
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

cmd makepkg -f -o --noprepare || fail "failed to checkout sources"

package_json_path="src/${pkgname}/packages/coding-agent/package.json"

if bun_dep="$(extract_bun_depend "$package_json_path")"; then
    msg "minimum bun make dependency: ${bun_dep}"
else
    warn "unable to extract bun engine requirement from ${package_json_path}; preserving existing bun makedepend"
    bun_dep="$(current_bun_makedepend)" || bun_dep='bun'
fi

update_bun_makedepend "$bun_dep"

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
