# Maintainer: Jens L. Nedregård <jens@nedregard.net>
pkgname=lsix
pkgver=1.7.0
pkgrel=1
pkgdesc='Like "ls", but for images. Shows thumbnails in terminal using sixel graphics.'
arch=("any")
url="https://github.com/hackerb9/lsix"
license=('GPL3')
depends=(bash imagemagick)
source=("https://raw.githubusercontent.com/hackerb9/$pkgname/$pkgver/$pkgname")
md5sums=('91b0f331acaa855cfbcc0675f507c372')

package() {
  install --mode=755 "$pkgname" -D "$pkgdir/usr/bin/$pkgname"
}
