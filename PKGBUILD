# Maintainer: Ismoiljon Umarov <hs.umarov21@gmail.com>
pkgname=softswitch
pkgver=1.1.0
pkgrel=3
pkgdesc="A simple command-line PHP version switcher for Arch Linux."
arch=('any')
url="https://github.com/umaarov/softswitch"
license=('MIT')
depends=('bash')
install="${pkgname}.install"

source=("https://github.com/umaarov/softswitch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ff64355f79971eec8639c70d304b2ca07cec28ea4f27a34b81ce2625f163d67')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "softswitch" "${pkgdir}/usr/bin/softswitch"
}
