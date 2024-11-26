# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.13.3
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
sha256sums_x86_64=('14369dbcb4a6d6b7720efc275f6765834e438ca5b9cbea94fc909149482d7a40')

package() {
  install -Dm755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/cog"
}
