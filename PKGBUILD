# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.1.5
pkgrel=1
pkgdesc='A font derived from a customized version of Iosevka'
arch=('any')
url='https://github.com/aaronmbos/monocode'
license=('OFL-1.1')
source=("${_name}-${pkgver}-bolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalbolditalic.ttf"
        "${_name}-${pkgver}-boldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalboldupright.ttf"
        "${_name}-${pkgver}-lightitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normallightitalic.ttf"
        "${_name}-${pkgver}-lightupright.ttf::${url}/releases/download/v${pkgver}/monocode-normallightupright.ttf"
        "${_name}-${pkgver}-mediumitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumitalic.ttf"
        "${_name}-${pkgver}-mediumupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumupright.ttf"
        "${_name}-${pkgver}-regularitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularitalic.ttf"
        "${_name}-${pkgver}-regularupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularupright.ttf"
        "${_name}-${pkgver}-semibolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemibolditalic.ttf"
        "${_name}-${pkgver}-semiboldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemiboldupright.ttf"
        "${_name}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('7757b0b9712776354a82c2b3865cea675bc8becb0b82c5200f835de74af027b7'
            'd0ff572d5148d4ac76f66f611a365853ead0fa4c352b932ecc0e5e53da54d216'
            '272a2d535b63f8154cf5ae3f0dcabf1330326d0512dfb65d04475e31ba12b2ae'
            '9d40e7bc9f00fcedab6c551aaf6e2c09bfa98022edf245da9e5abfd5af6cf248'
            '41b086f5268e986cecf08d782610309795de5d52bf1173273ee79881acdfd884'
            'ba7db01835d82184f46acfe28a838cc375170820368017b46c932b7d69915fb0'
            'de7cedb16277d26715c7b02a032d838773d7df99c1c424fa092a4f363271d81e'
            '967497d046cb2298ce86b2c04dfc901f31339c9cc1874eb768f4d01dd692e865'
            '771ecb90c1f9ff11e40b298e15697459af6174205df74d55938b3e64a18f83ea'
            '0a773b8a91f840226eb43041e5742d8cbc24b677840bc66a078849bbf8e97b08'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
