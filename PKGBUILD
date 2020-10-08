# Maintainer: Radoslaw Mejer <radmen@radmen.info>

pkgname=rabtap-bin
pkgver=1.24
pkgrel=1
pkgdesc="RabbitMQ wire tap and swiss army knife"
arch=(x86_64)
url="https://github.com/jandelgado/rabtap"
license=(GPL3)
depends=()
conflicts=(rabtap)
source_x86_64=("https://github.com/jandelgado/rabtap/releases/download/v${pkgver}/rabtap-v${pkgver}-linux-amd64.zip")
sha256sums_x86_64=('61fd0333b00f0122263861292eef7ecfb63adbf412afaca80b09275a3bc123df')

package() {
  install -Dm655 ${srcdir}/bin/rabtap-linux-amd64 ${pkgdir}/usr/bin/rabtap
}
