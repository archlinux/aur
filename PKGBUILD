# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-dpkt
pkgver=1.8.r98
pkgrel=2
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('i686' 'x86_64')
url=("https://github.com/kbandla/dpkt")
license=('custom')
depends=('python2')
source=("https://github.com/kbandla/dpkt/archive/${pkgver}.tar.gz")
md5sums=('79922d79eaaad5673520d810f242b95e')

package() {
  cd "$srcdir/dpkt-${pkgver}"
  python2 setup.py build install --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
