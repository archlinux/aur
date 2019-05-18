# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=thunderbird-sogo-connector-bin
pkgver=60.0.2
pkgrel=1
pkgdesc="Thunderbird frontend for SOGo"
arch=('any')
groups=('office')
url="http://www.sogo.nu/downloads/frontends.html"
license=('GPL' 'LGPL')
depends=('thunderbird>=60')
optdepends=()
makedepends=()
options=(!strip)
provides=(sogo-connector=${pkgver})
replaces=("sogo-connector-bin")
conflicts=("sogo-connector-bin")
source=(sogo-connector-$pkgver.xpi::http://www.sogo.nu/files/downloads/SOGo/Thunderbird/sogo-connector-${pkgver}.xpi)
sha256sums=('733bce56e90f9f295ce944b6c707916c53d0ad102922fcb319d9b362bda7cd55')

package() {
  install -Dm644 "${srcdir}/sogo-connector-$pkgver.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/sogo-connector@inverse.ca.xpi"
}

