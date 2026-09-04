pkgname=libelectron-electron-meta
pkgver=44
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"
source=("electron")
sha256sums=('0bfbdee6803fdffe2f6b20b046218776134c9e0ef852cbb38304e9b1531d4892')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/electron" "$pkgdir/usr/bin/libelectronmeta"
}

