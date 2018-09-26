# Maintainer: cylgom <cylgom@gmail.com>
pkgname=ly
pkgver=0.2.1
pkgrel=1
pkgdesc="TUI display manager"
arch=('i686' 'x86_64')
url="https://github.com/cylgom/ly"
license=('custom:WTFPL')
makedepends=('unzip')
depends=('pam' 'xorg-xinit' 'xorg-xauth')
conflicts=('ly-git')
source=('https://github.com/cylgom/ly/releases/download/0.2.1/ly_0.2.1.zip')
md5sums=('4dcc18944efc71e55a13e0e442d98fbb')

package() {
	cd ly_0.2.1
	DESTDIR="$pkgdir" ./install.sh
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
