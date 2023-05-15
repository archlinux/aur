# Maintainer: Viktor Chuchman <norz3nmusic@gmail.com>
# Project by koki-develop (https://github.com/koki-develop/)
pkgname=gat-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='Cat alternative written in Go. Binary Version'
arch=('x86_64')
url="https://github.com/koki-develop/gat"
license=('MIT')
source=("$pkgname.tar.gz::https://github.com/koki-develop/gat/releases/download/v$pkgver/gat_Linux_x86_64.tar.gz")
sha256sums=('d65bf87eabee3014c357d76a9c768acbde312fbb3ec1c152a13c3a252f668206')
provides=('gat')
conflicts=('gat' 'gat-git')

package() {
  install -Dm755 "$srcdir"/gat "$pkgdir"/usr/bin/gat
  install -Dm644 "$srcdir"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
