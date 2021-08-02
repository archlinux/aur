# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=rralle
pkgver=0.1.0
pkgrel=1
pkgdesc='Random quote fetching console utility'
arch=('any')
url="https://github.com/q60/$pkgname"
license=('MIT')
makedepends=('binutils' 'rebar3' 'make')
depends=('erlang')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c505fff9e49d66f606c62b2be669281ca03defe4846e64711d3bd6938ba24faf')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
