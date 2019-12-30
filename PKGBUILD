# Maintainer: Radoslaw Mejer <radmen@radmen.info>

pkgname=rabtap-bin
pkgver=1.21
pkgrel=1
pkgdesc="RabbitMQ wire tap and swiss army knife"
arch=(x86_64)
url="https://github.com/jandelgado/rabtap"
license=(GPL3)
depends=()
conflicts=(rabtap)
source_x86_64=("https://github.com/jandelgado/rabtap/releases/download/v${pkgver}/rabtap-v${pkgver}-linux-amd64.zip")
sha256sums_x86_64=('cf30ad62f3c686ef5179ef6e13daa79a6fc5c4d45670a6328ea18e4c9989d53c')

package() {
  install -Dm655 ${srcdir}/bin/rabtap-linux-amd64 ${pkgdir}/usr/bin/rabtap
}
