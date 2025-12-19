# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=odfedit
pkgver=2.19
pkgrel=1
pkgdesc="A tool for GrandOrgue ODF edition, and Hauptwerk to GrandOrgue ODF conversion"
arch=("x86_64")
url="https://github.com/GrandOrgue/OdfEdit"
license=('GPL-3.0-only')
depends=('glibc' 'zlib')
source=("https://github.com/GrandOrgue/OdfEdit/releases/download/v${pkgver}/OdfEdit-${pkgver}-linux.zip")
sha256sums=('938acb8bd5906a736283179d8fe39c542824414597c3e3966d05cea2ac69ce74')

package() {
	cd "$srcdir"
	install -D -m 755 OdfEdit $pkgdir/usr/bin/OdfEdit
}
