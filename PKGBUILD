# Maintainer: Snehit Sah <snehitsah@protonmail.com>

pkgname=ttf-smokum
pkgver=1.001
pkgrel=1
pkgdesc="A western inspired slab-serif font with a little playful swagger to it."
arch=('any')
license=('Apache')
url="https://github.com/google/fonts/tree/master/apache/smokum"
source=("https://github.com/google/fonts/raw/master/apache/smokum/Smokum-Regular.ttf")
md5sums=('9c6ebacd90feb70fbaf84688e7c53f33')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" "$srcdir/Smokum-Regular.ttf"
}
