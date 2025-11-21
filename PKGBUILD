pkgname=libelectron-electron-meta
pkgver=39
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"
source=("electron")
sha256sums=('880a9d68ae83337a3faa3a69f8248e705884c54b4e7a96ebce6e7ea7110d2cfd')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/electron" "$pkgdir/usr/bin/libelectronmeta"
}

