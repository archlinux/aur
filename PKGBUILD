pkgname=gpk-bin
pkgver=0.3.18
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.18/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.18/gpk-linux-arm64")
sha256sums_x86_64=("cd974adce4cd8c41f4d12402c77de99b61e6005b6c749fb3e8dc0eeebc1663d5")
sha256sums_aarch64=("cd625b57b095b9fb3e6c70dbdf77c53c63b289616b9f5cbea7ce4122c13f0899")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
