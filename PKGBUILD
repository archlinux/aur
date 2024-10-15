# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>

pkgname=keepass-readable-passphrase-generator
pkgver=1.4.2
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical."
url="https://github.com/ligos/readablepassphrasegenerator"
license=('Apache')
depends=('keepass')
arch=(any)
source=("https://github.com/ligos/readablepassphrasegenerator/releases/download/release-${pkgver}/ReadablePassphrase.${pkgver}.plgx")
sha256sums=('b386c55dca2c57172a31bc90fb1bd85ec961676411ed74a4bd74db47be923274')

package() {
    install -Dm644 "${srcdir}/ReadablePassphrase.${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/ReadablePassphrase.plgx"
}
