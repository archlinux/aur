# Maintainer: Vignesh TS < vikits at gmail dot com>

pkgname=chroma-extras
pkgver=1.18
pkgrel=1
pkgdesc="Additional levels for chroma (XOR and enigma sets)"
arch=('any')
url="http://www.level7.org.uk/chroma/"
license=('unknown')
depends=('chroma')
install=chroma-extras.install
source=("http://www.level7.org.uk/chroma/download/${pkgname}.tar.bz2")
md5sums=('2b36afa56f9447b3a0e2e01f9ce2e060')

package() {
    install -d ${pkgdir}/usr/share/chroma/
    mv -f ${srcdir}/chroma-extras/{levels,graphics} ${pkgdir}/usr/share/chroma
    mv ${srcdir}/chroma-extras/xor-theme.xm ${pkgdir}/usr/share/chroma
}
