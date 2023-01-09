# Maintainer: abs3nt <abs3nt@asdf.cafe>
pkgname="gospt"
pkgver=0.0.1
pkgrel=1
epoch=1
pkgdesc="Spotify TUI and CLI written in Go"
arch=("x86_64" "amd64")
url="https://gitea.asdf.cafe/abs3nt/gospt"
license=('GPL')
depends=()
source=(
  "https://gitea.asdf.cafe/abs3nt/gospt/releases/download/v${pkgver}/gospt"
)
package() {
	install -Dm755 gospt "${pkgdir}"/usr/bin/gospt
}
sha256sums=('86edafaed5464860306ca255defad9390c30222ccf030ee06bf080cefe2d7e68')
