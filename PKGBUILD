# Maintainer: Safwan Ljd <eljadisafwan@gmail.com>

pkgname=blurlocker
pkgver=1.2
pkgrel=1
pkgdesc="An i3lock-color Wrapper Script That Reads Colors Directly From Xresources"
arch=("any")
url="https://github.com/SafwanLjd/BlurLocker"
license=("GPL3")
depends=("i3lock-color" "xgetres")
source=("https://github.com/SafwanLjd/BlurLocker/releases/download/$pkgver/$pkgname.tar.gz")
sha1sums=("da63511697cfc9a7f4c0557463ae0a1d8f4b19ec")

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
