# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=package-installer-gui
pkgver=1.0
pkgrel=1
pkgdesc="A simple package installer application"
arch=('any')
url="https://github.com/almezali/PKG-installer"
license=('MIT')
depends=('python')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz"
)
sha256sums=('SKIP')

package() {
    cd "$srcdir/PKG-installer-main"

    install -Dm755 "package_installer.py" "$pkgdir/usr/bin/package-installer"
    install -Dm644 "package_installer.desktop" "$pkgdir/usr/share/applications/package_installer.desktop"
    install -Dm644 "arch_pkg.png" "$pkgdir/usr/share/icons/arch_pkg.png"
}

