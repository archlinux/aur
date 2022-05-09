# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-petname
pkgver=2.0
pkgrel=2
epoch=1
pkgdesc="Generate human-readable, random object names."
arch=(any)
url="https://pypi.python.org/pypi/petname"
license=('apache')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=('https://pypi.python.org/packages/d9/a7/aab8825075230b706b58d59fa23171cfa066ca62507242ff91270bb33fca/petname-2.0.tar.gz#md5=411d5f8b92a25610bc56c32e74c4463a')
sha256sums=('28a1af453ed004e1a17eea9cd97b9bdd1d9fead6e770a6b1f0bd46541042fed0')

package() {
  cd "${srcdir}/petname-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
