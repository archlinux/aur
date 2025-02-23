# Maintainer: almezali <mzmcsmzm@gmail.com>

pkgname=package-installer-x
pkgver=1.0
pkgrel=1
pkgdesc="Package installation GUI tool"
arch=('x86_64')
url="https://gitlab.com/package-installer-gui/PKG-installer"
license=('GPL')

source=("https://gitlab.com/package-installer-gui/PKG-installer/-/raw/main/package-installer-1.0-1-x86_64.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    # Copy the prebuilt package to the package directory
    install -Dm644 "$srcdir/package-installer-1.0-1-x86_64.pkg.tar.zst" "$pkgdir/usr/share/package-installer/package-installer-1.0-1-x86_64.pkg.tar.zst"
}
