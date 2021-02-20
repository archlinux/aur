# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# based on python-levenshtein by:
#   Maintainer: Felix Yan <felixonmars@archlinux.org>
#   Contributor: Thomas S Hatch <thatch45@gmail.com>
#   Contributor: shamrok <szamrok@gmail.com>
#   Contributor: scj <scj archlinux us>

pkgname=python2-levenshtein
pkgver=0.12.2
pkgrel=1
pkgdesc="Python extension for computing string edit distances and similarities"
url="https://pypi.python.org/pypi/python-Levenshtein/"
license=('GPL')
arch=('x86_64')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/python-Levenshtein/python-Levenshtein-$pkgver.tar.gz")
sha512sums=('97eac9d19121758af7620ad3963846e48434ceabb5376a83f28452015adf1a620620bfb53edb1c4f60b0fc8ec2b0faf35a105d7e2a0fc5df7a45fce81ba0dcdb')

package() {
  cd python-Levenshtein-$pkgver
  python2 setup.py build install -O1 --prefix=/usr --root="$pkgdir"
}
