pkgname=libelectron-electron-meta
pkgver=42
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=("electron${pkgver}")
pkgdesc="A meta package for setting and controlling the electron versioning for LibElectron packages"
source=("electron")
sha256sums=('e3337cde0d67444c1bd158904f02b2aa8cc6dc6a918beb15c42bd3c4abd26693')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/electron" "$pkgdir/usr/bin/libelectronmeta"
}

