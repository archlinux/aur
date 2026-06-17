# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.21.0
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64' 'aarch64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'cog' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver-x86_64.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64.bin::${url}/releases/download/v${pkgver}/cog_Linux_arm64")
sha256sums_x86_64=('884dea07ff34c933b200b1eb617727d45d4450cbf2478f6b8eceecf856cb350a')
sha256sums_aarch64=('44a1d32fe748f528c6893c62a2bb120ac037699094786affaa5af65f07765c9c')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH.bin" "$pkgdir/usr/bin/cog"
}
