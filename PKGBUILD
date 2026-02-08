# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=odfedit
pkgver=2.20
pkgrel=1
pkgdesc="A tool for GrandOrgue ODF edition, and Hauptwerk to GrandOrgue ODF conversion"
arch=("x86_64")
url="https://github.com/GrandOrgue/OdfEdit"
license=('GPL-3.0-only')
depends=('glibc' 'zlib')
source=("https://github.com/GrandOrgue/OdfEdit/releases/download/v${pkgver}/OdfEdit-${pkgver}-linux.zip")
sha256sums=('c1d100f33ad911c6afaa6e175fbb6316b253bac7c004c5b03504c371d71a39c8')

package() {
	cd "$srcdir"
	install -D -m 755 OdfEdit $pkgdir/usr/bin/OdfEdit
}
