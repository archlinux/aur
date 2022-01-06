# Maintainer: Safwan Ljd <eljadisafwan@gmail.com>

pkgname=blurlocker
pkgver=1.3
pkgrel=1
pkgdesc="An i3lock-color Wrapper Script That Reads Colors Directly From Xresources"
arch=("any")
url="https://github.com/SafwanLjd/BlurLocker"
license=("GPL3")
depends=("i3lock-color" "xgetres")
source=("https://github.com/SafwanLjd/BlurLocker/releases/download/$pkgver/$pkgname.tar.gz")
sha1sums=("b82a1c1fbbf2dd2571e3a74a41d4deded4d33c67")

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
