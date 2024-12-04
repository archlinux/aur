# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.13.6
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
sha256sums_x86_64=('71707a60008c73dc50e12184a18d0d4d987d158d002bd8105c5cda287b71c1f6')

package() {
  install -Dm755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/cog"
}
