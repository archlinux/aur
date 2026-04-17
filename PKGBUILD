pkgname=gpk-bin
pkgver=0.3.23
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.23/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.23/gpk-linux-arm64")
sha256sums_x86_64=("df967c118dbe88fd8b6c7bb84ec33c84ec09ff320038fc2d39712172caeb7b7c")
sha256sums_aarch64=("805e5047a485fbfc2d7b7f47c7424ed850549f1ab7b60f71c8b4897b4ded2ea6")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
