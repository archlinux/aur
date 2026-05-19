# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/pikr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=pikr-bin
_pkgname=pikr
pkgver=0.8.0
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
sha256sums_x86_64=('bdd9e256ef1e8861f8400d51463b76ba438a966013e0b07a162b0342fd3632d4')

package() {
    install -Dm755 "$srcdir/pikr" "$pkgdir/usr/bin/pikr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
