pkgname=gpk-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.5/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.5/gpk-linux-arm64")
sha256sums_x86_64=("dcf989dcf66e3df3b22b54f4b1399afc7221b3a36c1277f285c3708572c98dbd")
sha256sums_aarch64=("8e285c6699d78f2e6ad43545d82e3f0245d9a7a3618443f52655eba478d2221a")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
