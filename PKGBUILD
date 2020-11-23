# Maintainer: Cliveptr <clivedd@tuta.io>
pkgname=gomuks-bin
pkgver=0.2.1
pkgrel=2
pkgdesc='Terminal Matrix client written in Go'

conflicts=('gomuks')
provides=('gomuks')
license=('AGPL3')
depends=('libolm') # required for encryption support
arch=('x86_64' 'arm' 'aarch64')

url='https://github.com/tulir/gomuks'
_source="$pkgname-$pkgver::$url/releases/download/v$pkgver/gomuks-linux"
noextract=("$pkgname-$pkgver")

source_x86_64=("$_source-amd64")
source_arm=("$_source-arm")
source_aarch64=("$_source-arm64")

sha256sums_x86_64=('SKIP')
sha256sums_arm=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
	install -Dm755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/gomuks"
}
