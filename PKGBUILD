# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-gerritclient
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool and Python API wrapper for Gerrit Code Review"
url="https://github.com/tivaliy/python-gerritclient"
license=('GPL3')
arch=(any)
depends=('python' 'python-pbr' 'python-cliff')
makedepends=('git' 'cython')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tivaliy/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('dded468c508e31655bbc4790aa56d135')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
