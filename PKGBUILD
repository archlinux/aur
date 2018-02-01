# Maintainer: Sergey Malkin <adresatt@gmail.com>

pkgname=python-quantities
pkgver=0.12.1
pkgrel=1
pkgdesc="A Python package for handling physical quantities."
url="http://packages.python.org/quantities"
arch=("any")
license=("BSD")
depends=("python" "python-numpy")
makedepends=("python-setuptools")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("e788b8007902d61d3fb27f6a886da1a4")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root=${pkgdir}
}
