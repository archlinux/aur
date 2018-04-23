# Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
_pluginname=ReadablePassphrase
pkgver=1.1.1
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache')
depends=('keepass')
arch=(any)
url="https://bitbucket.org/ligos/readablepassphrasegenerator"
source=("ReadablePassphrase.plgx::https://bitbucket.org/ligos/readablepassphrasegenerator/downloads/ReadablePassphrase%20${pkgver}.plgx")
sha256sums=('34d634250b38ba6fb9f9537e41d2ba8ee668d10b4ce3fcae2ec36d68bd68f701')

package() {
    install -Dm644 "${srcdir}/${_pluginname}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
