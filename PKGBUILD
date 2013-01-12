# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widowild [at] myopera [dot] com>

pkgname=python2-urwid-satext
_realname=urwid_satext
pkgver=0.2.0
pkgrel=1
pkgdesc="Urwid satext is a curses-based user interface library for sat (salut a toi)."
license=('GPL')
arch=('any')
depends=('python2-urwid' 'python2')
url="http://www.goffi.org/"
source=(http://ftp.goffi.org/urwid-satext/${_realname}-${pkgver}.tar.bz2)
sha256sums=('80f035500a67f9e0776b9ef29d5b0b6d7282cc5f95735b4f315a2a4404b8b5b1')

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
