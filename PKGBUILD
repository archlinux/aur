# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=0.5.0
pkgrel=1
pkgdesc='Set the system timezone based on IP geolocation'
url=http://github.com/cdown/tzupdate
arch=(any)
license='Public Domain'
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/tzupdate/archive/${pkgver}.zip")
md5sums=('44477a9a522c7eb18b4beddef973418c')

package() {
    cd "${srcdir?}/$pkgname-$pkgver" || return 1
    python setup.py install --root="${pkgdir?}"
}
