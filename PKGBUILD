# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Ethan Chan <metakirby5 at gmail dot com>

pkgname=colorz
pkgver=1.0.3
pkgrel=1
pkgdesc="A k-means color scheme generator."
arch=(any)
url="https://github.com/metakirby5/colorz"
license=(MIT)
depends=("python" "python-pillow" "python-scipy")
source=("git+$url")
md5sums=(SKIP)

package() {
  cd "$srcdir/colorz"
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
