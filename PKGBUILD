# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=sedsed
pkgver=1.0
pkgrel=3
pkgdesc='Sedsed can debug, indent, tokenize and HTMLize your SED scripts'
arch=('any')
depends=('python2')
url='http://sedsed.sourceforge.net/'
license=('GPL')
source=("http://sedsed.sourceforge.net/sedsed-${pkgver}")
sha256sums=('38da1ef5234157da8e8f4fe8faf960c8f71ccce3d650b34f33f4df12ecda41d8')

prepare() {
	sed -i 's/python/python2/1' ${srcdir}/sedsed-${pkgver}
}

package() {
	install -D -m 0755 ${srcdir}/sedsed-${pkgver} ${pkgdir}/usr/bin/sedsed
}

