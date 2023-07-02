# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Cliveptr <clivedd@tuta.io>

pkgname=gomuks-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Terminal Matrix client written in Go'
arch=('x86_64' 'arm' 'aarch64')
license=('AGPL3')
provides=('gomuks')
conflicts=('gomuks')
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/tulir/gomuks/releases/download/v$pkgver/gomuks-linux-amd64")
source_arm=("$pkgname-$pkgver-arm::https://github.com/tulir/gomuks/releases/download/v$pkgver/gomuks-linux-arm")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/tulir/gomuks/releases/download/v$pkgver/gomuks-linux-arm64")
sha256sums_x86_64=('3e35b4ad0e3acbb634152a45dd6cdede8ec4da8659ec1b7c3f269a64f5dfeb56')
sha256sums_arm=('be3006e5a6e0de31220d36748d34b5d90b168cb2d0a4018d0fd677f2c6584fa8')
sha256sums_aarch64=('02a303a669ffda68545896e8804c8ee3abd9775abbac26850268b136e3f17ed2')

package() {
	install -Dv "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/gomuks"
}
