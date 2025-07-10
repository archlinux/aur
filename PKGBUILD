pkgname=libelectron-electron-meta
pkgver=37
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}-bin")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"
source=("electron")
sha256sums=('bcb4adffd3cc478297a8ff19dd7fe4c6f33d66f279f4145fda6fa1c940ba3e63')

package() {
    install -dm755 "$pkgdir/usr/bin"
   install -Dm755 "$srcdir/electron" "$pkgdir/usr/bin/libelectronmeta"
}

