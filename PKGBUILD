# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=python-lyricwikia
pkgver=0.1.9
pkgrel=1
pkgdesc="LyricWikia API for song lyrics"
arch=("any")
url="http://github.com/enricobacis/lyricwikia"
license=("MIT")
depends=("python" "python-six" "python-requests" "python-beautifulsoup4")
makedepends=("python-setuptools")
source=("https://github.com/enricobacis/lyricwikia/archive/${pkgver}.tar.gz")
md5sums=('38cf496f85110964fb303cfa8a4aa26b')

build() {
    python setup.py build
}

package() {
    python setup.py --root="$pkgdir/" --optimize=1 --skip-build
}
