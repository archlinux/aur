# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Cliveptr <clivedd@tuta.io>

pkgname=gomuks-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Terminal Matrix client written in Go'
arch=('x86_64' 'arm' 'aarch64')
url='https://github.com/tulir/gomuks'
license=('AGPL3')
depends=('libolm') # required for encryption support
provides=('gomuks')
conflicts=('gomuks')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/gomuks-linux-amd64")
source_arm=("$pkgname-$pkgver-arm::$url/releases/download/v$pkgver/gomuks-linux-arm")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/gomuks-linux-arm64")
sha256sums_x86_64=('1a5d92b6aea0d34afec8cc83f016334e944c15f311064e209a386c46fb2c60a0')
sha256sums_arm=('a4039cf1bf563c47f1549a08b5dbca334dd3d436449b59118fb2ac5330c1ed5e')
sha256sums_aarch64=('5f374eaa0c0249d97b4e9d6f0a2e4c0cb9370ecfa67b8d802adb3c72831ca872')

package() {
	install -Dm755 "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/gomuks"
}
