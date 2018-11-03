# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=1.3.1
pkgrel=1
pkgdesc='Set the system timezone based on IP geolocation'
url=http://github.com/cdown/tzupdate
arch=(any)
license=('Public Domain')
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/tzupdate/archive/${pkgver}.zip")
md5sums=('fde0421924f76c7b29dc11d5b17bc62c')

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return 1
    python setup.py install --root="${pkgdir?}"
}
