# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=python-purplex
_pkgname=purplex
pkgver=0.2.4
pkgrel=2
pkgdesc="Pure Python lexer and parser implementation"
arch=('any')
url="https://pypi.python.org/pypi/purplex/0.2.4"
license=('MIT')
depends=('python' 'python-six')
source=(https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('670539e46f63da364d7fb83aeb86a170')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  yes | python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  yes | python setup.py install --root="${pkgdir}"
}

