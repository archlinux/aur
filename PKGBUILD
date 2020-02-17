# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>

pkgname=keepass-readable-passphrase-generator
pkgver=1.2.0
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical."
url="https://github.com/ligos/readablepassphrasegenerator"
license=('Apache')
depends=('keepass')
arch=(any)
source=("https://github.com/ligos/readablepassphrasegenerator/releases/download/release-${pkgver}/ReadablePassphrase.${pkgver}.plgx")
sha256sums=('F3EFABE676C7F12CE4115B5BA450D1AA272298F2F6469423A5E59EB43DA2C2B2')

package() {
    install -Dm644 "${srcdir}/ReadablePassphrase.${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/ReadablePassphrase.plgx"
}
