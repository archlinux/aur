# Maintainer: Night423 <night423 at proton dot me>

pkgname=ttf-monocraft-nerd
pkgver=4.2.1
pkgrel=1
pkgdesc='A monospaced programming font inspired by the Minecraft typeface'
arch=(any)
url='https://github.com/IdreesInc/Monocraft'
license=('custom:OFL')

source=("${pkgname}-${pkgver}.ttc::${url}/releases/download/v${pkgver}/Monocraft-nerd-fonts-patched.ttc"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/IdreesInc/Monocraft/v${pkgver}/LICENSE")

sha256sums=('67f88ff9e7c6560f6cf60fb062fd353a72f62dc2654462950c65b63ed53d9754'
            'f69c147003e052dbc9d96c40a9f73647e72766cfda95a597b94ed827fe25acb1')

package() {
    install -Dm644 "${pkgname}-${pkgver}.ttc" "${pkgdir}/usr/share/fonts/TTF/MonocraftNerdFont.ttc"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
