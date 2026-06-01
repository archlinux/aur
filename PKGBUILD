#Maintainer: Aadity Setu <aaditysetu@gmail.com>
pkgname=htype
pkgver=0.2.0
pkgrel=1
pkgdesc="Mimic human typing on stdout"
arch=('x86_64')
url="https://github.com/lord-of-the-strings/htype"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lord-of-the-strings/htype/archive/v$pkgver.tar.gz")
sha256sums=('fe962178a486c85cc5a9263086e2f92ae19f14e529bc5b581babcf9891eea129')
build(){
	cd "$pkgname-$pkgver"
	make
}
package(){
	cd "$pkgname-$pkgver"
	make install PREFIX="$pkgdir/usr"
}
