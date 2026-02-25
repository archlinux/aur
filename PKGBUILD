pkgname=censawayapp-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Censaway VPN Client"
arch=('x86_64')
url="https://github.com/Censaway/CensawayApp"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator') 
provides=('censaway')
source=("${pkgname}-${pkgver}::https://github.com/Censaway/CensawayApp/releases/download/v${pkgver}/Censaway_v${pkgver}_linux_amd64")
sha256sums=('5539e646e7761465285cb81f59192dee3586e274733c508b9d5c5b89caf3efc0')
options=('!strip' '!debug')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/censawayapp"
}
