# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=2.0.0
pkgrel=2
pkgdesc='YouTube videos on the command line'
url=http://github.com/cdown/yturl
arch=(any)
license='Public Domain'
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/yturl/archive/${pkgver}.zip")
md5sums=('5f8a316b6f5cfb80a6186f90aec92e8f')

package() {
    cd "${srcdir?}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir?}"
}
