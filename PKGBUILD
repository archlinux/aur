# Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
pkgver=0.15.0
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache 2.0')
depends=('keepass')
arch=(any)
url="http://readablepassphrase.codeplex.com/"
source=("ReadablePassphrase.plgx::https://readablepassphrase.codeplex.com/downloads/get/1500723")
sha256sums=('96e650ad6b752fc3f36c2b60ac3d88194c26c4f0448c56ce06d623c9c3569913')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    cd "$srcdir"
    install -Dm644 ReadablePassphrase.plgx "$pkgdir/usr/share/keepass/plugins/ReadablePassPhrase.plgx"
}
