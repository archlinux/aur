# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=hyprsnap
pkgver=0.0.11
pkgrel=1
pkgdesc="A feature-rich Wayland screenshot utility for Linux/Hyprland. Uses slurp, grim, and rofi to capture regions, windows, or full screens with an interactive UI."
arch=('any')
url="https://github.com/chpock/hyprsnap"
license=('GPL-3.0-or-later')
depends=('jq' 'hyprland' 'rofi' 'imagemagick' 'coreutils' 'hyprpicker' 'grim' 'slurp' 'wl-clipboard' 'satty' 'pinta')
source=("hyprsnap::${url}/releases/download/v${pkgver}/hyprsnap")
sha256sums=('d4332fa68103b1cddcfef2c4f3156deb076c0ef57fc63e4c46303ccb5d11a805')

package() {
    install -Dm755 "$srcdir/hyprsnap" "$pkgdir/usr/bin/hyprsnap"
}
