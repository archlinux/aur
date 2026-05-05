# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.19.3
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
sha256sums_x86_64=('a3eb95dc289f8bda5b043c75a69766df109d5cd52d7c1400b221dbfd0c1a8911')
sha256sums_aarch64=('d071c8d55299422201d12e4fa3bae066347e33ce2688d9cb72d662588fed7528')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH.bin" "$pkgdir/usr/bin/cog"
}
