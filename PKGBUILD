# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-fluent.syntax
pkgver=0.19.0
pkgrel=1
pkgdesc="Module to read, write and transform Fluent localization system files"
arch=('any')
url=https://projectfluent.org
license=('Apache')
depends=('python-typing_extensions')
makedepends=('python-setuptools')
source=("https://github.com/projectfluent/python-fluent/archive/refs/tags/fluent.syntax@${pkgver}.tar.gz")
sha256sums=('fa0d0863707ed24c62daa57457e70b153c7876f2e9cdf3cc46f737f33837aba8')

package() {
  cd python-fluent-fluent.syntax-${pkgver}/fluent.syntax
  python setup.py install --root "${pkgdir}"
}
