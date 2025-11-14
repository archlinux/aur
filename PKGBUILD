# Maintainer: Michał Lisowski <lisu at riseup dot net>

pkgname=manjaro-hyprland-settings
pkgver="20251115"
_commit='1d4b4b737d7028e7288b875ad34b36d09f38a713'
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
    'cliphist'
    'emote'
    'foot'
    'grim'
    'hypridle'
    'hyprland'
    'hyprlock'
    'jq'
    'kvantum'
    'kvantum-qt5'
    'mako'
    'nwg-drawer'
    'nwg-launchers'
    'nwg-look'
    'pamixer'
    'plasma5-themes-sweet-full-git'
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
  )
}
