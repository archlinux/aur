# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=1.4.0
pkgrel=1
pkgdesc='Set the system timezone based on IP geolocation'
url=http://github.com/cdown/tzupdate
arch=(any)
license=('Public Domain')
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/tzupdate/archive/${pkgver}.zip")
md5sums=('af81714a806f50cf3aed3eb9c8b98871')

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return 1
    python setup.py install --root="${pkgdir?}"
}
