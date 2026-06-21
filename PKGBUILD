pkgname=gpk-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.0/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.0/gpk-linux-arm64")
sha256sums_x86_64=("354e83de0db78ee049212e2a6c4da567bac524e95090c59c8ef376eef103428f")
sha256sums_aarch64=("335624fa9926d72dccf3b8d0fee1c85b51a1dfc416353fc42bf6c3b6eebacf81")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
