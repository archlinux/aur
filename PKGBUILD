# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=openrgb-udev-rules
pkgver=0.8
pkgrel=1
pkgdesc="UDEV rules for OpenRGB Flatpak and Appimage."
url="https://openrgb.org"
license=('GPL2')
arch=('any')
install="${pkgname}.install"
source=("https://openrgb.org/releases/release_${pkgver}/60-openrgb.rules")
sha256sums=('66a9a83010440c751e291bf3b5f57a8604bb77a54f7d30a80a198bb46bdedc0e')

# Main package should already have udev rules
conflicts=('openrgb')

package() {
  # install file
  install -Dm644 60-openrgb.rules "$pkgdir/usr/lib/udev/rules.d/60-openrgb.rules"
}
