# Maintainer: Radoslaw Mejer <radmen@radmen.info>

pkgname=rabtap-bin
pkgver=1.27
pkgrel=1
pkgdesc="RabbitMQ wire tap and swiss army knife"
arch=(x86_64)
url="https://github.com/jandelgado/rabtap"
license=(GPL3)
depends=()
conflicts=(rabtap)
source_x86_64=("https://github.com/jandelgado/rabtap/releases/download/v${pkgver}/rabtap-v${pkgver}-linux-amd64.tgz")
sha256sums_x86_64=('ecbe7e504b95d564e8c7292a0ca6afd302b23c954a1fb45a8a336191ad5273a7')

package() {
  install -Dm655 ${srcdir}/bin/rabtap-linux-amd64 ${pkgdir}/usr/bin/rabtap
}
