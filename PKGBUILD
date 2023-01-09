# Maintainer: abs3nt <abs3nt@asdf.cafe>
pkgname="gospt"
pkgver=0.0.2
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
sha256sums=('6ce6b7743cd6bcd4d6c929528cf40ba4d943b97ae1453a0114c318a6f8cde4b2')
