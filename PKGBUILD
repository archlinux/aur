pkgname=gpk-bin
pkgver=0.3.31
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.31/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.31/gpk-linux-arm64")
sha256sums_x86_64=("ae91c3ace031e4585eb67033fb977335dce61d6dec1d8cd8468af86ab9704348")
sha256sums_aarch64=("5f9c81e26aa3247a21f0f43dbad3f02140f9a10464e4b638aad33477fa451cb4")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
