# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shop_vue_storefront
_name=trytond_web_shop_vue_storefront
pkgver=5.8.3
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to integrate with Vue Storefront"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f9bf6b8388ff49446ad8c6055c2c961179fd85eb5bae8ab57834005bf33de684')
sha512sums=('28ebd16531882a2983af6ef967c09f021bc91ccce24a174a6d2247ebe9158bbde46e7c0510ea7158a65f49cdfd9523ed80ef207b16c196f10a5dff5410489757')
b2sums=('8189b7618202febd458b9d28036d0ae49c2190d417524df85f3f22e6f1d6682ce708b91751b5287e3f21f9afa670709f52da0e5d9fff3337e5df55b96ff50440')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
