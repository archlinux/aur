pkgname=updater
pkgver=1.3
pkgrel=1.3
pkgdesc="this is an updater."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=('bash')
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('SKIP') # replace 'SKIP' with real checksum

build() {
  return 0
}

package() {
  install -Dm755 "$srcdir/testpackage-main/code.sh" "$pkgdir/usr/bin/code.sh"
}
