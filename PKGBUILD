pkgname=gpk-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="TUI dashboard that unifies 34 package managers into one searchable view"
arch=('x86_64' 'aarch64')
url="https://github.com/neur0map/glazepkg"
license=('GPL-3.0-or-later')
depends=()
provides=('gpk')
conflicts=('gpk')
source_x86_64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.7/gpk-linux-amd64")
source_aarch64=("https://github.com/neur0map/glazepkg/releases/download/v0.6.7/gpk-linux-arm64")
sha256sums_x86_64=("fb9b2ac043fa4f32296bb2b40462fa1345f598ee671128c1dfccd666d0223c1b")
sha256sums_aarch64=("4a1bb73abb47c1e639dcc017a55d2a6d11389b279170847fdc6cec486f4a2773")
package() {
  if   [[ "$CARCH" == "x86_64"  ]]; then install -Dm755 "gpk-linux-amd64" "${pkgdir}/usr/bin/gpk"
  elif [[ "$CARCH" == "aarch64" ]]; then install -Dm755 "gpk-linux-arm64" "${pkgdir}/usr/bin/gpk"
  fi
}
