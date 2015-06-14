# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
pkgname=radiod
pkgver=1.4.3
pkgrel=1
pkgdesc="Bash script for listening internet radio via mplayer, controlled by the dialog program"
arch=('any')
url=('http://dracorp.one.pl/source/radiod')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/dradio/${pkgname}-${pkgver}.tar.gz)
makedepends=('gettext' 'make')
depends=('dialog' 'mplayer' 'screen')
backup=('etc/radiod.pls')
build() {
   cd ${srcdir}/${pkgname}
   make || return 1
   make DESTDIR=${pkgdir} install || return 1
}

# vim:set ts=2 sw=2 et
md5sums=('618ac72196aa9fcfe2c39068fa958500')
