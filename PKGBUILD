# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Cliveptr <clivedd@tuta.io>

pkgname=gomuks-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Terminal Matrix client written in Go'
url='https://github.com/tulir/gomuks'
arch=('x86_64' 'arm' 'aarch64')
license=('AGPL3')
provides=('gomuks')
conflicts=('gomuks')
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/tulir/gomuks/releases/download/v$pkgver/gomuks-linux-amd64")
source_arm=("$pkgname-$pkgver-arm::https://github.com/tulir/gomuks/releases/download/v$pkgver/gomuks-linux-arm")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/tulir/gomuks/releases/download/v$pkgver/gomuks-linux-arm64")
sha256sums_x86_64=('0646ba8263c872adcb1a6229d9345d1db1556aa939e5b5e4d2bc49b67c783167')
sha256sums_arm=('f6c20d99424e40334e7d2e82a6ddd6503190a96cd5f6734c799b0a1b3cabd904')
sha256sums_aarch64=('aa3f97ea24835b25cf2d24b65fa376ca764a9a412d1002ec08c42f8e871f832b')

package() {
	install -Dv "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/gomuks"
}
