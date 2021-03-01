# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=pyanidb
pkgver=0.2.1
pkgrel=1
pkgdesc="PyAniDB is a client for AniDB's UDP API."
arch=(any)
url="https://cgit.jvnv.net/pyanidb/"
license=('GPL')
depends=('python')
optdepends=('python-pyxattr')
source=(https://archive.jvnv.net/$pkgname-$pkgver.tar.gz)
md5sums=('c9cae78392b49b37d769f1ebc34eb007')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root=${pkgdir} || return 1
}

# vim:set ts=2 sw=2 et:
