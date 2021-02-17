# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_tax_rule_country
_name=trytond_account_tax_rule_country
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add countries on tax rules"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6ac466a7ac1db4f55fb3d6b0a0df4ceb652240ec08b9d96011d60eacb7ad35b1')
sha512sums=('955cd86fab8dc0f57dd83165d7f9338557070ef80cbfaa436e00bfcfa99efd366c871c20d36700cae5f9db09b0c0cb8522b09dd7f9aed28aedb70098e2856dcd')
b2sums=('bc7b39c05905905ec0f7729f676db8e6c14ff60ff23deb63bbf5366ca4e3d2318ca7dacd74a3810ba0a30482866bc40e1ab3d20c78c793c0d207de22256945dd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
