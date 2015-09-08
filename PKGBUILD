# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=1.20.0
pkgrel=2
pkgdesc='YouTube videos on the command line'
url=http://github.com/cdown/yturl
arch=(any)
license=(MIT)
depends=(python python-requests)
makedepends=(python-setuptools)
source=("https://github.com/cdown/yturl/archive/${pkgver}.zip")
md5sums=('a9c085807ec044e3f5f9ba88efd6f7ea')

package() {
    cd "${srcdir?}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir?}"
}
