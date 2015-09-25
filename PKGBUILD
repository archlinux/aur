# Maintainer: Stephen Martin <hwkiller at gmail.com>
pkgname=boost-nowide
pkgver=1.58.0
pkgrel=2
pkgdesc="Boost.Nowide is a library implemented by Artyom Beilis that make cross platform Unicode aware programming easier."
arch=("any")
url="http://cppcms.com/files/nowide/html/"
license=('custom')
depends=('boost')
makedepends=('unzip')
options=()
source=("http://cppcms.com/files/nowide/boost_nowide.zip")

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/include/
	cp -r $srcdir/nowide/boost $pkgdir/usr/include/boost
	chmod -R 755 $pkgdir/usr/include/boost
}
md5sums=('60dbd93bc7f860284d080459fce1479e')
