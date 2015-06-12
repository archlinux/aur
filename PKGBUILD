# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=gc-shrink
pkgver=0.2
pkgrel=2
pkgdesc="Small command line program that removes garbage from gamecube images to created smaller images." 
arch=("i686" "x86_64")
url=("http://www.gotwalls.com/")
license=('unknown')
depends=()
source=("http://www.gotwalls.com/files/$pkgname-$pkgver.zip")
md5sums=("fa9cfbf8a465ddd35dd1d1e09c616f24")

build() {
	cd $srcdir/$pkgname-$pkgver/src
	gcc -o ${pkgname} ${pkgname}.c -DUNIX
}

package() {
    install -Dm755 $srcdir/$pkgname-$pkgver/src/${pkgname} $pkgdir/usr/bin/${pkgname}
}
