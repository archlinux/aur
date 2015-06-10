# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=livestreamer-curses
pkgver='1.5.2' 
pkgrel=1
pkgdesc='A curses frontend to livestreamer.'
arch=('any')
url="https://github.com/gapato/livestreamer-curses"
license=('MIT')
depends=('livestreamer' 'ncurses')
options=(!strip)
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('ea07058f327a3acdc62dc4301a4a6b85')

package() {
	cd ${pkgname}-${pkgver} 
	python setup.py install --root="$pkgdir/" --optimize=1
}
