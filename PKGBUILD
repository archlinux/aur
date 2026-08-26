pkgname=gpk-bin
pkgver=0.6.8
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.8/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.8/gpk-linux-arm64")
sha256sums_x86_64=("1c5007c342dcd2851943ca73810d6b40ebef08579d89f3ae0c0d80f24047ce4f")
sha256sums_aarch64=("f57061f97059e7d918f2f2b4e5eef88cad5794c5387b5793c16929074a0ca136")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
