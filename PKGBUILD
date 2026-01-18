pkgname=censawayapp-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Censaway VPN Client"
arch=('x86_64')
url="https://github.com/Censaway/CensawayApp"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator') 
provides=('censaway')
source=("${pkgname}-${pkgver}::https://github.com/Censaway/CensawayApp/releases/download/v${pkgver}/Censaway_v${pkgver}_linux_amd64")
sha256sums=('bb7e118e39a189e3d1ebbaf8a5e91ed3a42f6d7cd068291314471fc5afed8547')
options=('!strip' '!debug')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/censawayapp"
}
