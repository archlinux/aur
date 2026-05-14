pkgname=gpk-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.0/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.0/gpk-linux-arm64")
sha256sums_x86_64=("85bcdcf0217d8632fab6762935e8a986039e9e3eb3625a49e17180fb6261b915")
sha256sums_aarch64=("344a83ed8d0b2d8f7e4e33f330a775cc2ca82bbeef55ee66df4dceb7e2b0f062")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
