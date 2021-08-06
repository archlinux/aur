# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=rralle
pkgver=0.1.2
pkgrel=1
pkgdesc='Random quote fetching console utility'
arch=('any')
url="https://github.com/q60/$pkgname"
license=('MIT')
makedepends=('rebar3' 'make')
depends=('erlang')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('40a5324fc594fbf746a5b9cdf18899f2f03eae21d6c85f4cb251489a606a812c')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
