# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_request_quotation
_name=trytond_purchase_request_quotation
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for purchase request quotation"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a60aa8462383b5947c68d7d547bd8ee2d4a4b246c534787030acfaabb83dba3e')
sha512sums=('d89eb898f9106d63284b26a6b17b27d4580ccd96699d38e088feb893a8a2a2f2d22ad2d3ee8c7c408a964588b6aa32e520a3cb2b9d2bd49bdcd23a20e188747d')
b2sums=('5770990edb8d1d10b2235a9c4dad17817a3ef2e74e2602a9589ddfe45f5551132e3b01a303b8ba33dcf1e56e7ad4a78572888ad864b19123bea658fb4782ad90')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
