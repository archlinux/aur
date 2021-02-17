# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement_coda
_name=trytond_account_statement_coda
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to import CODA statements"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ce02e9d57d843374b523c6d543c9895cc9e83a14e2ede9502468231038924ff3')
sha512sums=('60bc147c53ba658e78ebc95b1769f07dddb6aa5b29ce350ff99671f3a000b10c6c075469101cf62cfbabd33e539550a86351049b158e9805dc22547ae8b0591f')
b2sums=('aa62b7fea43293c72a324de229b1481434a8313e1a0aecd750b233b95345f5f42bddc1ce285e71a0a5553690ece1be1b7cf96d2802559c83fabde1cfd0bb67ca')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
