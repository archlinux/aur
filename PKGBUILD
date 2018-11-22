pkgname=klfc-bin
provides=("klfc")
conflicts=("klfc")
pkgver=1.5.3
pkgrel=1
pkgdesc="Tool to create advanced keyboard layouts in various formats (binary version)"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("x86_64")
source=("https://github.com/39aldo39/klfc/releases/download/v$pkgver/klfc-linux-amd64-v$pkgver.tar.xz")
md5sums=('c2cde3bda0759ba5b2315bc90e531e9d')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/klfc" "$pkgdir/usr/bin"
}
