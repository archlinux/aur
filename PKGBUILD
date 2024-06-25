# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=zoomer
pkgver=0.0.2
pkgrel=1
pkgdesc="Simple zoom application"
arch=(any)
url="https://git.herisson.ovh/tonitch/zoomer"
license=('MIT')
depends=(sdl2 scrot)
makedepends=(gcc)
source=("$pkgname-$pkgver::https://git.herisson.ovh/tonitch/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3f6eede12d73a310cbaed8b2467cb6aaea94a449b93f00a1f25602cb2b10445b')

build() {
	cd "$pkgname"
	make build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/" make install
}
