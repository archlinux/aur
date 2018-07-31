# Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
_pluginname=ReadablePassphrase
pkgver=1.1.2
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache')
depends=('keepass')
arch=(any)
url="https://bitbucket.org/ligos/readablepassphrasegenerator"
source=("${_pluginname}-${pkgver}.plgx::https://bitbucket.org/ligos/readablepassphrasegenerator/downloads/ReadablePassphrase%20${pkgver}.plgx")
sha256sums=('815ad95971eae8629aab665aec36a0824b9e6f1214367d977085e375bfb9b8b2')

package() {
    install -Dm644 "${srcdir}/${_pluginname}-${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
