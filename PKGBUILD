# Maintainer: Just Some Lazy Fox <justsomelazyfox@gmail.com>
pkgname=turboshot
pkgver=1.0.0
pkgrel=1
pkgdesc="A better screenshot tool for Wayland using grim and GTK"
arch=('x86_64')
url="https://github.com/JustSomeLazyFox/TurboShot"
license=('GPL-3.0')
depends=('glibc' 'gtkmm-4.0' 'gtk4-layer-shell')
makedepends=('git')
# https://github.com/JustSomeLazyFox/TurboShot/releases/download/v1.0.0/turboshot
source=("turboshot::$url/releases/download/v$pkgver/turboshot")
sha256sums=('db2c1f2ab681168c7e155ad77d630854198054165cbfa5a9ab45d0d552c4c2fb')

package() {
    # Install binary to /usr/bin
    install -Dm755 "$srcdir/turboshot" "$pkgdir/usr/bin/turboshot"
}
