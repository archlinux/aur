# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.15.0
pkgrel=1
epoch=2
pkgdesc='Containers for machine learning'
arch=('x86_64')
url="https://github.com/replicate/cog"
license=('Apache-2.0')
depends=('docker')
conflicts=('cocogitto' 'python-cogapp')
source_x86_64=("$pkgname-$pkgver.bin::${url}/releases/download/v${pkgver}/cog_Linux_x86_64")
sha256sums_x86_64=('4c6a23e0c13f35090a9ed4f7897988795ae0a51218c5849d12e3e6711d97ab2e')

package() {
  install -Dm755 "$pkgname-$pkgver.bin" "$pkgdir/usr/bin/cog"
}
