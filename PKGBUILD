pkgname=gpk-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.3/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.3/gpk-linux-arm64")
sha256sums_x86_64=("c8bb41fac7b347d3b3785de6884a8bb42e53ffbe29778f8ace2500a3016ab422")
sha256sums_aarch64=("86267d9a21241d0639422261b7adf5504cade73bb8f3407e9ccbd4a84d908373")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
