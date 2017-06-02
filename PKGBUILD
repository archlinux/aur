# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=thunderbird-sogo-connector-bin
pkgver=31.0.4
pkgrel=1
pkgdesc="Thunderbird frontend for SOGo"
arch=('any')
groups=('office')
url="http://www.sogo.nu/downloads/frontends.html"
license=('GPL' 'LGPL')
depends=('thunderbird>=38')
optdepends=('thunderbird-lightning-bin')
makedepends=()
options=(!strip)
provides=(sogo-connector=${pkgver})
replaces=("sogo-connector-bin")
conflicts=("sogo-connector-bin")
source=(sogo-connector-$pkgver.xpi::http://www.sogo.nu/files/downloads/SOGo/Thunderbird/sogo-connector-${pkgver}.xpi)
sha256sums=('c9cf73ebc4f2a81cb79f64a2f7468c3c820c0f811a0ae73f8a0ec0f987a7b7d6')

package() {
  install -Dm644 "${srcdir}/sogo-connector-$pkgver.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/sogo-connector@inverse.ca.xpi"
}

