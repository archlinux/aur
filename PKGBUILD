# Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
pkgver=0.17.0
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache 2.0')
depends=('keepass')
arch=(any)
url="http://readablepassphrase.codeplex.com/"
source=("ReadablePassphrase.plgx::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=readablepassphrase&DownloadId=1644115&FileTime=131330078235200000&Build=21050")
sha256sums=('f6746c6c08334ffbefc568ae277abf527d7eceec969fbe826e23c340e9ebfa92')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    cd "$srcdir"
    install -Dm644 ReadablePassphrase.plgx "$pkgdir/usr/share/keepass/plugins/ReadablePassPhrase.plgx"
}
