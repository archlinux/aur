# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Nils Grunwald <nils@grunwald.fr>

pkgname=jet-bin
pkgver=0.5.25
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

sha256sums_x86_64=('924ad772188bd7412f4e5bdd99eb8a48db5055056c695d47fe43c7a9c2cbd03b')
sha256sums_aarch64=('073a0439aac62055ae1ec0129fc8611374a7c2aecb6a29beb2c0346cbb6aae19')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
