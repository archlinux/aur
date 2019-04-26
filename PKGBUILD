# Maintainer: David Birks <david@tellus.space>

pkgname=docker-app-bin
pkgver=0.8.0_beta2
pkgrel=1
pkgdesc="A utility to help make Compose files more reusable and sharable"
arch=('x86_64')
url="https://github.com/docker/app"
license=('Apache')
conflicts=('docker-app')
depends=('docker')
source=("docker-app-bin-${pkgver//_/-}::https://github.com/docker/app/releases/download/v${pkgver//_/-}/docker-app-linux.tar.gz")
sha512sums=('9478e0c5529a37cd3ef43e49c0843a2c1d6de24e5e82c063a03fee3556d5141fd958465cd9e645e2ae00e7b43de954fd7b2e787c08e93283817bae612abfe2bc')

package() {
  cd $srcdir
  install -Dm 755 "docker-app-bin-${pkgver//_/-}" "$pkgdir/usr/bin/docker-app"
}
