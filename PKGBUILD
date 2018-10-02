# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=jattach
pkgver=1.4
pkgrel=1
pkgdesc='JVM Dynamic Attach utility'
arch=('x86_64')
url='https://github.com/apangin/jattach'
license=('Apache')
provides=('jattach')
groups=('odnoklassniki')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apangin/jattach/archive/v$pkgver.tar.gz")
sha256sums=('d624d9158913c571452ac7cfeef59544ea775c5b868fb92efd1edc4d971659e9')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D build/jattach "$pkgdir/usr/bin/jattach"
}
