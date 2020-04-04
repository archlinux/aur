# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=home-assistant-midnight-theme-git
pkgver=r15.6681367
pkgrel=1
pkgdesc="Midnight theme for Home Assistant"
url="https://github.com/home-assistant-community-themes/midnight"
arch=("any")
source=("git+https://github.com/home-assistant-community-themes/midnight.git")
sha256sums=("SKIP")

pkgver() {
  cd midnight
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 midnight/themes/midnight.yaml "$pkgdir/var/lib/hass/themes/midnight.yaml"
}
