# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.15.6
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
sha256sums_x86_64=('a156fa6344e10cd42a56701d46e3a7be5b0f8272720fa4e6227ee849f0f64be4')

package() {
  install -Dm755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/cog"
}
