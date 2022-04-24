# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-fluent.syntax
pkgver=0.18.1
pkgrel=1
pkgdesc="Module to read, write and transform Fluent localization system files"
arch=('any')
url=https://projectfluent.org
license=('Apache')
makedepends=('python-setuptools')
source=("https://github.com/projectfluent/python-fluent/archive/refs/tags/fluent.syntax@${pkgver}.tar.gz")
sha256sums=('cd77c287eca226e7e70a90b0017eece9c730adf6a646a93e21d9504503774d0f')

package() {
  cd python-fluent-fluent.syntax-${pkgver}/fluent.syntax
  python setup.py install --root "${pkgdir}"
}
