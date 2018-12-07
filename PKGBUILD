# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname=('python-pyyaml' 'python2-pyyaml')
pkgver=3.13
pkgrel=2
pkgdesc='PyYAML is a full-featured YAML framework for the Python programming language'
arch=('any')
url="https://pyyaml.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pyyaml.org/download/pyyaml/PyYAML-${pkgver}.tar.gz")
sha256sums=('3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf')

_dirname="PyYAML-${pkgver}"

build_python-pyyaml() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

build_python2-pyyaml() {
  cd "${srcdir}/${_dirname}"
  python2 setup.py build
}

package_python-pyyaml() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pyyaml() {
  cd "${srcdir}/${_dirname}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
