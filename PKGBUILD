# Maintainer: James An <james@jamesan.ca>

pkgname=python-gntp
_pkgname=gntp
pkgver=1.0.3
pkgrel=1
pkgdesc='Library for working with the Growl Notification Transport Protocol'
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('GPL')
depends=('growl-for-linux' 'python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a2c85eb3e3243255ac8f03af5d05b859')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1
}
