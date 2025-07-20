pkgname=updater
pkgver=2.7
pkgrel=2
pkgdesc="This is an updater."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=('bash')
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  chmod +x "$srcdir/testpachkage-main/code.sh"
}

package() {
  install -Dm755 "$srcdir/testpackage-main/code.sh" "$pkgdir/usr/bin/updater"
}
