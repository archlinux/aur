# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=1.18.0
pkgrel=2
pkgdesc='YouTube videos on the command line'
url=http://github.com/cdown/yturl
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://github.com/cdown/yturl/archive/${pkgver}.zip")
md5sums=(7afab2dc1434927060e93075f9cd4e9c)

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
}
