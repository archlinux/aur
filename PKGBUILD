pkgname=gpk-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.4/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.4/gpk-linux-arm64")
sha256sums_x86_64=("ffcd93b6280a8f4dd27f0122e3e5e9912e01df8fa8df97f706488f04d6875827")
sha256sums_aarch64=("6e4da0287d995ef68cd2f13f51d32fc5312ff369d4a31b97fe7c74bbd48f7199")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
