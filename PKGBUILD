# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/pikr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=pikr-bin
_pkgname=pikr
pkgver=0.7.2
pkgrel=1
pkgdesc="Vim-modal application launcher — rofi replacement built on floem. (binary release)"
arch=('x86_64')
url="https://pikr.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

# aarch64 source / sha lines will be restored when #31 lands
# `aarch64-unknown-linux-gnu` back in the binary build matrix.
source_x86_64=("pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/pikr/releases/download/v${pkgver}/pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8ad587c6ee671dc59c1df59a0f1bd947a6c5a61bce0d55e79bb1dbf6a111ccb6')

package() {
    install -Dm755 "$srcdir/pikr" "$pkgdir/usr/bin/pikr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
