pkgname=moonveil
pkgver=1.0.5
pkgrel=1
pkgdesc="Moonveil Hyprland dotfiles"
arch=('any')
url="https://github.com/notcandy001/Moonveil"
license=('MIT')

depends=(
  git 	
  hyprland
  waybar
  rofi
  hyprlock
  wlogout
  swaync
  matugen-bin
  grim
  nautilus
  pavucontrol
  wl-clipboard
  lxappearance
  adw-gtk-theme
  zsh
  otf-geist-mono-nerd
  otf-codenewroman-nerd
  ttf-jetbrains-mono-nerd
  noto-fonts
  noto-fonts-emoji
  noto-fonts-cjk
)

optdepends=(
  "eza: modern ls replacement"
  "bibata-cursor-theme: modern cursor theme"
)


source=("https://github.com/notcandy001/Moonveil/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/moonveil"

  cp -r Moonveil-${pkgver}/dotfiles \
    "$pkgdir/usr/share/moonveil/"

  install -Dm755 Moonveil-${pkgver}/moonveil-setup \
    "$pkgdir/usr/bin/moonveil-setup"
}

