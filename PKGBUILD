pkgname=gpk-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.2/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.2/gpk-linux-arm64")
sha256sums_x86_64=("ae1b0a7c7c1b445e5a5ee8dff9fb49a66583665e64dc24ccb5fa51a76f104e63")
sha256sums_aarch64=("109054d71819d8aa858dc27333dc8ba03b5a32499a04d715abaf7da092131afb")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
