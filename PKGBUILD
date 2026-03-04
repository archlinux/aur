pkgname=libelectron-electron-meta
pkgver=40
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"
source=("electron")
sha256sums=('44a6b6496f4cdf70fb2c34797985ff9b5eb1b27f78eda4b2bfb36284c5fbd422')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/electron" "$pkgdir/usr/bin/libelectronmeta"
}

