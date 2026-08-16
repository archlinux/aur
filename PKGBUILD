pkgname=gpk-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.3/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.3/gpk-linux-arm64")
sha256sums_x86_64=("19c4dbc7999562873fba67110fe7ca64c53479b057bf270dfc4ed70f7fdd72cf")
sha256sums_aarch64=("3a3892a9e8b0b933f829a66e614cd906c5b5d4ff8b137af23d7d1137c22a0d48")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
