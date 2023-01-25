# Maintainer: Raku <raku at raku dot party>

pkgname=ztui-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='A terminal UI for ZeroTier - Binary release'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/erikh/ztui'
license=()
source=("https://github.com/erikh/ztui/releases/download/v${pkgver}/ztui-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('89762082f48ca4869fb027b31af616ad13ec57a6b4c7049c9079235c20f679f4')

package () {
    install -D -m755 "ztui" "${pkgdir}/usr/bin/ztui"
}
