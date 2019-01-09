# Maintainer: Vadim Tsesko <incubos at yandex dot com>

pkgname=jattach
pkgver=1.5
pkgrel=1
pkgdesc='JVM Dynamic Attach utility'
arch=('x86_64')
url='https://github.com/apangin/jattach'
license=('Apache')
provides=('jattach')
groups=('odnoklassniki')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apangin/jattach/archive/v$pkgver.tar.gz")
sha256sums=('03829443d69e86537dd04a2d7e9c25a5777559716139363b335722299c1cd153')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D build/jattach "$pkgdir/usr/bin/jattach"
}
