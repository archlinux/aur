# Maintainer: fubarhouse
pkgname=pygmy-bin
cleanname=pygmy
provides=(pygmy)
pkgver=0.13.1
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy pygmy-git pygmy-go pygmy-go-bin pygmy-go-git)
makedepends=('tar')
source=("${cleanname}_${pkgver}::${url}/releases/download/v${pkgver}/${cleanname}_${pkgver}_linux_amd64.tar.gz")
sha512sums=('f8a72cb07a143581832901d4f6be1d6c31954f862ed31c55f0d19eb5d7624264d00d66bb3895d5a5664f86c0a243ac444c8122819e3847e9047a46459e409205')

package() {
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${cleanname} "$pkgdir/usr/bin/$cleanname"
}
