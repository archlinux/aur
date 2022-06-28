# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=python2-pygtkhelpers
pkgver=0.4.3
pkgrel=2
pkgdesc="A library to assist the building of PyGTK applications"
arch=('any')
url="http://packages.python.org/pygtkhelpers"
license=('LGPL3')
depends=('pygtk')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/p/pygtkhelpers/pygtkhelpers-$pkgver.tar.gz")

package() {
  cd "$srcdir/pygtkhelpers-$pkgver"
  chmod 644 pygtkhelpers.egg-info/*
  python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('1e2493dbbfed4042d35552b383f7a7cc')
