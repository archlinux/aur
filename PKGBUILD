pkgname=gpk-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.4/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.4/gpk-linux-arm64")
sha256sums_x86_64=("b2bc5cd1e2c68874994fc1ac093441852abfe0d07c91862fdbc38f9c4c8ebc2b")
sha256sums_aarch64=("37b26cdbe0d12663ec3f3814d4574b721b9cb0d8945973d1d589999ba86f5aed")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
