# Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
pkgver=0.15.0
pkgrel=2
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache 2.0')
depends=('keepass')
arch=(any)
url="http://readablepassphrase.codeplex.com/"
source=("ReadablePassphrase.plgx::https://readablepassphrase.codeplex.com/downloads/get/1500723")
sha256sums=('f5fbfab85e0aa935c69cd5397e44271090114210201e79ffe4b80bf8da3a5e1b')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    cd "$srcdir"
    install -Dm644 ReadablePassphrase.plgx "$pkgdir/usr/share/keepass/plugins/ReadablePassPhrase.plgx"
}
