# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.11.3
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
sha256sums_x86_64=('ad05f00b9434d949fd1b2b7cb0fa6337153cdee7b8f0fbef4424e4eefee239f9')

package() {
  install -Dm755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/cog"
}
