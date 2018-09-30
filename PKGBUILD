# Maintainer: Marco Steiger <marco1steiger (at) gmail (dot) com>
pkgname=rofi-mpc
pkgver=1.2.2
pkgrel=1
pkgdesc="Fast graphical Rofi-Interface for contolling MPD"
url="https://github.com/Marco98/${pkgname}"
depends=('ffmpeg')
makedepends=('git')
arch=('any')
source=("git://github.com/Marco98/${pkgname}#tag=v${pkgver}")
md5sums=('SKIP')
package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/${pkgname}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
