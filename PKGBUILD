# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widowild [at] myopera [dot] com>

pkgname=python2-urwid-satext
_realname=urwid_satext
pkgver=0.3.0
pkgrel=1
pkgdesc="Urwid satext is a curses-based user interface library for sat (salut a toi)."
license=('GPL')
arch=('any')
depends=('python2-urwid' 'python2')
url="http://www.goffi.org/"
source=("http://ftp.goffi.org/urwid-satext/${_realname}-${pkgver}.tar.bz2")
sha256sums=('cd6c1f8ff48b276cbbb9d34ed0df5e0a3e510c693cc6f37f46f65b95cb477ae0')

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
