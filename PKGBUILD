# Maintainer: Elio Esteves Duarte <hello[at]eliostvs[dot]com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-venusian
_pkgname=venusian
pkgver=3.1.1
pkgrel=1
pkgdesc="A library for deferring decorator actions."
arch=("any")
url="https://github.com/Pylons/venusian/"
license=("custom:BSD")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/v/venusian/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c7d45065905eceebb5ce54b2e72590f9')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
