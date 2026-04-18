pkgname=gpk-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.0/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.0/gpk-linux-arm64")
sha256sums_x86_64=("6814dc3f85f5d82321b7450c3ef8d5f21713c8e2107165392c7dd70f6680b5ff")
sha256sums_aarch64=("df885f6f510606fd37b009bbe1421b2c535abe78695b05b47658b8eed63395ff")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
