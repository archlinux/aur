pkgname=censawayapp-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Censaway VPN Client"
arch=('x86_64')
url="https://github.com/Censaway/CensawayApp"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator') 
provides=('censaway')
source=("${pkgname}-${pkgver}::https://github.com/Censaway/CensawayApp/releases/download/v${pkgver}/Censaway_v${pkgver}_linux_amd64")
sha256sums=('b9f4dcf839e873332ba7e53ae8fc72166689fc2eed7085f83d695a0402fc584a')
options=('!strip' '!debug')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/censawayapp"
}
