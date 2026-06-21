pkgname=gpk-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.8/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.5.8/gpk-linux-arm64")
sha256sums_x86_64=("c379780e9b5352a0b1e59f7d391a1c2c01e09ab5257b83712b3d5aaa6acad3ba")
sha256sums_aarch64=("e31c6553dbc1db21de4e8fdd7615e194e8e2e46682b296a416f520113d8dc8b6")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
