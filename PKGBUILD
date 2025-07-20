pkgname=updater
<<<<<<< HEAD
pkgver=2.8
pkgrel=2
=======
pkgver=3.2
pkgrel=3
>>>>>>> 3e1c1be (Update package to version 3.2)
pkgdesc="This is an updater."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=('bash')
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  chmod +x "$srcdir/testpackage-main/code.sh"
}

package() {
  install -Dm755 "$srcdir/testpackage-main/code.sh" "$pkgdir/usr/bin/updater"
}
