# Maintainer: m4sk1n <m4sk1n@vivaldi.net>
# Maintainer: Eivind Eide <xenofil A-T gmail D-O-T com>
# Contributor: Renato Coutinho <renato.coutinho@gmail.com>

pkgname=xnots
pkgver=0.2.1
pkgrel=2
pkgdesc="A desktop sticky notes application for Unix geeks"
depends=('libxrandr' 'pango' 'xorg-server')
makedepends=('pkg-config' 'git')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('27f0fef6fb2ebb46b7b4a7cafdaf665d')
url="http://xnots.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

package() { 
	cd "${srcdir}/${pkgname}-${pkgver}"
	make prefix="${pkgdir}/usr" install
}
