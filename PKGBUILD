# Maintainer: Jens L. Nedregård <jens@nedregard.net>
pkgname=lsix
pkgver=1.6.2
pkgrel=1
pkgdesc='Like "ls", but for images. Shows thumbnails in terminal using sixel graphics.'
arch=("any")
url="https://github.com/hackerb9/lsix"
license=('GPL3')
depends=(imagemagick)
source=("https://raw.githubusercontent.com/hackerb9/$pkgname/$pkgver/$pkgname")
md5sums=('0978dcee2a2e2ff51eddb66ee69e42dc')

package() {
  install --mode=755 "$pkgname" -D "$pkgdir/usr/bin/$pkgname"
}
