# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=odfedit
pkgver=2.21
pkgrel=1
pkgdesc="A tool for GrandOrgue ODF edition, and Hauptwerk to GrandOrgue ODF conversion"
arch=("x86_64")
url="https://github.com/GrandOrgue/OdfEdit"
license=('GPL-3.0-only')
depends=('glibc' 'zlib')
source=("https://github.com/GrandOrgue/OdfEdit/releases/download/v${pkgver}/OdfEdit-${pkgver}-linux.zip")
sha256sums=('ffe2cadf4824c2d669795f005c78d66951449191340d7c6f10ff3cb5d6b0bb5f')

package() {
	cd "$srcdir"
	install -D -m 755 OdfEdit $pkgdir/usr/bin/OdfEdit
}
