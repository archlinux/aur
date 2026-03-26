pkgname=gpk-bin
pkgver=0.3.13
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.13/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.13/gpk-linux-arm64")
sha256sums_x86_64=("e171e3ea668180e19faf182eb4d2db90e3429ec3a25dbb3c09de36f98ff68e95")
sha256sums_aarch64=("aaeb54ece579e0e9743fa06bc364dc21954d252b41ee8b5d6b684610a7c99c95")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
