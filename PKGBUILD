# Mainter: HaoZeke <HaoZeke@yandex.com>
pkgname=klfc-bin
provides=("klfc")
conflicts=("klfc")
pkgver=1.5.6
pkgrel=1
pkgdesc="Tool to create advanced keyboard layouts in various formats (binary version)"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("x86_64")
source=("https://github.com/39aldo39/klfc/releases/download/v$pkgver/klfc-linux-amd64-v$pkgver.tar.xz")
md5sums=('eaa9819fd4a8567027039ec17545ecf3')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/klfc" "$pkgdir/usr/bin"
}
