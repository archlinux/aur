# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
pkgname=xweston
pkgver=0.8.0
pkgrel=1
pkgdesc="Use X display managers and window managers with Xwayland and weston"
arch=('any')
url="https://github.com/ackalker/Xweston"
license=('MIT')
depends=('weston' 'xorg-server-xwayland')
conflicts=('xweston-git')
install=
source=(Xweston-${pkgver}.tar.gz::https://github.com/ackalker/Xweston/archive/v${pkgver}.tar.gz)
md5sums=('7db267d4481229368e6c9c1e1075cafe')

package() {
	cd "$srcdir/Xweston-${pkgver}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
