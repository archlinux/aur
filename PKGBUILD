# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>

pkgname=keepass-readable-passphrase-generator
pkgver=1.4.0
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical."
url="https://github.com/ligos/readablepassphrasegenerator"
license=('Apache')
depends=('keepass')
arch=(any)
source=("https://github.com/ligos/readablepassphrasegenerator/releases/download/release-${pkgver}/ReadablePassphrase.${pkgver}.plgx")
sha256sums=('bb41df6cc155df735608c04edc2364e2d10c2126e6294645536e4a218bfb5c06')

package() {
    install -Dm644 "${srcdir}/ReadablePassphrase.${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/ReadablePassphrase.plgx"
}
