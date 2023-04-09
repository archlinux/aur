# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Nils Grunwald <nils@grunwald.fr>

pkgname=jet-bin
pkgver=0.4.24
pkgrel=2
pkgdesc='CLI to transform between JSON, EDN and Transit, powered with a minimal query language.'
arch=('x86_64' 'aarch64')
url='https://github.com/borkdude/jet'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('617f8098f705204c7b8ee158a4cdf4a8ff4eb20fb62eb99651d1a949bf0cb3f8')
sha256sums_aarch64=('9ab02b282d0619be2201c6bbe9f68deb07a66e62f82fbe88e001e89c3b74b65e')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
