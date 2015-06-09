# Contributer: Toni Foerster <stonerl@skeps.de>, André Klitzing <aklitzing@online.de>
pkgname=intltool-debian
pkgver=0.35.0
pkgrel=4
pkgdesc="The internationalization tool collection with RFC822 support"
arch=('i686' 'x86_64')
url="http://www.debian.org/"
license=('GPL')
depends=('gettext' 'perl')
source=(ftp://ftp.debian.org/debian/pool/main/i/intltool-debian/${pkgname}_${pkgver}+20060710.1_all.deb)
md5sums=('505291f7124f988e5adb6c4fa0303bae')

build() {
	cd ${srcdir}
	ar -x ${srcdir}/${pkgname}_${pkgver}+20060710.1_all.deb data.tar.gz
	tar -zxf ${srcdir}/data.tar.gz
}

package() {
	cp -r ${srcdir}/usr/ ${pkgdir}
}
