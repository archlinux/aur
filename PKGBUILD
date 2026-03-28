pkgname=test
pkgver=1.2
pkgrel=1.2
pkgdesc="this is a test package."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=("bash")
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('d47e1e987d742266ed9c9985304854d527efce9eb3d25eaeb5796d1a4ef5e808')

build() {
  return 0
}

package() {
  mkdir -p "$pkgdir/usr/share/package"
  cp "$srcdir/testpackage-main/test.txt" "$pkgdir/usr/share/package/"
}
