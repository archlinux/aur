# Maintainer: Michael Williams <fearlessgeekmedia@users.noreplay.github.com>
# Contributor: Robin Opletal <fourstepper@users.noreply.github.com>
# Contributor: Charlie Haley <charlie-haley@users.noreply.github.com>
pkgname=wifi4wofi
_pkgname=wifi4wofi
pkgver=0.5.0
pkgrel=1
pkgdesc="bash script providing WiFi menu for wofi, forked from wofi-wifi-menu"
arch=("any")
url="https://github.com/fearlessgeekmedia/wifi4wofi"
license=("MIT")
depends=("wofi" "networkmanager" "bash" "iw" "sed" "gawk")
makedepends=('git')
source=('git+https://github.com/fearlessgeekmedia/wifi4wofi')
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/wifi4wofi/wifi4wofi" "${pkgdir}/usr/bin/wifi4wofi"
  chmod +x "${pkgdir}/usr/bin/wifi4wofi"
  sudo mkdir "/usr/share/wofi/wifi.example"
  sudo cp -r "${srcdir}/wifi4wofi/config.example" "/usr/share/wofi/wifi.example"
}
