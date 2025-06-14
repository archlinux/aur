pkgname=libelectron-electron-meta
pkgver=36
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"

package() {
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/electron$pkgver/electron" "$pkgdir/usr/bin/libelectronmeta"
}
