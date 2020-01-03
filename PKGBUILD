# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=2.0.0
pkgrel=1
pkgdesc='Set the system timezone based on IP geolocation'
url=http://github.com/cdown/tzupdate
arch=(any)
license=('Public Domain')
depends=(python python-setuptools)
source=("https://github.com/cdown/tzupdate/archive/${pkgver}.zip")
md5sums=('2b59ff06b158a0735abb3cbe4d6a84fc')

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return 1
    python setup.py install --root="${pkgdir?}"
}
