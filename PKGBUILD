# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=thunderbird-sogo-connector-bin
pkgver=31.0.5
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
sha256sums=('37788c386fe28c801ff6c53b1e58a4ff6cab3670392eed50c271becb75da8831')

package() {
  install -Dm644 "${srcdir}/sogo-connector-$pkgver.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/sogo-connector@inverse.ca.xpi"
}

