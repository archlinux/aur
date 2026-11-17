pkgname=gpk-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.7.0/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.7.0/gpk-linux-arm64")
sha256sums_x86_64=("a700edea745900be76a3a289155dccb6a7c16fda13dcc02b262236cfc848b9d8")
sha256sums_aarch64=("6d05ace1b1f652e43ae5a807c6006043b72c0b5c6b8d27aabf1cd1dd7cf2964f")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
