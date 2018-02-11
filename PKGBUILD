# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=2.0.2
pkgrel=1
pkgdesc='YouTube videos on the command line'
url=http://github.com/cdown/yturl
arch=(any)
license=('Public Domain')
depends=(python python-requests python-setuptools)
source=("https://github.com/cdown/yturl/archive/${pkgver}.zip")
md5sums=('400d48a95fff90e96b8ef0e4fef49e74')

package() {
    cd "${srcdir?}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir?}"
}
