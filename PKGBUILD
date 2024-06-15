# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=hieroglyphic-bin
_pkgname=hieroglyphic
pkgver=1.1.0
pkgrel=1
pkgdesc="Find LaTeX symbols."
arch=('x86_64')
url='https://github.com/FineFindus/Hieroglyphic'
license=('MIT')
depends=('gtk4' 'libadwaita')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname-$pkgver.tar.gz::https://github.com/archisman-panigrahi/Hieroglyphic/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('dbce366db8c80b54623f1d47a0a560091fc5ef485eacb56bca0a690f07749ac1')

package() {
	cp -r "$srcdir/hieroglyphic/usr/" "$pkgdir/"
}
