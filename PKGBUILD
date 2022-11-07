# Maintainer: Estela ad Astra <i at estela dot cn>

pkgname=xcursor-mizuki
pkgver=1.0
pkgrel=1
pkgdesc="Cursor theme of Akiyama Mizuki from Project Sekai Colorful Stage."
arch=('any')
license=('GPL')
depends=('libxcursor')
source=("xcursor-mizuki.tar.gz")

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/$pkgname "$pkgdir"/usr/share/icons/
}

sha256sums=('d8c1912a39d52ced1a907b06a05f9c5971b0c82926786fe7f52d8a837f5edd10')
