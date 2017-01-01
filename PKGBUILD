# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=1.1.0
pkgrel=1
pkgdesc='Set the system timezone based on IP geolocation'
url=http://github.com/cdown/tzupdate
arch=(any)
license=('Public Domain')
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/tzupdate/archive/${pkgver}.zip")
md5sums=('95c6415bfb563dbdcc654f175e1b5a66')

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return 1
    python setup.py install --root="${pkgdir?}"
}
