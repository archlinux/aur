# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/sqeel
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=sqeel-bin
_pkgname=sqeel
pkgver=0.4.8
pkgrel=1
pkgdesc="Vim-modal SQL client: TUI front-end for sqlx-backed connections with LSP-aware editing. (binary release)"
arch=('x86_64' 'aarch64')
url="https://sqeel.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('libxcb' 'gcc-libs')

source_x86_64=("sqeel-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/sqeel/releases/download/v${pkgver}/sqeel-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("sqeel-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/sqeel/releases/download/v${pkgver}/sqeel-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e6ecdf3be0bf540f2d2ed22dae223feafa9dc0ff4757603eef40a63a4e421d5c')
sha256sums_aarch64=('351ff009eb9bf83f7f33c0f1670c29347f8fecea75816cb765a3a24a2b6239f0')

package() {
    install -Dm755 "$srcdir/sqeel" "$pkgdir/usr/bin/sqeel"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
