# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>

pkgname=keepass-readable-passphrase-generator
pkgver=1.2.1
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical."
url="https://github.com/ligos/readablepassphrasegenerator"
license=('Apache')
depends=('keepass')
arch=(any)
source=("https://github.com/ligos/readablepassphrasegenerator/releases/download/release-${pkgver}/ReadablePassphrase.${pkgver}.plgx")
sha256sums=('d91261ae0001fd1c78775e8d4354b69bb4b33432811e8e66a4ba19eb185ac35a')

package() {
    install -Dm644 "${srcdir}/ReadablePassphrase.${pkgver}.plgx" "${pkgdir}/usr/share/keepass/Plugins/ReadablePassphrase.plgx"
}
