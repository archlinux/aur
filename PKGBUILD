# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/inbx
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=inbx-bin
_pkgname=inbx
pkgver=0.4.0
pkgrel=1
pkgdesc="inbx — modal-vim email client (binary release)"
arch=('x86_64')
url="https://inbx.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=()

source_x86_64=("inbx-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/inbx/releases/download/v${pkgver}/inbx-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8c4363ddde9bb57b2f3f4f54f9be312e3349935e99d5278c62ab62c70d8b17ce')

package() {
    install -Dm755 "$srcdir/inbx" "$pkgdir/usr/bin/inbx"
    install -Dm755 "$srcdir/inbx-sync" "$pkgdir/usr/bin/inbx-sync"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
