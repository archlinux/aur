# Maintainer: Philipp Joram <phijor AT t-online DOT de>

pkgname=python-wget
_hgname=$pkgname
_hgauthor=techtonik
_hgcommit=9c0e6f40b3c7
pkgver=2.2
pkgrel=1
pkgdesc="pure python download utility"
arch=(any)
url="http://bitbucket.org/$_hgauthor/$_hgname"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("https://bitbucket.org/$_hgauthor/$_hgname/get/$pkgver.tar.gz")
md5sums=('47cca89b0915d13e4793067f0e634d7c')

package() {
  cd "$srcdir/$_hgauthor-$_hgname-$_hgcommit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
