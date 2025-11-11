# Maintainer: Michał Lisowski <lisu at riseup dot net>

pkgname=manjaro-hyprland-settings
pkgver="0.1.0"
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

  depends=('beautyline'
    #'sddm-theme-sweet-git'
    'waybar'
    'hyprland'
    'kvantum-qt5'
    'kvantum'
    'ttf-fira-code'
    'ttf-firacode-nerd'
    'qt5ct'
    'plasma5-themes-sweet-full-git')
}
