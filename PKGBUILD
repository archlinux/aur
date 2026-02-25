# Maintainer: PharmaRacist
pkgname=noon-hyprland-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Hyprland compositor and related tools for Noon (the git version)"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
install=noon-hyprland.install
depends=(
  'hyprland-git'
  'hyprcursor-git'
  'hypridle-git'
  'hyprlock-git'
  'hyprpicker-git'
  'hyprsunset-git'
  'hyprutils-git'
  'hyprwayland-scanner-git'
  'xdg-desktop-portal-hyprland-git'  
  'xdg-desktop-portal-gtk'           
  'hyprland-protocols-git'
  'hyprland-qt-support-git'
)
package() {
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  echo "Hyprland compositor and tools for Noon (the -git version)" >"$pkgdir/usr/share/doc/$pkgname/README"
}
