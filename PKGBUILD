# Maintainer: Just Some Lazy Fox <justsomelazyfox@gmail.com>
pkgname=turboshot
pkgver=2.0.0
pkgrel=1
pkgdesc="A better screenshot tool for Wayland using grim and GTK"
arch=('x86_64')
url="https://github.com/JustSomeLazyFox/TurboShot"
license=('GPL-3.0')
depends=('glibc' 'gtkmm-4.0' 'gtk4-layer-shell' 'satty' 'grim' 'gdk-pixbuf2')
makedepends=('git')
# https://github.com/JustSomeLazyFox/TurboShot/releases/download/v2.0.0/turboshot
source=("turboshot::$url/releases/download/v$pkgver/turboshot")
sha256sums=('92b2de89c591536c10c7c1689f4a7c1143ca97cd9762761e3e8667ad0241c2fd')

package() {
    # Install binary to /usr/bin
    install -Dm755 "$srcdir/turboshot" "$pkgdir/usr/bin/turboshot"
}
