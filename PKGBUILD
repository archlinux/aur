# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=mnimi
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple note taking application written in python."
arch=("any")
url="https://gitlab.com/ymber/mnimi"
license=("MIT")
depends=("python")
source=("https://gitlab.com/ymber/mnimi/-/archive/1.0.0/mnimi-1.0.0.tar.bz2")
sha256sums=("a790567adafddc88c2bc83dacab0deda0cf82f77c445d2ab791e476a12e6c6d4")

package() {
  install -D -m755 "$srcdir/$pkgname-$pkgver/mnimi" "$pkgdir/usr/bin/mnimi"
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

