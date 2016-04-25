# Maintainer: James An <james@jamesan.ca>

pkgname=python-pushnotify
_pkgname=pushnotify
pkgver=0.5.1
pkgrel=1
pkgdesc='A package for sending push notifications to Android and iOS devices'
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('GPL3')
depends=( 'python-distribute' 'python-hghooks' 'python-sphinx')
makedepends=('python-pip' 'python-setuptools')
checkdepends=('python-nose' 'python-coverage')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('48679bcc47aabe27b42e866acafc6b3b')

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1
}
