# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_carrier_percentage
_name=trytond_carrier_percentage
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add cost method on percentage on carrier"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('772dca42ad87ab7bf397c148b48848003d5fc3d4279197cc8f565e5414295d28')
sha512sums=('3dca29752c3ca2936210d2902733f3049047ca0d67a52ddad67f9f530b4e0d2df262cd4edc23afc0d2dac7acaec14c8cdf1f81881e61e0f6f20fe2086e0037af')
b2sums=('d256e0b5110f13e853fc0748227415a3193dd90a11b5233ef5ca9d6842344e598f6006ad873d325e3245fb4a3798c038c3aefef1a6356b84641c974e8ee96aa5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
