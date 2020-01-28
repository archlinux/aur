# Maintainer: Radoslaw Mejer <radmen@radmen.info>

pkgname=rabtap-bin
pkgver=1.22
pkgrel=1
pkgdesc="RabbitMQ wire tap and swiss army knife"
arch=(x86_64)
url="https://github.com/jandelgado/rabtap"
license=(GPL3)
depends=()
conflicts=(rabtap)
source_x86_64=("https://github.com/jandelgado/rabtap/releases/download/v${pkgver}/rabtap-v${pkgver}-linux-amd64.zip")
sha256sums_x86_64=('66c0f3282b027cf4d23f4babecb1e4467cb3835962b801952540ec47a7454a5a')

package() {
  install -Dm655 ${srcdir}/bin/rabtap-linux-amd64 ${pkgdir}/usr/bin/rabtap
}
