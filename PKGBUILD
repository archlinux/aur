pkgname=gpk-bin
pkgver=0.3.25
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.25/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.25/gpk-linux-arm64")
sha256sums_x86_64=("a4d00097fa1cecb21c1c3f05c3ae26d5106346e8dc8404c8f20465078e7f2b30")
sha256sums_aarch64=("b1847f1fa9578da5529ff889c1412ceb4add3c0cc57964f6b911dd1c6dc5e2f2")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
