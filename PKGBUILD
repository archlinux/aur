# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Lance Gin <gin.lance.inside at hotmail dot com>

pkgname=python-haishoku
_name=${pkgname#python-}
pkgver=1.1.8
pkgrel=1
pkgdesc="A development tool for grabbing the dominant color or representative color palette from an image."
arch=(any)
url="https://github.com/LanceGin/haishoku"
license=(MIT)
depends=("python" "python-pillow")
source=("$url/archive/v$pkgver.tar.gz")
md5sums=("6938a8a1ac0f2c26f410f09003f09865")

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
