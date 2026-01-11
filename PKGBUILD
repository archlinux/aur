pkgname=censawayapp-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Censaway VPN Client"
arch=('x86_64')
url="https://github.com/Censaway/CensawayApp"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator') 
provides=('censaway')
conflicts=('censaway')
source=("${pkgname}-${pkgver}::https://github.com/Censaway/CensawayApp/releases/download/v${pkgver}/Censaway_v${pkgver}_linux_amd64")
sha256sums=('fa6c10cf4a00e51010a637e0adb11f2b03c235d647f83b1cd1a961389af925fc')
options=('!strip' '!debug')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/censawayapp"
}
