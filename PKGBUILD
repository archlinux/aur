pkgname=gpk-bin
pkgver=0.3.21
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.21/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.21/gpk-linux-arm64")
sha256sums_x86_64=("051403ffd34a2c83da646d2328ff99ef87933a35a2bc17d79d9683e3d569e6b8")
sha256sums_aarch64=("07e1c7bc55e22d9eceaf4755bce9ac14b9410b8f958e5e26963afaf4d5ff166f")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
