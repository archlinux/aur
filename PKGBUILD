# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=hyprsnap
pkgver=0.0.4
pkgrel=1
pkgdesc="A feature-rich Wayland screenshot utility for Linux/Hyprland. Uses slurp, grim, and rofi to capture regions, windows, or full screens with an interactive UI."
arch=('any')
url="https://github.com/chpock/hyprsnap"
license=('GPL-3.0-or-later')
depends=('jq' 'hyprland' 'rofi' 'imagemagick' 'hyprpicker' 'grim' 'slurp' 'wl-clipboard' 'satty' 'pinta')
source=("hyprsnap::${url}/releases/download/v${pkgver}/hyprsnap")
sha256sums=('8b1253594e028c01a2ae06af4abf6b63be8196a1e3995b2c8b2d9bc0498562ff')

package() {
    install -Dm755 "$srcdir/hyprsnap" "$pkgdir/usr/bin/hyprsnap"
}
