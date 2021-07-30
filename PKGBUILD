# Maintainer: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
pkgname=rl78flash
pkgver=0.6.1
pkgrel=1
pkgdesc="Flash programmer for the renesas rl78 family"
arch=('any')
url="https://github.com/msalau/rl78flash"
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2867d0352e84dbcf32f04c95fbce1ba1f102fb7fa761718ee6515c785400e210')

build() {
	cd "$pkgname-$pkgver"
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
