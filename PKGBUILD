# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.16.3
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64' 'aarch64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver-x86_64.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64.bin::${url}/releases/download/v${pkgver}/cog_Linux_arm64")
sha256sums_x86_64=('ed382f1976ab06fe463787fdb8bfec3e005be1a2986764d4a61a5f6100e93d92')
sha256sums_aarch64=('e6a12cf6427abe1baaa29d571db4fe36a9e4ddf23151f4c8a8e6a746fd8e5340')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH.bin" "$pkgdir/usr/bin/cog"
}
