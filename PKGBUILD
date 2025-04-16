# Maintainer: Marcos_chay <maktio at hotmail dot com>

pkgname=mobile-config-firefox
pkgver=4.6.0
pkgrel=1
pkgdesc="Mobile and privacy friendly configuration for Firefox"
arch=('any')
url="https://gitlab.postmarketos.org/postmarketOS/mobile-config-firefox"
license=('MPL-2.0')
depends=('firefox')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3bf2f2db0de74a0e4a5a38c22128788799ba5ad3e5deed167a4b37b13cd05795')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

