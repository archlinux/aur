pkgname=test
pkgver=1.0
pkgrel=1
pkgdesc="this is a test package."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=("bash")
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('SKIP') # replace 'SKIP' with real checksum

build() {
  return 0
}

package() {
  mkdir -p "$pkgdir/usr/share/package"
  cp "$srcdir/testpackage-main/test.txt" "$pkgdir/usr/share/package/"
}
