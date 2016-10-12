# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widowild [at] myopera [dot] com>
# Contributor: Skippythekangoo <Skippythekangoo CHEZ yahoo POINT fr>

pkgname=python2-urwid-satext
_realname=urwid_satext
pkgver=0.6.1
pkgrel=1
pkgdesc="Urwid satext is a curses-based user interface library for sat (salut à toi)."
license=('LGPL3+')
arch=('any')
depends=('python2-urwid' 'python2')
url="http://www.goffi.org/"
source=("http://ftp.goffi.org/urwid-satext/${_realname}-${pkgver}.tar.bz2")
sha256sums=('5c3a4158db8001966bf2e592ebd358b7a234916a292b37792d016b5047354d8e')

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
