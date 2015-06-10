# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-clint
pkgver=0.4.1
pkgrel=1
pkgdesc='Module for developing commandline applications'
arch=('any')
url='http://pypi.python.org/pypi/clint/'
license=('custom:ISC')
depends=('python')
source=("http://pypi.python.org/packages/source/c/clint/clint-$pkgver.tar.gz")
sha256sums=('3a9e7ba7ceaa10276bcfe85110a04633813344406ec6181063cd79210b2804a8')

package() {
  cd "clint-$pkgver"

  python setup.py install \
    --install-data="/usr/share/doc/$pkgname" --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
