# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_tax_rule_country
_name=trytond_account_tax_rule_country
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc=""
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('de5704b765be9be1ef0d3af64107ffa9fa37e8b20d6afc2ab26680cd4a03fdfc')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
