# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python-clickclick
_pkgname=clickclick
pkgver=1.0
pkgrel=1
pkgdesc="Click command line utilities"
url="https://github.com/zalando/python-clickclick"
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-yaml')
source=("http://pypi.python.org/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9429dede90d390fc06a74c002bb9e05c')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}

# vim:set sw=2 sts=2 ft=sh et:
