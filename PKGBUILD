# Maintainer: Michał Lisowski <lisu at riseup dot net>

pkgname=manjaro-hyprland-settings
pkgver="20251215"
_commit='aa2998b9a581d759f34303b01dd4c491b4acc477'
pkgrel=1
arch=('any')
url="https://github.com/lisuml/${pkgname}"
license=('GPL')
makedepends=('coreutils')
source=("https://github.com/lisuml/${pkgname}/archive/${_commit}.zip")
sha256sums=('SKIP')
pkgdesc='Manjaro Linux Hyprland settings'
conflicts=(manjaro-desktop-settings)
provides=(manjaro-desktop-settings)
install=$pkgname.install

package() {
  install -d "$pkgdir"/etc
  cp -rf "$srcdir"/$pkgname-$_commit/etc "$pkgdir"
  install -d "$pkgdir"/usr
  cp -rf "$srcdir"/$pkgname-$_commit/usr "$pkgdir"

  depends=(
    'beautyline'
    'brightnessctl'
    'cliphist'
    'emote'
    'foot'
    'grim'
    'hypridle'
    'hyprland'
    'hyprlock'
    'jq'
    'kanshi'
    'kvantum'
    'kvantum-qt5'
    'mako'
    'nwg-drawer'
    'nwg-launchers'
    'nwg-look'
    'pamixer'
    'qt5ct'
    'slurp'
    'swappy'
    'ttf-fantasque-sans-mono'
    'ttf-fira-code'
    'ttf-fira-sans'
    'ttf-firacode-nerd'
    'ttf-jetbrains-mono'
    'ttf-nerd-fonts-symbols-common'
    'ttf-nerd-fonts-symbols-mono'
    'ttf-opensans'
    'ttf-ubuntu-font-family'
    'uwsm'
    'waybar'
    'waybar-module-pacman-updates-git'
    'wl-clipboard'
    'wofi'
    'wpaperd'
    'xdg-desktop-portal-hyprland'
    'yad'
  )
}
