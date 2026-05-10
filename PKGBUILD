pkgname=gpk-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.6/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.4.6/gpk-linux-arm64")
sha256sums_x86_64=("bca08e0c1a860be6ca18204501b1c9d33b819ef8c147e49a380b15c2bbea67ee")
sha256sums_aarch64=("9c5d107926c36965ee0fb7e5b37f6c30c8a34efa55e892270779fb75f5c2000b")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
