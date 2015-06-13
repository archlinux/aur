# Maintainer: S.Leduc <sebastien@sleduc.fr>

pkgname=python2-grapevine
_realname=grapevine
pkgver=1.0
pkgrel=1
pkgdesc="Iterator pipelines for Python"
arch=("any")
url="http://jwilk.net/software/python-grapevine"
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/source/g/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('689dabfb162f253b1718562cf16f9e46')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
