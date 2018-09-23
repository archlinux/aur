# Maintainer: cylgom <cylgom@gmail.com>
pkgname=ly
pkgver=0.2
pkgrel=1
pkgdesc="TUI display manager"
arch=('i686' 'x86_64')
url="https://github.com/cylgom/ly"
license=('custom:WTFPL')
makedepends=('unzip')
depends=('pam' 'xorg-xinit' 'xorg-xauth')
source=('https://github.com/cylgom/ly/releases/download/0.2/ly_0.2.zip')
md5sums=('64b051e48014856668688fd770d9b3af')

package() {
	cd ly_0.2
	DESTDIR="$pkgdir" ./install.sh
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
