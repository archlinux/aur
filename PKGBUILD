# Maintainer: mrFrok <mrfrok@example.com>
pkgname=lfff-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Free, open-source firmware flasher for Android A/B devices via fastboot (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mrFrok/LibreFastbootFirmwareFlasher"
license=('GPL-3.0-only')
depends=('android-tools')
optdepends=(
  'aria2: firmware download support'
  'payload_dumper: OTA payload extraction (cargo install payload_dumper)'
)
provides=('lfff')
conflicts=('lfff')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/lfff-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/lfff-linux-aarch64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "lfff" "$pkgdir/usr/bin/lfff"
}
