pkgname=gpk-bin
pkgver=0.3.28
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.28/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.3.28/gpk-linux-arm64")
sha256sums_x86_64=("82d7b9e794bf82022344ad496ed533b0cfc550a1cecb90574157acdcaf960d4e")
sha256sums_aarch64=("9fc493bb9bd27be24ce9fcac1c59c841b6f9ff0bf6ca022a3752b633efa175c4")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
