# Maintainer: Jens L. Nedregård <jens@nedregard.net>
pkgname=lsix
pkgver=1.6.0
pkgrel=2
pkgdesc='Like "ls", but for images. Shows thumbnails in terminal using sixel graphics.'
arch=("any")
url="https://github.com/hackerb9/lsix"
license=('GPL3')
depends=(imagemagick)
source=("https://raw.githubusercontent.com/hackerb9/$pkgname/$pkgver/$pkgname")
md5sums=('81c35c972f102d8b752ff063fc7cfbeb')

package() {
  install --mode=755 "$pkgname" -D "$pkgdir/usr/bin/$pkgname"
}
