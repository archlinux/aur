# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=otf-maoken-heavy-labourer
pkgver=1.001
pkgdesc="Maoken Heavy Labourer | 猫啃网扛重族"
pkgrel=1
arch=(any)
url='https://github.com/NightFurySL2001/maoken-heavy-labourer'
license=(SIL1.1)
depends=()
makedepends=()
source=(
    "${url}/releases/download/v${pkgver}/MaokenHeavyLabourer-Gothic-Regular.otf"
    "${url}/releases/download/v${pkgver}/MaokenHeavyLabourer-Ming-Regular.otf"
    "${url}/releases/download/v${pkgver}/MaokenHeavyLabourerSC-Gothic-Regular.otf"
    "${url}/releases/download/v${pkgver}/MaokenHeavyLabourerSC-Ming-Regular.otf"
)
sha256sums=('c6c4506799e89bdeb6e708d0739ea62af56ce710954793fb18c31320da4f55ab'
            '24cbb6cba4d1dbbf10c019b9ea49edf60e7684dd9093b4e858e277429985ab3f'
            '76a63996daa20e493d4bcd1c1ee8754b8a15300abe904412e30ac9c631a5e89b'
            'cc2ed989b782944d3e04ceeac4f76fa5f7e0139a24b658b63991cf041f5f5ca7')
package() {
    install -dm755 "${pkgdir}/usr/share/fonts/OTF"
    cp "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF"
}
