# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Cliveptr <clivedd@tuta.io>

pkgname=gomuks-bin
pkgver=0.2.3
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
sha256sums_x86_64=('b1e726b9da0d6ff5f5d7391c4fe494514779d758d08614b4130aa429ec06b6a2')
sha256sums_arm=('c422fea4b68266d5d4d1d50eb6ddb6bd04c6cdb4fd8e004ef94ce35e39633ed5')
sha256sums_aarch64=('c982680203670c1274e5283f1a7b5457776e77eb4aa0cd52d096d1fdacab6e49')

package() {
	install -Dm755 "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/gomuks"
}
