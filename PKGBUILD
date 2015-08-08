# Maintainer: gosella <gosella@gmail.com>
# Submitter: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=python2-pager
pkgver=3.3
pkgrel=1
pkgdesc="Terminal/console pager module for Python"
arch=('any')
url="http://pypi.python.org/pypi/pager"
license=('Public Domain')
source=("http://pypi.python.org/packages/source/p/pager/pager-$pkgver.tar.gz")
depends=('python2')
md5sums=('fbebda4d8d537c8aa0de883d15b87b95')

package() {
  cd "$srcdir/pager-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
