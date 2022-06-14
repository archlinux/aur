# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="sejda-console"
pkgver=3.2.85
pkgrel=1
pkgdesc="Shell interface for performing pdf manipulations"
arch=('x86_64')
url="www.sejda.org"
license=('AGPLv3')
depends=('jre-openjdk-headless>=1.8')
source=("$pkgname-$pkgver.zip::https://github.com/torakiki/sejda/releases/download/v$pkgver/$pkgname-$pkgver-bin.zip")
sha256sums=('a2380aff1904103317a92b61a2008e2018184de0a7ed58e2516bd1b3818a48bf')

package() {
	mkdir $pkgdir/opt
	cp -r $pkgname-$pkgver $pkgdir/opt/sejda-console/
	mkdir -p $pkgdir/usr/bin
	ln -s $pkgdir/opt/sejda-console/bin/sejda-console  $pkgdir/usr/bin/
}
