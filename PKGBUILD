# Maintainer: almezali <mzmcsmzm@gmail.com>

pkgname=package-installer-v
pkgver=1.0
pkgrel=1
pkgdesc="Package installation GUI tool"
arch=('x86_64')
url="https://gitlab.com/package-installer-gui/PKG-installer"
license=('GPL')

source=("https://gitlab.com/package-installer-gui/PKG-installer/-/raw/main/package-installer-1.0-1-x86_64.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    # تثبيت الحزمة مباشرة
    cp "$srcdir/package-installer-1.0-1-x86_64.pkg.tar.zst" "$pkgdir/"
    sudo pacman -U "$pkgdir/package-installer-1.0-1-x86_64.pkg.tar.zst"
}
