#!/usr/bin/env bash

set -Eeuo pipefail
shopt -s nullglob

GITHUB_REPO="emavgl/oinkoin"
AUR_PKGNAME="oinkoin-bin"
GITHUB_REMOTE="origin"

PKG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGBUILD_FILE="${PKG_DIR}/PKGBUILD"
SRCINFO_FILE="${PKG_DIR}/.SRCINFO"

DRY_RUN=false
NO_PUSH=false
NO_BUILD=false
ASSUME_YES=false

for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=true ;;
        --no-push) NO_PUSH=true ;;
        --no-build) NO_BUILD=true ;;
        --yes|-y) ASSUME_YES=true ;;
        *) echo "Unknown option: $arg" >&2; exit 1 ;;
    esac
done

c_blue="\033[1;34m"; c_green="\033[1;32m"; c_red="\033[1;31m"; c_yellow="\033[1;33m"; c_reset="\033[0m"
info() { echo -e "${c_blue}[*]${c_reset} $*"; }
ok()   { echo -e "${c_green}[+]${c_reset} $*"; }
warn() { echo -e "${c_yellow}[!]${c_reset} $*"; }
fail() { echo -e "${c_red}[x]${c_reset} $*" >&2; exit 1; }
need() { command -v "$1" >/dev/null 2>&1 || fail "Missing required CLI tool: $1"; }

cleanup_artifacts() {
    rm -rf "${PKG_DIR}/pkg" "${PKG_DIR}/src" "${PKG_DIR}/squashfs-root"
    rm -f -- "${PKG_DIR}"/*.pkg.tar.*
}

COMMITTED=false
rollback() {
    warn "Error triggered during execution."
    if ! $COMMITTED; then
        warn "Rolling back uncommitted local changes..."
        git checkout -- "$PKGBUILD_FILE" "$SRCINFO_FILE" 2>/dev/null || true
    else
        warn "A local commit already exists (may already be pushed)."
        warn "Nothing auto-reverted. To finish manually: cd '${REPO_ROOT:-$PKG_DIR}' && aurpublish ${AUR_PKGNAME}"
    fi
    cleanup_artifacts
    exit 1
}
trap rollback ERR INT TERM

need curl; need jq; need git; need gh; need ssh
need makepkg; need updpkgsums; need aurpublish; need namcap; need vercmp

[[ -f "$PKGBUILD_FILE" ]] || fail "PKGBUILD not found at $PKGBUILD_FILE"
cd "$PKG_DIR"
REPO_ROOT="$(git rev-parse --show-toplevel)" || fail "Not inside a git repository"
CURRENT_BRANCH="$(git branch --show-current)"
[[ -n "$CURRENT_BRANCH" ]] || fail "Detached HEAD state; cannot resolve current branch"

info "Verifying authentication state..."
gh auth status >/dev/null 2>&1 || fail "gh CLI is not authenticated. Run 'gh auth login' first."
GH_USER="$(gh api user --jq .login)"
ok "gh authenticated as: ${GH_USER}"

ssh_out="$(ssh -T -o StrictHostKeyChecking=accept-new -o ConnectTimeout=10 -o BatchMode=yes \
    aur@aur.archlinux.org 2>&1 || true)"
if grep -qiE "Interactive shell is disabled|Welcome to AUR" <<<"$ssh_out"; then
    ok "AUR SSH key authentication verified."
elif grep -qiE "could not resolve|connection (timed out|refused)|network is unreachable|no route to host" <<<"$ssh_out"; then
    fail "Cannot reach aur.archlinux.org — AUR may be down or unreachable:\n${ssh_out}"
else
    fail "SSH authentication to aur.archlinux.org failed:\n${ssh_out}"
fi

current_pkgver="$(awk -F= '/^pkgver=/{print $2; exit}' "$PKGBUILD_FILE" | tr -d "'\"")"
current_pkgrel="$(awk -F= '/^pkgrel=/{print $2; exit}' "$PKGBUILD_FILE" | tr -d "'\"")"
info "Currently packaged: ${current_pkgver}-${current_pkgrel}"

release_json="$(gh api "repos/${GITHUB_REPO}/releases/latest")" || fail "Failed to query GitHub release via gh CLI."

latest_tag="$(jq -r '.tag_name' <<<"$release_json")"
[[ -n "$latest_tag" && "$latest_tag" != "null" ]] || fail "Could not resolve tag_name from release JSON"
latest_pkgver="${latest_tag#v}"

latest_appimage_name="$(jq -r '[.assets[].name | select(test("^piggybank-.*-linux\\.AppImage$"))][0] // empty' <<<"$release_json")"
[[ -n "$latest_appimage_name" ]] || fail "No valid Linux AppImage asset found in release ${latest_tag}"

info "Latest upstream: ${latest_pkgver} (${latest_appimage_name})"

vercmp_result="$(vercmp "$latest_pkgver" "$current_pkgver")"
if [[ "$vercmp_result" -eq 0 ]]; then
    trap - ERR INT TERM
    ok "Already up to date."
    exit 0
elif [[ "$vercmp_result" -lt 0 ]]; then
    trap - ERR INT TERM
    warn "Latest release (${latest_pkgver}) is older than packaged version (${current_pkgver}) per vercmp. Skipping."
    exit 0
fi

info "Update available: ${current_pkgver} -> ${latest_pkgver}"
if $DRY_RUN; then
    trap - ERR INT TERM
    ok "Dry run complete. Exiting without modifying files."
    exit 0
fi

if ! $ASSUME_YES; then
    [[ -t 0 ]] || fail "No TTY for confirmation prompt (e.g. running under cron). Re-run with --yes."
    read -rp "Update, verify, build, and publish now? [y/N] " reply
    if [[ ! "$reply" =~ ^[Yy]$ ]]; then
        trap - ERR INT TERM
        warn "Aborted by user."
        exit 0
    fi
fi

esc_appimage="$(sed 's/[\\&|]/\\&/g' <<<"$latest_appimage_name")"

sed -i \
    -e "s|^pkgver=.*|pkgver=${latest_pkgver}|" \
    -e "s|^pkgrel=.*|pkgrel=1|" \
    -e "s|^_appimage=.*|_appimage=\"${esc_appimage}\"|" \
    -e "s|^sha256sums=.*|sha256sums=('SKIP')|" \
    "$PKGBUILD_FILE"

info "Updating checksums..."
updpkgsums "$PKGBUILD_FILE" || fail "updpkgsums failed"
new_sha256="$(awk -F"'" '/^sha256sums=/{print $2; exit}' "$PKGBUILD_FILE")"
ok "New sha256sum: ${new_sha256}"

bash -n "$PKGBUILD_FILE" || fail "PKGBUILD syntax check failed"

info "Extracting and inspecting AppImage payload structure..."
cleanup_artifacts
makepkg -od --noprepare --noconfirm

pushd "${PKG_DIR}/src" >/dev/null
chmod +x "${latest_appimage_name}"
./"${latest_appimage_name}" --appimage-extract >/dev/null 2>&1 || fail "Failed to extract AppImage contents."

[[ -f "squashfs-root/piggybank.desktop" ]] || fail "Payload change: squashfs-root/piggybank.desktop missing!"
[[ -f "squashfs-root/piggybank.png" ]] || fail "Payload change: squashfs-root/piggybank.png missing!"

bin_found=false
for bin_target in "squashfs-root/AppRun" "squashfs-root/piggybank" "squashfs-root/oinkoin"; do
    if [[ -f "$bin_target" && -x "$bin_target" ]]; then
        bin_found=true
        info "Validating runtime shared libraries on ${bin_target}..."
        missing_libs="$(ldd "$bin_target" 2>/dev/null | awk '/not found/{print $1}' || true)"
        [[ -z "$missing_libs" ]] || fail "Missing runtime shared libraries detected in AppImage payload:\n${missing_libs}"
        break
    fi
done
$bin_found || fail "None of AppRun/piggybank/oinkoin found in payload; upstream layout may have changed."
popd >/dev/null

rm -rf "${PKG_DIR}/src"

makepkg --printsrcinfo > "$SRCINFO_FILE" || fail "Failed to generate .SRCINFO"

if ! $NO_BUILD; then
    info "Running strict verification build..."
    makepkg -f --noconfirm || fail "makepkg verification build failed."

    built_pkg=( "${PKG_DIR}/${AUR_PKGNAME}-${latest_pkgver}"-*.pkg.tar.* )
    [[ ${#built_pkg[@]} -gt 0 ]] || fail "Compiled package archive not found."

    info "Auditing package with namcap..."
    namcap_output="$(namcap "${built_pkg[0]}" 2>&1 || true)"
    [[ -z "$namcap_output" ]] || echo "$namcap_output"
    if grep -qE "^${AUR_PKGNAME} E:" <<<"$namcap_output"; then
        fail "namcap detected critical packaging errors (see above)."
    fi
    ok "Package passed namcap validation without errors."
else
    warn "Skipping verification build (--no-build)."
fi

cleanup_artifacts

git add PKGBUILD .SRCINFO
if git diff --cached --quiet; then
    warn "No index changes detected. Skipping git commit."
    if git log -1 --pretty=%B | grep -qF "${latest_pkgver}"; then
        COMMITTED=true
    fi
else
    git commit -m "${AUR_PKGNAME}: update to ${latest_pkgver}"
    COMMITTED=true
fi

if $NO_PUSH; then
    warn "Skipping remote pushes (--no-push)."
else
    info "Pushing to GitHub..."
    (cd "$REPO_ROOT" && git push "$GITHUB_REMOTE" "$CURRENT_BRANCH") || \
        fail "git push to GitHub failed. Local commit is intact; push manually, then run: aurpublish ${AUR_PKGNAME}"

    info "Publishing to AUR (irreversible)..."
    (cd "$REPO_ROOT" && aurpublish "$AUR_PKGNAME") || \
        fail "aurpublish failed (AUR may be down). Nothing else lost — retry later with: cd '${REPO_ROOT}' && aurpublish ${AUR_PKGNAME}"
fi

trap - ERR INT TERM
ok "Successfully verified, built, and published ${AUR_PKGNAME} v${latest_pkgver} to AUR and GitHub."
