pkgname=gpk-bin
pkgver=0.3.30
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.30/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.30/gpk-linux-arm64")
sha256sums_x86_64=("d26913d9a29ee2e439e2d1f2146c01c6f63ed426c30f2708d7bb119f713484d6")
sha256sums_aarch64=("3f53bb52f33b97c8b77b3e0ea48854a3250897c020dd3486737195046eaef37c")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
