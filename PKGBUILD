# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-i-ming-fonts
pkgver=8.00
pkgdesc="I.Ming ( I.明體 / 一点明朝体 / 一點明體 )"
pkgrel=2
arch=(any)
url='https://github.com/ichitenfont/I.Ming'
license=(custom:IPA)
depends=()
makedepends=()
source=(
    "I.Ming-${pkgver}.ttf::${url}/raw/master/${pkgver}/I.Ming-${pkgver}.ttf"
    "I.MingCP-${pkgver}.ttf::${url}/raw/master/${pkgver}/I.MingCP-${pkgver}.ttf"
    "I.MingVar-${pkgver}.ttf::${url}/raw/master/${pkgver}/I.MingVar-${pkgver}.ttf"
    "I.MingVarCP-${pkgver}.ttf::${url}/raw/master/${pkgver}/I.MingVarCP-${pkgver}.ttf"
    "PMingI.U-${pkgver}.ttf::${url}/raw/master/${pkgver}/PMingI.U-${pkgver}.ttf"
    "PMingI.UVar-${pkgver}.ttf::${url}/raw/master/${pkgver}/PMingI.UVar-${pkgver}.ttf"
    "LICENSE.md::${url}/raw/master/LICENSE.md"
)
sha256sums=('eb7e39eb6f4e74acfa9539c3dd58eda7a0f3b18cb4a2368bd276971abb5d66fc'
            '23eb45cdf0ac71c8c57462c4ea2a99efc8de1fb81273064dbe0873a628b4e150'
            '7d2120c61fcb5defb0e816cba7574bc0a9fcea2c19ecaf5d3febe3dd8ddf5076'
            '8d95346811e36c8f629bdd4c1f0f78684b6cbb394acedb8d0b551d737458e054'
            '57c8c6c20a7adb5aee01b35ef21f50a9255d43f6d8316fdc3f8792b09bd86b0c'
            '5f35c4c97eb276f3468743d3b782dba1f85e4c712906d2363c63dd8de2431fab'
            '5ddbaf00dbc1888b25c5964d5f033ea32c8e53fac90efc089c5316190b776b32')
package() {
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}