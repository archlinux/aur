# Maintainer: Raku <raku at raku dot party>

pkgname=ztui-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='A terminal UI for ZeroTier - Binary release'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/erikh/ztui'
license=()
source=("https://github.com/erikh/ztui/releases/download/v${pkgver}/ztui-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e9afce357455281eaf58fb49271e627d4d58ff0cb79cdf8c2bf975ce2bd3c931')

package () {
    install -D -m755 "ztui" "${pkgdir}/usr/bin/ztui"
}
