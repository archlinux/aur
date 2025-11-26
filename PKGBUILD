# Maintainer: Christopher Dolan <siricandobhikkhu@gmail.com>
pkgname=hypr-cycle
giturl="https://github.com/christopherdolan/hypr-cycle.git"
pkgver=0.3.0
pkgrel=2
pkgdesc="A fast and monitor-aware workspace cycler for Hyprland, written in Rust"
arch=('x86_64')
url="${giturl}"
license=('MIT')
source=("hypr-cycle::https://github.com/christopherdolan/hypr-cycle/releases/download/v${pkgver}/hypr-cycle")

sha256sums=('254dd02939e40e8cf8cebd29b6ea5980431d92abeb1945b38b1ba2cba0039104')

package() {
    install -Dm755 hypr-cycle "$pkgdir/usr/bin/hypr-cycle"
}
