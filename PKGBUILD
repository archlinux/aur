pkgname=gpk-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.6/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.6/gpk-linux-arm64")
sha256sums_x86_64=("ca4c539997767688dd20b0453952aa867fb064d8aea7bff95af9e067a7081e15")
sha256sums_aarch64=("724fbb854372231f8d946d9cd9b4c6352f2d1a0c527220f4b562ab06b8a390ad")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
