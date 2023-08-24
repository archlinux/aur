# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festivald-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Festival music player daemon"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('MIT')
source=("${url}/releases/download/daemon-v${pkgver}/festivald-v${pkgver}-linux-x64.tar.gz")
sha256sums=('a817e6ac3382c5031b680d694662924fdd21a7686908ba7cd4bb93109dc16ab9')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	cd "$srcdir"

	# Binary
	install -Dm755 festivald "${pkgdir}/usr/bin/festivald"
}
