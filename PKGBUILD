# Maintainer: Rsplwe <i@rsplwe.com>
pkgname=prpr
pkgver=1.0.0
pkgrel=1
pkgdesc="pe~ ro~ pe~ ro~"
arch=('any')
url="https://github.com/Rsplwe/prpr"
license=('WTFPL')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rsplwe/prpr/archive/$pkgver.tar.gz")
sha512sums=('51959b5117bb088c4e6570521e8f422b365240614f56c4c5cecd7b5c3dab0f57fcf0dd63be45c7776a24adea11508982333f38c68c60a6303a0c46bdfe15f5d1')

build() {
	cd "prpr-$pkgver"
	make
}

package() {
	cd "prpr-$pkgver"

	install -D -m 755 prpr "$pkgdir/usr/bin/prpr"
	install -D -m 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
