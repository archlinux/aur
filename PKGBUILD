# Maintainer: Safwan Ljd <eljadisafwan@gmail.com>

pkgname=blurlocker
pkgver=1.3
pkgrel=1
pkgdesc="An i3lock-color Wrapper Script That Reads Colors Directly From Xresources"
arch=("any")
url="https://gitlab.com/SafwanLjd/BlurLocker"
license=("GPL3")
depends=("i3lock-color" "xgetres")
source=("https://gitlab.com/SafwanLjd/BlurLocker/-/archive/v$pkgver/BlurLocker-v$pkgver.tar.gz")
sha1sums=("0bbf0f28b298bcd2888a2706a6301eb649a54a46")

package() {
  install -Dm755 "$srcdir/BlurLocker-v$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
