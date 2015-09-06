# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=1.19.0
pkgrel=1
pkgdesc='YouTube videos on the command line'
url=http://github.com/cdown/yturl
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://github.com/cdown/yturl/archive/${pkgver}.zip")
md5sums=('ddbfa4ad7766e4adda1183639863b946')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
}
