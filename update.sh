#!/usr/bin/env bash
set -euo pipefail

# ---- configuration ----
REPO=git@gitlab.archlinux.org:archlinux/packaging/packages/linux.git
WSLCFG=https://raw.githubusercontent.com/microsoft/WSL2-Linux-Kernel/refs/heads/linux-msft-wsl-6.18.y/arch/x86/configs/config-wsl
NAME='HsingYun'
EMAIL='iakext@gmail.com'
# Fixed UUID + hash-seed so the generated modules vhdx is reproducible across builds.
MODVHD_UUID='e5ad0b84-b754-40a7-b15f-20625830df25'

step() { echo "==> $*"; }
die()  { echo "==> assertion failed: $*" >&2; exit 1; }

ensure_ignore() {
  local pat=$1
  if ! { [[ -f .gitignore ]] && grep -qxF -- "$pat" .gitignore; }; then
    echo "$pat" >> .gitignore
  fi
}

cd "$(dirname "$(readlink -f "$0")")"

step "[0/9] checking prerequisites"
for c in git curl makepkg updpkgsums awk sed find; do
  command -v "$c" >/dev/null || { echo "missing dependency: $c" >&2; exit 1; }
done
[[ $EUID -ne 0 ]] || { echo "do not run makepkg as root" >&2; exit 1; }
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "not inside a git work tree" >&2; exit 1; }

tmpd=""
bootbody=""
vhdxbody=""
err_line=0
trap 'err_line=$LINENO' ERR
on_exit() {
  local rc=$?
  [[ -n $tmpd ]] && rm -rf "$tmpd" 2>/dev/null || true
  [[ -n $bootbody ]] && rm -f "$bootbody" 2>/dev/null || true
  [[ -n $vhdxbody ]] && rm -f "$vhdxbody" 2>/dev/null || true
  if (( rc != 0 )); then
    echo "==> FAILED at line $err_line (exit $rc); rolling back work tree." >&2
    git rev-parse --verify -q HEAD >/dev/null 2>&1 && git reset --hard HEAD >/dev/null 2>&1 || true
    git clean -fd -e update.sh >/dev/null 2>&1 || true
    echo "==> rolled back to last commit; see the error above for the failing step." >&2
  fi
}
trap on_exit EXIT

step "[1/9] wiping work tree down to .git + update.sh"
find . -mindepth 1 -maxdepth 1 ! -name .git ! -name update.sh -exec rm -rf {} +

step "[2/9] cloning Arch linux package: $REPO"
tmpd=$(mktemp -d)
git clone --depth=1 "$REPO" "$tmpd"
step "[2/9] copying package contents into work tree"
find "$tmpd" -mindepth 1 -maxdepth 1 ! -name .git -exec cp -rt . {} +

step "[3/9] fetching Microsoft config-wsl -> config.x86_64"
curl -fsSL "$WSLCFG" -o config.x86_64

step "[3/9] tuning config: debug overhead off, harvest from arch"
# All config changes go through set_cfg: if the symbol already has a line (in whatever form
# config-wsl ships it: =y/=m/=n/not-set), replace it IN PLACE so its original position is
# preserved (smaller diffs against config-wsl); only if absent do we append. A plain targeted
# sed would silently no-op when upstream changed the symbol's form; this check-first form does
# not. \b stops a prefix from clobbering a longer symbol (e.g. NTFS3_FS vs NTFS3_FS_POSIX_ACL).
set_cfg() {
  local key=$1 val=$2 line   # val: y | m | n
  if [[ $val == n ]]; then line="# CONFIG_$key is not set"; else line="CONFIG_$key=$val"; fi
  if grep -qE "^(# )?CONFIG_${key}\b" config.x86_64; then
    sed -i -E "s|^(# )?CONFIG_${key}\b.*|${line}|" config.x86_64
  else
    printf '%s\n' "$line" >> config.x86_64
  fi
}

# CONFIG_DXGKRNL: config-wsl sets it =y, but it's a Microsoft out-of-tree symbol absent from
# the Arch source tree, so olddefconfig drops it automatically at build time. No action needed.
# If dxgkrnl ever lands mainline it stops being out-of-tree, so we deliberately do NOT force off.

# Drop sanity-check debuggers that cost on hot paths (list/SG validation per op).
# NEVER touch DEBUG_INFO_BTF (BPF CO-RE / vmlinux.h depend on it), DEBUG_FS, DEBUG_KERNEL.
for _s in DEBUG_LIST DEBUG_SG DEBUG_NOTIFIERS DEBUG_MISC; do set_cfg "$_s" n; done

# ORC unwinder: zero-cost stack unwinding + more accurate traces, replacing frame-pointer.
set_cfg UNWINDER_ORC y
set_cfg UNWINDER_FRAME_POINTER n

# NTFS3 built in (=y): mount bare NTFS disks without modprobe, independent of the modules vhdx.
#   LZX_XPRESS=y   - read Windows-compressed (LZX/Xpress) files
#   FS_POSIX_ACL=n - no POSIX ACLs (would select FS_POSIX_ACL; unwanted on WSL)
set_cfg NTFS3_FS y
set_cfg NTFS3_LZX_XPRESS y
set_cfg NTFS3_FS_POSIX_ACL n

# Migrate Hyper-V display from legacy fbdev (hyperv_fb) to DRM (hyperv_drm), matching
# upstream/Arch direction. Deps DRM/PCI/MMU/HYPERV are all =y (verified), so this holds.
set_cfg FB_HYPERV n
set_cfg DRM_HYPERV m

# Shmem/tmpfs THP default policy: align with Arch upstream (ADVISE) — hand huge pages to
# these mounts only when an app calls madvise(MADV_HUGEPAGE), zero impact on apps that don't.
# These two choices are 7.0-new and absent from config-wsl (6.18); on the 7.0 tree olddefconfig
# would otherwise default both choices to NEVER. Parent CONFIG_TRANSPARENT_HUGEPAGE is already =y.
set_cfg TRANSPARENT_HUGEPAGE_SHMEM_HUGE_ADVISE y
set_cfg TRANSPARENT_HUGEPAGE_TMPFS_HUGE_ADVISE y

# Build btrfs and virtio-blk in (=y) instead of modules: usable without modprobe and
# independent of the modules vhdx (same rationale as NTFS3=y). olddefconfig will promote
# btrfs's select'd deps (zstd/lzo/zlib, raid6, xxhash, crypto-lib blake2b/sha256) to built-in
# as well, so the image grows by a few hundred KB+; that is the cost of not needing the vhdx.
set_cfg BTRFS_FS y
set_cfg VIRTIO_BLK y

# USB/IP client (vhci_hcd) built in (=y) so USB-over-IP works even with the modules vhdx
# detached. vhci_hcd depends on USBIP_CORE && USB (tristate depends: a =m parent caps the
# child at =m), so the whole chain must go =y or olddefconfig silently demotes vhci_hcd back
# to =m. USBIP_CORE selects USB_COMMON; we set it explicitly too. USBIP_HOST (the stub) stays
# =m - WSL is the client, the stub runs on Windows (usbipd-win).
set_cfg USB y
set_cfg USB_COMMON y
set_cfg USBIP_CORE y
set_cfg USBIP_VHCI_HCD y

step "[3/9] determining unbacked provides from config state"
# A provide is honest only if its backing symbol is actually built (=y or =m), decided
# dynamically so it self-corrects if Microsoft flips one on. VIRTUALBOX-GUEST-MODULES is
# dropped unconditionally: WSL runs under Hyper-V, never VirtualBox.
declare -A _prov_sym=(
  [WIREGUARD-MODULE]=CONFIG_WIREGUARD
  [NTSYNC-MODULE]=CONFIG_NTSYNC
  [KSMBD-MODULE]=CONFIG_SMB_SERVER
)
_drop_prov=(VIRTUALBOX-GUEST-MODULES)
for _p in "${!_prov_sym[@]}"; do
  grep -qE "^${_prov_sym[$_p]}=[my]" config.x86_64 || _drop_prov+=("$_p")
done

step "[3/9] preparing WSL _package() region snippets"
bootbody=$(mktemp); vhdxbody=$(mktemp)
cat > "$bootbody" <<'B'
  echo "Installing boot image to /boot..."
  install -Dm644 "$(make -s image_name)" "$pkgdir/boot/vmlinuz-$pkgbase"
B
cat > "$vhdxbody" <<'V'

  # depmod now so the vhdx (overlay lowerdir) ships a ready modules.dep. WSL stacks a
  # tmpfs upper over this vhdx, so runtime depmod is possible but pointless; bake it in.
  depmod -b "$pkgdir/usr" "$(<version)"

  # Pre-seed a 'build' symlink into the vhdx -> headers' real dir under /usr/src.
  # /lib/modules/<ver> is an overlay (vhdx ro lower + tmpfs upper); writes under build/
  # would hit tmpfs and vanish on shutdown. The symlink lives in the ro lowerdir
  # (persistent, always visible) and resolves the moment linux-wsl-headers populates
  # /usr/src, giving DKMS a writable persistent build tree without touching tmpfs.
  ln -sfn "/usr/src/$pkgbase-$(<version)" "$modulesdir/build"

  echo "Building modules VHDX..."
  local _data _size
  _data=$(du -sb "$modulesdir" | cut -f1)
  _size=$(( _data + _data/10 + 64*1024*1024 ))
  truncate -s "$_size" "$srcdir/vmlinuz-$pkgbase-modules.img"
  mkfs.ext4 -F -q -b 4096 -O ^has_journal -m 0 \
    -U __MODVHD_UUID__ \
    -E hash_seed=__MODVHD_UUID__ \
    -d "$modulesdir" "$srcdir/vmlinuz-$pkgbase-modules.img"
  install -d "$pkgdir/boot"
  qemu-img convert -f raw -O vhdx "$srcdir/vmlinuz-$pkgbase-modules.img" "$pkgdir/boot/vmlinuz-$pkgbase-modules.vhdx"
  rm -f "$srcdir/vmlinuz-$pkgbase-modules.img"
  rm -rf "$modulesdir"
V
sed -i "s/__MODVHD_UUID__/$MODVHD_UUID/g" "$vhdxbody"

step "[4/9] rewriting PKGBUILD"
{
  echo "# Maintainer: $NAME <$EMAIL>"
  echo "#"
  echo "# Built from the official Arch Linux 'linux' package sources, with only the kernel"
  echo "# config replaced by the Microsoft WSL config (config-wsl). No Microsoft out-of-tree"
  echo "# patches are applied (notably no dxgkrnl); the kernel source is identical to the"
  echo "# official linux package."
  awk '
    /^# Maintainer:/ {sub(/^# Maintainer:/, "# Contributor:"); print; next}
    /^[[:space:]]*replaces=\(/ {r=1; next}
    r && /^[[:space:]]*\)/ {r=0; next}
    r {next}
    {print}
  ' PKGBUILD \
  | sed -e 's/^pkgbase=linux$/pkgbase=linux-wsl/' \
        -e "s/^pkgdesc='Linux'\$/pkgdesc='Linux (WSL without Microsoft out-of-tree patches)'/" \
        -e '/^pkgbase=linux-wsl$/a install=$pkgbase.install' \
  | sed '/^makedepends=(/a\  e2fsprogs\n  qemu-img' \
  | awk -v bootfile="$bootbody" -v vhdxfile="$vhdxbody" '
      BEGIN { while ((getline l < bootfile)>0) boot=boot l "\n"
              while ((getline l < vhdxfile)>0) vhdx=vhdx l "\n" }
      $0 == "_package() {" { inpkg=1; print; next }
      inpkg && $0 == "}" { inpkg=0; print; next }
      inpkg && $1=="initramfs" && NF==1 { next }
      inpkg && index($0,"Installing boot image") { printf "%s", boot; skip=1; next }
      skip && index($0,"install -Dm644 /dev/stdin") { skip=0; next }
      skip { next }
      inpkg && index($0,"rm \"$modulesdir\"/build") { print; printf "%s", vhdx; next }
      { print }
    '
} > PKGBUILD.new && mv PKGBUILD.new PKGBUILD
rm -f "$bootbody" "$vhdxbody"; bootbody=""; vhdxbody=""

step "[4/9] dropping unbacked provides: ${_drop_prov[*]}"
for _p in "${_drop_prov[@]}"; do
  sed -i "/^    ${_p}\$/d" PKGBUILD
done

step "[4/9] redirecting headers/docs build tree to /usr/src (overlay-safe, persistent)"
# WSL overlays the modules vhdx onto /lib/modules/<ver> with a tmpfs upper, so the stock
# build dir (/usr/lib/modules/<ver>/build) is non-persistent and would lose headers/docs
# on shutdown. Point both _package-headers and _package-docs at /usr/src/<pkgbase>-<ver>
# (distro rootfs), which the vhdx's pre-seeded 'build' symlink resolves to. Headers, DKMS
# build tree and Documentation all land on persistent storage; the /usr/share/doc symlink
# then targets a real dir instead of dangling. Both functions share this exact builddir
# line; the main _package() uses "$modulesdir"/build (different text) and is untouched.
sed -i 's|\$pkgdir/usr/lib/modules/\$(<version)/build|$pkgdir/usr/src/$pkgbase-$(<version)|g' PKGBUILD

# Same overlay hazard for the unstripped VDSO: stock headers run `make vdso_install`, which
# drops vdso{32,64,x32}.so into /usr/lib/modules/<ver>/vdso/ - right under WSL's overlay
# mountpoint. Installed at runtime those land in the tmpfs upper and vanish on shutdown,
# leaving pacman's db referencing files that no longer exist. The runtime vDSO is built into
# the kernel image, not loaded from these files, so they are debug-only and safe to drop.
sed -i '/echo "Installing unstripped VDSO/,/link=  # Suppress build-id symlinks/d' PKGBUILD

step "[4/9] generating non-blocking install scriptlet (boot mount warning)"
# Zero files on disk: the scriptlet is embedded in package metadata (.INSTALL), not written
# anywhere under /usr. It can only WARN, never block: pacman ignores install-scriptlet exit
# codes by design (Arch FS#17886). post_* runs after files land, so it reports whether the
# update can actually take effect. Attached to the main package only via install= in _package().
cat > linux-wsl.install <<'INSTALL'
_warn_boot() {
  if ! mountpoint -q /boot 2>/dev/null || \
     ! findmnt -no FSTYPE /boot 2>/dev/null | grep -qE '^(9p|drvfs|virtiofs)$'; then
    cat >&2 <<'EOF'
==> WARNING: /boot is not a Windows-backed (drvfs/9p) mount.
==>   The linux-wsl kernel + modules.vhdx live in /boot; without a Windows-backed /boot
==>   they sit in the distro filesystem where Windows cannot read them, so .wslconfig
==>   kernel=/kernelModules= will NOT load this kernel. Anything installed for it (the
==>   kernel, headers, docs) stays inert until /boot is mounted from Windows and the
==>   package reinstalled.
EOF
  fi
}
_kernel_note() {
  cat >&2 <<'EOF'
==> By specifying vmlinuz-linux-wsl-modules.vhdx via the wsl2.kernelModules option,
==> the corresponding kernel modules can be loaded automatically. However, once WSL loads
==> this .vhdx file, it gets locked by Windows, preventing any updates. Therefore, if you
==> want to update the kernel, you need to temporarily shutdown wsl, remove the
==> wsl2.kernelModules setting and then restore it after the update is complete.
EOF
}
pre_install() { _kernel_note; }
pre_upgrade() { _kernel_note; }
post_install() { _warn_boot; }
post_upgrade() { _warn_boot; }
INSTALL

step "[5/9] verifying rewrite + config invariants"
pkgfn=$(awk '/^_package\(\) \{/{f=1} f{print} f&&/^}/{exit}' PKGBUILD)
chk(){ grep -qF -- "$1" <<<"$pkgfn"; }
! chk 'initramfs'          || die "initramfs still in _package depends"
! chk 'modulesdir/vmlinuz' || die "vmlinuz still staged into modulesdir (mkinitcpio hook would fire)"
! chk 'modulesdir/pkgbase' || die "pkgbase still staged into modulesdir (mkinitcpio hook would fire)"
chk 'boot/vmlinuz-$pkgbase"'   || die "kernel image not staged to /boot as vmlinuz-<pkgbase>"
chk '-modules.vhdx'        || die "modules vhdx not staged to /boot"
chk 'depmod -b'            || die "depmod not injected (vhdx would ship a stale modules.dep)"
chk 'ln -sfn "/usr/src/$pkgbase-$(<version)" "$modulesdir/build"' || die "build symlink not pre-seeded into vhdx"
grep -qF 'install=$pkgbase.install' PKGBUILD || die "install scriptlet not attached (top-level install=)"
{ [ -f linux-wsl.install ] && grep -q '^post_upgrade()' linux-wsl.install; } || die "linux-wsl.install missing or lacks post_upgrade"
grep -qF 'builddir="$pkgdir/usr/src/$pkgbase-$(<version)"' PKGBUILD || die "headers/docs builddir not redirected to /usr/src"
! grep -qF 'usr/lib/modules/$(<version)/build' PKGBUILD || die "stale lib/modules build path remains in headers/docs"
! grep -qF 'vdso_install' PKGBUILD || die "vdso_install still present (would leak files into the WSL overlay tmpfs)"
grep -qF '  qemu-img' PKGBUILD                  || die "qemu-img missing from makedepends"
grep -qF 'CONFIG_UNWINDER_ORC=y'  config.x86_64 || die "ORC unwinder not applied"
grep -qF 'CONFIG_NTFS3_FS=y'         config.x86_64 || die "NTFS3 not applied"
grep -qF 'CONFIG_NTFS3_LZX_XPRESS=y' config.x86_64 || die "NTFS3 LZX/Xpress not enabled"
grep -qF '# CONFIG_NTFS3_FS_POSIX_ACL is not set' config.x86_64 || die "NTFS3 POSIX ACL not disabled"
grep -qF 'CONFIG_DRM_HYPERV=m'    config.x86_64 || die "DRM_HYPERV not applied"
grep -qF 'CONFIG_TRANSPARENT_HUGEPAGE_SHMEM_HUGE_ADVISE=y' config.x86_64 || die "shmem THP ADVISE not set"
grep -qF 'CONFIG_TRANSPARENT_HUGEPAGE_TMPFS_HUGE_ADVISE=y' config.x86_64 || die "tmpfs THP ADVISE not set"
grep -qF 'CONFIG_BTRFS_FS=y'   config.x86_64 || die "BTRFS_FS not built-in"
grep -qF 'CONFIG_VIRTIO_BLK=y' config.x86_64 || die "VIRTIO_BLK not built-in"
grep -qF 'CONFIG_USB=y'             config.x86_64 || die "USB core not built-in"
grep -qF 'CONFIG_USBIP_CORE=y'      config.x86_64 || die "USBIP_CORE not built-in"
grep -qF 'CONFIG_USBIP_VHCI_HCD=y'  config.x86_64 || die "vhci_hcd not built-in (USB/IP would need the vhdx)"
! grep -qF 'CONFIG_FB_HYPERV=m'   config.x86_64 || die "FB_HYPERV still enabled"
! grep -qF 'CONFIG_DEBUG_LIST=y'  config.x86_64 || die "DEBUG_LIST still enabled"

step "[6/9] updating checksums (updpkgsums)"
updpkgsums

step "[7/9] computing content-aware pkgrel"
# pkgrel = <upstream pkgrel> [.<N>]. The upstream integer is whatever Arch ships (unchanged
# by our rewrite). .N is a local recipe revision that advances ONLY when the produced
# package would differ while the upstream baseline (pkgver + upstream pkgrel) stays the same.
# When upstream advances, .N resets - pkgver/pkgrel already guarantee an upgrade path.
_up_rel=$(awk -F= '/^pkgrel=/{print $2; exit}' PKGBUILD)          # upstream integer pkgrel
_cur_pv=$(awk -F= '/^pkgver=/{print $2; exit}' PKGBUILD)
_prev_pv=$(git show HEAD:PKGBUILD 2>/dev/null | awk -F= '/^pkgver=/{print $2; exit}' || true)
_prev_pr=$(git show HEAD:PKGBUILD 2>/dev/null | awk -F= '/^pkgrel=/{print $2; exit}' || true)

# product signature = whole PKGBUILD with pkgrel normalized away (it carries every source
# checksum + all build logic, so any product-affecting change shows up here).
_norm(){ sed 's/^pkgrel=.*/pkgrel=@/'; }
_cur_sig=$(_norm < PKGBUILD)
_prev_sig=$(git show HEAD:PKGBUILD 2>/dev/null | _norm || true)

if [[ -n "$_prev_sig" && "$_cur_sig" == "$_prev_sig" ]]; then
  _newrel="$_prev_pr"                                  # product unchanged: keep, git will no-op
  _reason="no change"
elif [[ -z "$_prev_pr" || "$_cur_pv" != "$_prev_pv" || "$_up_rel" != "${_prev_pr%%.*}" ]]; then
  _newrel="$_up_rel"                                   # first run or upstream baseline moved: reset
  _reason="upstream baseline"
elif [[ "$_prev_pr" == *.* ]]; then
  _newrel="${_prev_pr%.*}.$(( ${_prev_pr##*.} + 1 ))"  # local change, .N exists: increment
  _reason="recipe revision"
else
  _newrel="${_prev_pr}.1"                              # local change, no .N yet: start at .1
  _reason="recipe revision"
fi
sed -i "s/^pkgrel=.*/pkgrel=$_newrel/" PKGBUILD
step "[7/9] pkgrel = $_newrel ($_reason)"

step "[8/9] generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

step "[9/9] staging changes"
ensure_ignore '/pkg'
ensure_ignore '/src'
ensure_ignore 'linux-*'
git add .gitignore
git add -A
git add linux-wsl.install -f
if git rev-parse --verify -q HEAD >/dev/null 2>&1 && git diff --cached --quiet; then
  step "[9/9] already up to date; nothing to commit."
  exit 0
fi
if [[ "$_reason" == "recipe revision" ]]; then
  _msg="Rebuild linux-wsl $_cur_pv-$_newrel (recipe change)"
else
  _msg="Sync to Arch linux $_cur_pv-$_newrel"
fi
step "[9/9] signed commit: $_cur_pv-$_newrel"
git -c user.name="$NAME" -c user.email="$EMAIL" commit -S -m "$_msg"
step "OK: committed (signed) $_cur_pv-$_newrel. Not pushed."
