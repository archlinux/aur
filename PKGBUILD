# Contributer: Toni Foerster <stonerl@skeps.de>, André Klitzing <aklitzing@online.de>
pkgname=intltool-debian
pkgver=0.35.0
pkgrel=5
pkgdesc="The internationalization tool collection with RFC822 support"
arch=('i686' 'x86_64')
url="http://www.debian.org/"
license=('GPL')
depends=('gettext' 'perl')
source=(ftp://ftp.debian.org/debian/pool/main/i/intltool-debian/${pkgname}_${pkgver}+20060710.1_all.deb)
sha256sums=('121b13900d598f737acd9461575e36d93eead49c61a95ab04273fb68e1ecc60a')

build() {
	cd ${srcdir}
	tar -zxf data.tar.gz
}

package() {
	cd ${srcdir}
	cp -r usr ${pkgdir}
}
