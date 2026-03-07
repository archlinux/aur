# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
pkgname=lfe
pkgver=2.2.0
pkgrel=1
pkgdesc="LISP Flavoured Erlang"
arch=('x86_64')
url="https://github.com/lfe/lfe"
license=('Apache')
depends=('erlang')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('029cbc638f1c125fbb9053de5f7bb1d261575e6f390e38133f34d3bc6f2905c4d8aab7c8cdff5ba67ddbdfcd6546e37c66924104e8d825247513dee829a170df')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="${pkgdir}/usr" install
}
