# Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
_pluginname=ReadablePassphrase
pkgver=1.1.0
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache')
depends=('keepass')
arch=(any)
url="https://bitbucket.org/ligos/readablepassphrasegenerator"
source=("ReadablePassphrase.plgx::https://bitbucket.org/ligos/readablepassphrasegenerator/downloads/ReadablePassphrase%20${pkgver}.plgx")
sha256sums=('5b41e07306a1a7d4c1776534195463206ef84afbeb5b5cb9840861b6f38a46bb')

package() {
    install -Dm644 "${srcdir}/${_pluginname}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
