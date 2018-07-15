# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=jattach
pkgver=1.3
pkgrel=1
pkgdesc='JVM Dynamic Attach utility'
arch=('x86_64')
url='https://github.com/apangin/jattach'
license=('Apache')
provides=('jattach')
groups=('odnoklassniki')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apangin/jattach/archive/v$pkgver.tar.gz")
sha256sums=('1671fbb947f62caa0452cc23d485374e5a909fc788f214043af7d065732027ce')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D build/jattach "$pkgdir/usr/bin/jattach"
}
