pkgname=censawayapp-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Censaway VPN Client"
arch=('x86_64')
url="https://github.com/Censaway/CensawayApp"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator') 
provides=('censaway')
source=("${pkgname}-${pkgver}::https://github.com/Censaway/CensawayApp/releases/download/v${pkgver}/Censaway_v${pkgver}_linux_amd64")
sha256sums=('d355a601b80cd02831add7d9bc0a93ddc5c756f7f41b2f6014433da8e0b50233')
options=('!strip' '!debug')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/censawayapp"
}
