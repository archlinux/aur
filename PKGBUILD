# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=kaf
pkgver=0.1.22
pkgrel=1
pkgdesc="Kafka CLI inspired by kubectl & docker"
arch=('x86_64')
license=('Apache')
url="https://github.com/birdayz/kaf"
source=("https://github.com/birdayz/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d79f91bc3c5100202ba4a707cf84fe1d')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 kaf "${pkgdir}/usr/bin/${pkgname}"
}

