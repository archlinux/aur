# Maintainer: Sergey Malkin <adresatt@gmail.com>

pkgname=python-quantities
pkgver=0.11.1
pkgrel=1
pkgdesc="A Python package for handling physical quantities."
url="http://packages.python.org/quantities"
arch=("any")
license=("BSD")
depends=("python" "python-numpy")
makedepends=("python-setuptools")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("a65e07e765bad0c53d872fa2f09f3c42")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root=${pkgdir}
}
