# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.14.4
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
sha256sums_x86_64=('a20f0e498db9cd4415ebe5a6dfedf0d643b9cd3ce1d934230be0c7f2506d10b4')

package() {
  install -Dm755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/cog"
}
