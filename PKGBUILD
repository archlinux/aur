# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
pkgname=python2-eve
pkgver=0.5.3
pkgrel=1
pkgdesc="An open source Python REST API framework designed for human beings."
arch=('any')
url="http://python-eve.org/"
license=('BSD')
makedepends=('python2-setuptools')
provides=('python2-eve')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/E/Eve/Eve-${pkgver}.tar.gz")
sha256sums=('623e89bc551eee0fa4b2325ec17eef2cf13d019475befb8a425d62f1117619fb')

package() {
  cd "$srcdir/Eve-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
