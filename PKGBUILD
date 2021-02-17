# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_cost_fifo
_name=trytond_product_cost_fifo
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add FIFO cost method"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e4ab2b6d24ba7f11f7fb86a4a4041def4f5df0589bf7349952d662564c88a683')
sha512sums=('3c62d37719b2de6c787fe523df432aa8e1f1295acc26da97c626b710f6f34a872ee9a6924efb0113ed30425a2647cb29c74a970b7eec7df9181bb2e9e7232734')
b2sums=('75d29461e892817d0d8cd56048eeba3cf4201d47556b50ae6249508df669c2c47134ff462440606525b168dbe8f6cbd1d51556de2a46d1651c7e9fea18183bbc')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
