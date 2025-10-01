# Maintainer: dougefresh <dchimento@gmail.com>
pkgname=carbon-cli
pkgver=0.10.0
pkgrel=1
pkgdesc="Carbon is a lightweight indexing framework on Solana. It provides a modular pipeline for sourcing data, decoding updates and processing them in order to build end-to-end indexers."
arch=('x86_64')
url="https://github.com/sevenlabs-hq/carbon"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('carbon-cli')
conflicts=()
options=('!strip')
source=("https://github.com/sevenlabs-hq/carbon/releases/download/v${pkgver}/carbon-cli-linux-amd64")
sha256sums=('0426db77418f0ca1020c9b759edca727f6dde0d7d65e5cc3e0e80f9bb7627a0a')

package() {
  install -Dm755 carbon-cli-linux-amd64 "$pkgdir/usr/bin/carbon-cli"
}
