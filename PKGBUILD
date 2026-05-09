pkgname=gpk-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.2/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.2/gpk-linux-arm64")
sha256sums_x86_64=("a504f017d5aa2f7f187be52a422588fc3425893daf97899b7a64aa1808486997")
sha256sums_aarch64=("b9fccca5e8936501a1bae16d1e43f3ea56d9a6941a32bcd89d5cb98a1bd68267")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
