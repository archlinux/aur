# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=openrgb-udev-rules
pkgver=0.9
pkgrel=2
pkgdesc="UDEV rules for OpenRGB Flatpak and Appimage."
url="https://openrgb.org"
license=('GPL2')
arch=('any')
install="${pkgname}.install"
source=("openrgb-$pkgver.rules::https://openrgb.org/releases/release_${pkgver}/60-openrgb.rules")
sha256sums=('b71bece9b1e979dd08554a24b7003b6d7bb6d77ea554e26135423f84c1afab38')

# Main package should already have udev rules
conflicts=('openrgb')

package() {
  # install file
  install -Dm644 "openrgb-$pkgver.rules" "$pkgdir/usr/lib/udev/rules.d/60-openrgb.rules"
}
