# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-maoken-heavy-labourer
pkgver=1.001
pkgdesc="Maoken Heavy Labourer | 猫啃网扛重族"
pkgrel=2
arch=(any)
url="https://www.maoken.com/freefonts/11067.html"
_githuburl='https://github.com/NightFurySL2001/maoken-heavy-labourer'
license=(custom:SIL1.1)
depends=()
makedepends=()
source=("${_githuburl}/releases/download/v${pkgver}/MaokenHeavyLabourer-Gothic-Regular.ttf"
    "${_githuburl}/releases/download/v${pkgver}/MaokenHeavyLabourer-Ming-Regular.ttf"
    "${_githuburl}/releases/download/v${pkgver}/MaokenHeavyLabourerSC-Gothic-Regular.ttf"
    "${_githuburl}/releases/download/v${pkgver}/MaokenHeavyLabourerSC-Ming-Regular.ttf"
    "LICENSE.txt::${_githuburl}/raw/main/LICENSE.txt")
sha256sums=('89e227befec73fb5daf2c96cd39b33c40e0f9452bbaa0dcc18902a6452bc9165'
            'd1627b387f2c03d9c5ffd49b6e20613de4b845813936c318194db83a4d0f887e'
            '8f33e4003a365fc73c64b929b5b444b862982ab7f49198d34c3bdf631c2ceec8'
            'b8c98b3418f4675b925390e208d90b8d5e15922bc6063741633bef96d2244ccf'
            '9b4364250e518bb44aee5d7d0a19f9981c6c84576afc7d077e5726db0b6db479')
package() {
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}