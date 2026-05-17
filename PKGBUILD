# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=hyprsnap
pkgver=0.0.9
pkgrel=1
pkgdesc="A feature-rich Wayland screenshot utility for Linux/Hyprland. Uses slurp, grim, and rofi to capture regions, windows, or full screens with an interactive UI."
arch=('any')
url="https://github.com/chpock/hyprsnap"
license=('GPL-3.0-or-later')
depends=('jq' 'hyprland' 'rofi' 'imagemagick' 'coreutils' 'hyprpicker' 'grim' 'slurp' 'wl-clipboard' 'satty' 'pinta')
source=("hyprsnap::${url}/releases/download/v${pkgver}/hyprsnap")
sha256sums=('cafb1d40787d0402b1f181b05ae84ac8d4f534aa4a3e744ff798452566066816')

package() {
    install -Dm755 "$srcdir/hyprsnap" "$pkgdir/usr/bin/hyprsnap"
}
