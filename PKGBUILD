# Maintainer: Yaron de Leeuw <jdlmail at gmail >
pkgname=python-pies
_pkgname=pies
pkgver=1.0.3
pkgrel=1
pkgdesc="The simplest (and tastiest) way to write one program that runs on both Python 2.6+ and Python 3."
arch=('any')
url="https://github.com/timothycrosley/pies"
license=('GPL2')
depends=('python')
makedepends=(python-setuptools)
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pies/pies-$pkgver.tar.gz")
md5sums=('044f45fe0ba267a7d5978735b392599e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

