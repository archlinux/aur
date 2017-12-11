# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: vae77 <fernandogrd@yahoo.com.br> 

_pythonmod=pathlib
pkgname=python-pathlib
pkgver=1.0.1
pkgrel=1
pkgdesc="This module offers a set of classes featuring all the common operations on paths in an easy, object-oriented way"
arch=('any')
url="http://pathlib.readthedocs.org/en/${pkgver}/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('5099ed48be9b1ee29b31c82819240537')

package() {
  cd "$srcdir/pathlib-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
