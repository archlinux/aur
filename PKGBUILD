pkgname=libelectron-electron-meta
pkgver=38
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"
source=("electron")
sha256sums=('4a80d80d206df14913ef46ac85b4773c0b43a7f088376bf8157d6b392ca0a673')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/electron" "$pkgdir/usr/bin/libelectronmeta"
}

