# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=pkger-g
pkgver=0.1.40
pkgrel=1
pkgdesc="PKGER - Pro GTK GUI package manager for Arch Linux"
arch=('any')
url="https://gitlab.com/package-installer-gui/pkger-g"
license=('MIT')
depends=('python' 'python-gobject' 'pacman-contrib' 'gtk3')
source=(
    "$pkgname-$pkgver.tar.gz::$url/-/archive/main/$pkgname-main.tar.gz"
)
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-main"

    install -Dm755 "pkger-g.py" "$pkgdir/usr/bin/pkger-g"
    install -Dm644 "pkger-g.desktop" "$pkgdir/usr/share/applications/pkger-g.desktop"
    install -Dm644 "pkger-gtk.png" "$pkgdir/usr/share/icons/pkger-gtk.png"
}

