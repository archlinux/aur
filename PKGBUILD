pkgname=gpk-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.3/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.3/gpk-linux-arm64")
sha256sums_x86_64=("ae34487012387588f84364721814ada0b7f153d5b4ba8399e1bc82b4b3f4785d")
sha256sums_aarch64=("a504e550cd5052f12bf3aab5885459e2e4886d631a5f5c3d2218ff8650e750f4")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
