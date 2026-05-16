# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/pikr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=pikr-bin
_pkgname=pikr
pkgver=0.2.1
pkgrel=1
pkgdesc="Vim-modal application launcher — rofi replacement built on floem. (binary release)"
arch=('x86_64' 'aarch64')
url="https://pikr.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/pikr/releases/download/v${pkgver}/pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("pikr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/pikr/releases/download/v${pkgver}/pikr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7d86ac6cd70b0e66e7d19f9163e76ae735a6b6c0aa573256d9d0395ed4146f5d')
sha256sums_aarch64=('0b33042c386525ecc9cbaca184c8b5f7b32832a63e113e9f8cb1a1bde7a0954b')

package() {
    install -Dm755 "$srcdir/pikr" "$pkgdir/usr/bin/pikr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
