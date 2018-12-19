# Maintainer: David Birks <david@tellus.space>

pkgname=docker-app
pkgver=0.6.0
pkgrel=1
pkgdesc="A utility to help make Compose files more reusable and sharable"
arch=(x86_64)
url="https://github.com/docker/app"
license=(Apache)
depends=('docker')
optdepends=()
source=(https://github.com/docker/app/releases/download/v$pkgver/$pkgname-linux.tar.gz)
sha512sums=('75fe1d8c3df0a909c77a7985f05ea92876289a790fc781fcb535e97a463b5c9e0eb8c31c93c1508e98ae0296cd38a96e1f5a6ac52de45fd2e235423de44a0f2c')

package() {
  cd $srcdir
  install -Dm755 "$pkgname-linux" "$pkgdir/usr/bin/$pkgname"
}
