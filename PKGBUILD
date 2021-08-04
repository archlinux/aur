# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=lfe
pkgver=2.0.1
pkgrel=1
pkgdesc="LISP Flavoured Erlang"
arch=('x86_64')
url="https://github.com/lfe/lfe"
license=('Apache')
depends=('erlang')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d64a5c0b626411afe67f146b56094337801c596d9b0cdfeabaf61223c479985f')

build() {
  cd "$pkgname-$pkgver"
  make compile
}

package() {
	cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
