# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=chroma-extras
pkgver=1.13
pkgrel=1
pkgdesc="Additional levels for chroma (XOR and enigma sets)"
arch=('any')
url="http://www.level7.org.uk/chroma/"
license=('unknown')
depends=('chroma')
install=chroma-extras.install
source=("http://www.level7.org.uk/chroma/download/${pkgname}.tar.bz2")
md5sums=('e17d71f1fc4b9873b4152d7f3c42a504')

build() {
    install -d ${pkgdir}/usr/share/chroma/
    mv ${srcdir}/{levels,graphics} ${pkgdir}/usr/share/chroma
}
