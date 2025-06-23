pkgname=libelectron-electron-meta
pkgver=36
pkgrel=3
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"
source=("electron")
sha256sums=('89e9ff2cfeeddeb08f691ff403eba84c7722443966bb303b602df62b5cee85bd')

package() {
    install -dm755 "$pkgdir/usr/bin"
   install -Dm755 "$srcdir/electron" "$pkgdir/usr/bin/libelectronmeta"
}

