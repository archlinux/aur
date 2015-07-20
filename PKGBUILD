# Contributor: Tilmann Sult <t.sult@gmx.de>
# Maintainer: Adam Hirst <adam@aphirst.karoo.co.uk>
pkgname=jsmath-fonts
pkgver=3.6a
pkgrel=3
pkgdesc="jsMath font archive"
arch=('i686' 'x86_64')
license=('Apache 2.0')
url="http://www.math.union.edu/~dpvc/jsMath/"
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.math.union.edu/~dpvc/jsMath/download/TeX-fonts-linux.tgz')
md5sums=('ec311947b2609a392b15a7a3b1e2acf3')
install=${pkgname}.install

package() {
install -d ${pkgdir}/usr/share/fonts/TTF
install -Dm644 ${srcdir}/*/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
