# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.16.7
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
sha256sums_x86_64=('db65df02a57cef31af20cbdfd43283315670e63d43b5e2f7e8059fdbe9bdec73')
sha256sums_aarch64=('8c5e319c48bf0f9abf23a7b781ae0e7162ec35d60e28f5f6c4cd6ba07f54815f')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH.bin" "$pkgdir/usr/bin/cog"
}
