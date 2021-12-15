# Maintainer: Safwan Ljd <eljadisafwan@gmail.com>

pkgname=dim-screen
pkgver=1.0
pkgrel=1
pkgdesc="A screen dimmer bash script designed to work with xss-lock"
arch=("any")
url="https://github.com/SafwanLjd/dim-screen"
license=("GPL3")
depends=("xorg-xbacklight")
source=("https://github.com/SafwanLjd/dim-screen/releases/download/$pkgver/$pkgname.tar.gz")
sha1sums=("652a7466db1f58b0338d1e9226eb4e535d1bb8d9")

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
