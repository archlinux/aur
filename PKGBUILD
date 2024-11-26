# Maintainer: Carlos <research@sanchezcarlosjr.com>
#
pkgname=hello-world-learning
pkgver=1.0
pkgrel=1
pkgdesc="A simple Hello World script"
arch=('any')
url="https://example.com"
license=('MIT')
source=("hello.sh")
sha256sums=('SKIP') # Use SKIP for simplicity; replace with actual checksum if needed.

package() {
    install -Dm755 "$srcdir/hello.sh" "$pkgdir/usr/bin/hello"
}
