# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Gour <gour@mail.inet.hr>

pkgname=python-postmarkup
_pkgname=postmarkup
pkgver=1.2.0
pkgrel=1
pkgdesc='Python module that generates html from BBCode.'
arch=(any)
url=http://code.google.com/p/postmarkup/
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=(http://postmarkup.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
md5sums=(8481ee11ec9f9c59666c3edd0bbe7e33)

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1

  # unfortunately no license file availabe
}
