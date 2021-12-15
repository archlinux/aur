# Maintainer: Safwan Ljd <eljadisafwan@gmail.com>

pkgname=blurlocker
pkgver=1.0
pkgrel=1
pkgdesc="An i3lock-color Wrapper Script That Reads Colors Directly From Xresources"
arch=("any")
url="https://github.com/SafwanLjd/BlurLocker"
license=("GPL3")
depends=("i3lock-color" "xgetres")
source=("https://github.com/SafwanLjd/BlurLocker/releases/download/$pkgver/$pkgname.tar.gz")
sha1sums=("33e86b55b5ce8f67f61d72c5559a3c3c226bf6d8")

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
