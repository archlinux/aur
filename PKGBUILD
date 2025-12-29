# Maintainer: PharmaRacist
pkgname=noon-hyprland
pkgver=2.0.0
pkgrel=1
pkgdesc="Hyprland compositor and related tools for Noon"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'hyprland'
    'hyprcursor'
    'hypridle'
    'hyprlock'
    'hyprpicker'
    'hyprsunset'
    'hyprutils'
    'hyprwayland-scanner'
    'xdg-desktop-portal'
    'xdg-desktop-portal-gtk'
    'hyprland-protocols'
    'hyprland-qt-support'
    'hyprshot'
)

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "Hyprland compositor and tools for Noon" > "$pkgdir/usr/share/doc/$pkgname/README"
}
