pkgname=gpk-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.2/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.2/gpk-linux-arm64")
sha256sums_x86_64=("b87a95b0abe709316fa5ddd8087516d7d89e943f3ff6817ad833c07efd7b0f30")
sha256sums_aarch64=("2f40ac2b09421b28fedf796739918addd24519c7d8f22c6b20099642a77e8dcd")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
