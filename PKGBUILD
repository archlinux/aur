# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: vae77 <fernandogrd@yahoo.com.br>

pkgname=python2-pathlib
pkgver=1.0.1
pkgrel=5
pkgdesc="This module offers a set of classes featuring all the common operations on paths in an easy, object-oriented way"
arch=('any')
url="https://pathlib.readthedocs.org/en/${pkgver}/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pathlib/pathlib-${pkgver}.tar.gz")
sha512sums=('d85e45dfcc85ce75a7e7b609163dc8c75c688f279c1833510185f280af5501e473376dc09bddc6a804d1fcc3177a939db85af37b7b8d5b183b9bc2b85b3b0f8b')

package() {
  cd "$srcdir/pathlib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
