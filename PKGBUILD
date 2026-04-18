pkgname=gpk-bin
pkgver=0.3.29
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.29/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.29/gpk-linux-arm64")
sha256sums_x86_64=("10ad3381b97b918aeda5d4dec9d9cf4f9b7707c17060a87d26d47e452bd24d68")
sha256sums_aarch64=("247735ef7d3ae440d42d50fda32a8d5c912c9742540abc2a1c9d366520e190d9")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
