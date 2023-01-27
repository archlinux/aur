# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Nils Grunwald <nils@grunwald.fr>

pkgname=jet-bin
pkgver=0.4.23
pkgrel=1
pkgdesc='CLI to transform between JSON, EDN and Transit, powered with a minimal query language.'
arch=('x86_64')
url='https://github.com/borkdude/jet'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('4399f48aaac89a04c36e0261009d163621399a708b0a70d7f94183b3fdb872a2')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
