# Maintainer: Anatol Pomozov 

pkgname=python-nr.strex
pkgver=1.3
pkgrel=1
pkgdesc='A package for processing text and character streams in an easy fashion'
arch=(any)
url='https://github.com/nr-python/nr.strex'
license=(MIT)
depends=(python)
source=(https://pypi.python.org/packages/source/n/nr.strex/nr.strex-$pkgver.tar.gz)
sha1sums=('60942a7bfaf3941ff1619c2e991a9a6f16ed8f60')

package() {
  cd nr.strex-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
