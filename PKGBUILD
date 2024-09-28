# Maintainer: Liam Leer <liamleer012@gmail.com>
pkgname=vmcompile
pkgver=1.0
pkgrel=1
pkgdesc="A VMware kernel modules compiling script for noobs."
arch=('x86_64')
url="https://github.com/TripleLLL9/vmcompile"
license=('GPL')
depends=('git' 'linux-headers' 'shc')
source=("vmcompile.sh")
sha256sums=('d2dd3e73596be9a6c7bc28e2095633254d527e1a87b8ff348305e4a7a8e88428')

package() {
    shc -f vmcompile.sh -o vmcompile
    install -Dm755 "$srcdir/vmcompile" "$pkgdir/usr/bin/vmcompile"
}
