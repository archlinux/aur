# Maintainer: wido <widowild [at] myopera [dot] com>

pkgname=python2-urwid-satext
_realname=urwid_satext
pkgver=0.1.2
pkgrel=1
pkgdesc="Urwid satext is a curses-based user interface library for sat (salut a toi)."
license=('GPL')
arch=('any')
depends=('python-urwid' 'python2')
url="http://www.goffi.org/"
source=(http://ftp.goffi.org/urwid-satext/${_realname}-${pkgver}.tar.bz2)
md5sums=('3fce605f1162aa6e7532060e1c363bc8')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
