# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=firn-bin
pkgver=0.0.13
pkgrel=1
pkgdesc="Static site generator for org-mode"
arch=('x86_64')
url="https://github.com/theiceshelf/firn"
license=('EPL')
source=($pkgname-$pkgver::https://github.com/theiceshelf/firn/releases/download/v$pkgver/firn-linux.zip)
md5sums=('900cd458802922e8dcb0c9df0c7f41a4')

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/firn" "$pkgdir/usr/bin/"
}
