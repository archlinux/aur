# Maintainer: Froggo <froggo8311@proton.me>

pkgname=mist-de
pkgver=1.0.0
pkgrel=1
pkgdesc='A desktop environment with focus on convergence, privacy, and usability'
arch=('any')
url='https://codeberg.org/rehuman/mistrunner'
license=('MIT')
depends=(hyprland swww-git pypy3 eww-wayland-git swaync pipewire pipewire-pulse wireplumber playerctl git brightnessctl)
source=('git+https://codeberg.org/rehuman/mistrunner')
sha256sums=('SKIP')

package() {
  cd "$srcdir/"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/mistrunner/src/mist" "$pkgdir/usr/bin/"
}
