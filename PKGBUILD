# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=hyprsnap
pkgver=0.0.3
pkgrel=1
pkgdesc="A feature-rich Wayland screenshot utility for Linux/Hyprland. Uses slurp, grim, and rofi to capture regions, windows, or full screens with an interactive UI."
arch=('any')
url="https://github.com/chpock/hyprsnap"
license=('GPL-3.0-or-later')
depends=('jq' 'hyprland' 'rofi' 'imagemagick' 'hyprpicker' 'grim' 'slurp' 'wl-clipboard' 'satty' 'pinta')
source=("hyprsnap::${url}/releases/download/v${pkgver}/hyprsnap")
sha256sums=('9051136ec71a7fb6054889d2a2d33d53491f271ea0873090c6136f7fec4d959b')

package() {
    install -Dm755 "$srcdir/hyprsnap" "$pkgdir/usr/bin/hyprsnap"
}
