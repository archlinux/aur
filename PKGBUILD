# Maintainer: a821 at (nospam) mail de
# Contributor: Yanli <mail@yanli.one>

pkgname=replicate-cog-bin
pkgver=0.17.1
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
sha256sums_x86_64=('e4b8cc6d26a57e2720baf700f048d6932aff2c4389b9971eb252abcdd20ae598')
sha256sums_aarch64=('e114758454938c884332b5ed959a21feeab45e42af68ee7e89537530b16d5ce8')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH.bin" "$pkgdir/usr/bin/cog"
}
