# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=thunderbird-sogo-connector-bin
pkgver=31.0.2
pkgrel=1
pkgdesc="Thunderbird frontend for SOGo"
arch=('any')
groups=('office')
url="http://www.sogo.nu/downloads/frontends.html"
license=('GPL' 'LGPL')
depends=('thunderbird>=38' 'thunderbird-lightning-bin')
makedepends=()
options=(!strip)
provides=(sogo-connector=${pkgver})
replaces=("sogo-connector-bin")
conflicts=("sogo-connector-bin")
source=(sogo-connector-$pkgver.xpi::http://www.sogo.nu/files/downloads/extensions/sogo-connector-${pkgver}.xpi)
sha256sums=('551ee39c3792d5684d0cfbefe62d27b08324794ed62120811a4b8802b58f354b')

package() {
  install -Dm644 "${srcdir}/sogo-connector-$pkgver.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/sogo-connector@inverse.ca.xpi"
}

