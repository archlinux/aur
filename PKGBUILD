# Maintainer: Konstantin Kushnir <chpock@gmail.com>

pkgname=hyprsnap
pkgver=0.0.10
pkgrel=1
pkgdesc="A feature-rich Wayland screenshot utility for Linux/Hyprland. Uses slurp, grim, and rofi to capture regions, windows, or full screens with an interactive UI."
arch=('any')
url="https://github.com/chpock/hyprsnap"
license=('GPL-3.0-or-later')
depends=('jq' 'hyprland' 'rofi' 'imagemagick' 'coreutils' 'hyprpicker' 'grim' 'slurp' 'wl-clipboard' 'satty' 'pinta')
source=("hyprsnap::${url}/releases/download/v${pkgver}/hyprsnap")
sha256sums=('a3f09ca63244fe72ace4e191da624f67cc606a3468932a009d5987431a03312d')

package() {
    install -Dm755 "$srcdir/hyprsnap" "$pkgdir/usr/bin/hyprsnap"
}
