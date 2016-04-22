# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=2.0.1
pkgrel=1
pkgdesc='YouTube videos on the command line'
url=http://github.com/cdown/yturl
arch=(any)
license=('Public Domain')
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/yturl/archive/${pkgver}.zip")
md5sums=('4e3369452d7c6354e3d94ef29313cf39')

package() {
    cd "${srcdir?}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir?}"
}
