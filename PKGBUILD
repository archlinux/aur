# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/hjkl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=hjkl-bin
_pkgname=hjkl
pkgver=0.33.2
pkgrel=1
pkgdesc="Vim-modal terminal editor: standalone TUI built on the hjkl engine. (binary release)"
arch=('x86_64' 'aarch64')
url="https://hjkl.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('libxcb')

source_x86_64=("hjkl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hjkl/releases/download/v${pkgver}/hjkl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("hjkl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hjkl/releases/download/v${pkgver}/hjkl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7e17de54f8939e8f5eb3ff3819e8410e5ee70027744495a8931f240aaa6e69f3')
sha256sums_aarch64=('76ac58c0dd805a580bd8b2240f3fbe1d13ff6dbcdf63f68aa6f4c3bc809f075d')

package() {
    install -Dm755 "$srcdir/hjkl" "$pkgdir/usr/bin/hjkl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
