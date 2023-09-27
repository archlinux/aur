pkgname=thunderbird-sogo-connector-bin
pkgver=78.0.1
pkgrel=1
pkgdesc="Thunderbird frontend for SOGo"
arch=('any')
groups=('office')
url="http://www.sogo.nu/downloads/frontends.html"
license=('GPL' 'LGPL')
depends=('thunderbird>=60')
options=(!strip)
provides=(sogo-connector=${pkgver})
replaces=("sogo-connector-bin")
conflicts=("sogo-connector-bin")
source=(sogo-connector-$pkgver.xpi::https://packages.sogo.nu/thunderbird/sogo-connector-${pkgver}-demo.xpi)
sha256sums=('590fed666d24649e52e8a3cbe8c04d9c069cc6fd204b2bf60054e6b872f1713f')

package() {
    install -Dm644 "${srcdir}/sogo-connector-$pkgver.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/sogo-connector@inverse.ca.xpi"
}

