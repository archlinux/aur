pkgname=gpk-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.4/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.4/gpk-linux-arm64")
sha256sums_x86_64=("37d2e32e8e0a3b756244b105c4d78200b7d3b5f2e71a98924f836f38c86431a4")
sha256sums_aarch64=("5193c3ca1dc5ea2e80d1b613daf21b28df74c29a3587140c361333c195ee1ba8")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
