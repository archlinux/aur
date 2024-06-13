# Maintainer: Richard Mathot <richard.mathot@gmail.com>

pkgname=firefox-extension-connective-signing
pkgver=1.0.5
pkgrel=1
pkgdesc='Connective Signing Extension for Firefox'
arch=('any')
url='https://plugin.connective.eu/'
license=('unknown')
depends=('firefox')
# see https://plugin.connective.eu/download-index.json
source=("connective_signing_extension-${pkgver}.xpi::https://plugin.connective.eu/software/firefox/connective_signing_extension-${pkgver}.xpi")
noextract=("connective_signing_extension-${pkgver}.xpi")
sha512sums=('924cc008b4f3e111b7fa7fed679940a66481564494304a04e680247a948dc592223f2df8d8b1d9d55a68b28929748f1d740e5d99ff9dba159dc72139bd1d9a29')

package() {
    install -Dm644 "connective_signing_extension-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{4f643bc8-78f5-49c6-8efd-78ee30289f0b}.xpi"
}
