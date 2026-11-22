# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=ttf-courier-badi
pkgver=1.101
pkgrel=1
pkgdesc="Courier Badi, a monospace typewriter font based on Courier Prime, extended for Bahá'í usage"
arch=('any')
url="https://github.com/LaPingvino/courier-badi"
license=('OFL-1.1')
source=("$url/releases/download/v$pkgver/courier-badi-v$pkgver.zip")
sha256sums=('0745a35aded8b1762065fa2d6c074d7a4f8aeed00ecd268799c4fabd533aeb5c')

package() {
  cd "courier-badi-v$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" fonts/ttf/CourierBadi-*.ttf
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
