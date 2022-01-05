# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=2.1.0
pkgrel=1
pkgdesc='Set the system timezone based on IP geolocation'
url=http://github.com/cdown/tzupdate
arch=(any)
license=('Public Domain')
depends=(python python-setuptools)
source=("https://github.com/cdown/tzupdate/archive/${pkgver}.zip")
md5sums=('d1bfe48af64922eca1553d4f553d74cc')

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return 1
    python setup.py install --root="${pkgdir?}"
}
