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
sha1sums=("a8fd4181db127666e06790aa5d2bb1c8a59aeb5b")

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
