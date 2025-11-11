# Maintainer: Michał Lisowski <lisu at riseup dot net>

pkgname=manjaro-hyprland-settings
pkgver="20251111"
_commit='6e3c786ce776932d9032cb4442db6a4edf9fbe4d'
pkgrel=1
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/settings/${pkgname}"
license=('GPL')
makedepends=('coreutils')
source=("https://gitlab.com/garuda-linux/themes-and-settings/settings/garuda-hyprland-settings/-/archive/${_commit}/garuda-hyprland-settings-${_commit}.tar.gz")
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
    'foot'
    'hyprland'
    'kvantum'
    'kvantum-qt5'
    'nwg-drawer'
    'nwg-launchers'
    'nwg-look'
    'plasma5-themes-sweet-full-git'
    'qt5ct'
    'sddm-theme-sweet-git'
    'ttf-fantasque-sans-mono'
    'ttf-fira-code'
    'ttf-fira-code'
    'ttf-fira-sans'
    'ttf-firacode-nerd'
    'ttf-firacode-nerd'
    'ttf-jetbrains-mono'
    'ttf-nerd-fonts-symbols-common'
    'ttf-nerd-fonts-symbols-mono'
    'ttf-opensans'
    'waybar'
    'waybar-module-pacman-updates-git'
    'wofi'
  )
}
