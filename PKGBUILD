# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>

pkgname=keepass-readable-passphrase-generator
pkgver=1.5.1
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical."
url="https://github.com/ligos/readablepassphrasegenerator"
license=('Apache')
depends=('keepass')
arch=(any)
source=("https://github.com/ligos/readablepassphrasegenerator/releases/download/release-${pkgver}/ReadablePassphrase.${pkgver}.plgx")
sha256sums=('97ef3af8c6da04ae285bc5133bc423496d9764aeb4b1cc3b2554c0808ef5d230')

package() {
    install -Dm644 "${srcdir}/ReadablePassphrase.${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/ReadablePassphrase.plgx"
}
