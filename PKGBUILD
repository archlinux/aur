# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=thunderbird-sogo-connector-bin
pkgver=31.0.6
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
sha256sums=('59764bc4017ff9463b164a080f014c20b4be6a2a4b06801402a2982fcfe8ede7')

package() {
  install -Dm644 "${srcdir}/sogo-connector-$pkgver.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/sogo-connector@inverse.ca.xpi"
}

