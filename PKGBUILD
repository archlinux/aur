# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-walrus"
_projname="walrus"
pkgver=0.8.1
pkgrel=1
pkgdesc='Lightweight Python utilities for working with Redis'
license=('MIT')
arch=('any')
url='https://github.com/coleifer/walrus'
makedepends=('python' 'python-distribute')
depends=('python' 'python-redis')
source=("https://github.com/coleifer/${_projname}/archive/${pkgver}.tar.gz")
md5sums=('87ac731225931a85c7dd7b2a40a68660')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
