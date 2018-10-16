# Maintainer: Michael Polidori <michaelapolidori@gmail.com>
# Python package author: Ethan Chan <metakirby5@gmail.com>
pkgname=colorz
pkgver=1.0.3
pkgrel=1
pkgdesc="A k-means color scheme generator."
arch=(any)
url="https://github.com/metakirby5/colorz"
license=(MIT)
depends=("python" "python-pillow" "python-scipy")
source=("$url")
md5sums=(SKIP)

package() {
  cd "$srcdir/colorz"
  python setup.py install --root="${pkgdir}"
}
