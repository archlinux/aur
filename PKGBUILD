# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Nils Grunwald <nils@grunwald.fr>

pkgname=jet-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='CLI to transform between JSON, EDN and Transit, powered with a minimal query language.'
arch=('x86_64')
url='https://github.com/borkdude/jet'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.zip")

sha256sums_x86_64=('1b4d11cc80d7a1225508b065b1a2650c238e121b3fd7fc34755c26d619d0a059')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
