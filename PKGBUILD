# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Nils Grunwald <nils@grunwald.fr>

pkgname=jet-bin
pkgver=0.7.27
pkgrel=1
pkgdesc='CLI to transform between JSON, EDN and Transit, powered with a minimal query language.'
arch=('x86_64' 'aarch64')
url='https://github.com/borkdude/jet'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('411e65cbe6ea94ea6994e22723cbc73843c715e29828cb3fb8ca6c5af639a68d')
sha256sums_aarch64=('798bf30761733297f700d69e9276c4cbcea709a766399af489ba2b0faafb0fa3')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
