pkgname=gpk-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.1/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.1/gpk-linux-arm64")
sha256sums_x86_64=("8e7ed0f25d91a1b452fae6b58365267a8c5313587c1f2bc376e79cd155c5c2ee")
sha256sums_aarch64=("0fda910e3867d8c0d2825009e4d37e9e8256e12c0522b234550fbfb9504f70e2")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
