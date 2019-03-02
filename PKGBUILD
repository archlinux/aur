pkgname=klfc-bin
provides=("klfc")
conflicts=("klfc")
pkgver=1.5.4
pkgrel=1
pkgdesc="Tool to create advanced keyboard layouts in various formats (binary version)"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("x86_64")
source=("https://github.com/39aldo39/klfc/releases/download/v$pkgver/klfc-linux-amd64-v$pkgver.tar.xz")
md5sums=('c3121db0c7c8a9518f59395a07606c45')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/klfc" "$pkgdir/usr/bin"
}
