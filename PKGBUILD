# Maintainer: Yuri Bochkarev <baltazar.bz gmail com>
pkgname=mpatch
pkgver=0.8
pkgrel=1
pkgdesc="Applies diffs and is generally similar to patch, but it can also help resolve a number of common causes of patch rejects"
arch=('any')
url="http://oss.oracle.com/~mason/mpatch/"
license=('GPL')
depends=('python2')
options=(!emptydirs)
source=("http://oss.oracle.com/~mason/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('24f2027ae9d7b59e2c635ee2e485a887')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
