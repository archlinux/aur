# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=0.4.0
pkgrel=3
pkgdesc='Set the system timezone based on IP geolocation'
url=http://github.com/cdown/tzupdate
arch=(any)
license=(ISC)
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/tzupdate/archive/${pkgver}.zip")
md5sums=('c2944582e3a4829db64330bd9d3dbca1')

package() {
    cd "${srcdir?}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir?}"
}
