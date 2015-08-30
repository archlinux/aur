# Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
pkgver=0.14.1
pkgrel=1
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache 2.0')
depends=('keepass')
arch=(any)
url="http://readablepassphrase.codeplex.com/"
source=("ReadablePassphrase.plgx::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=readablepassphrase&DownloadId=923590&FileTime=130586254863830000&Build=20959")
md5sums=('41cc9ef80e5774db9f6e366f7933275d')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    cd "$srcdir"
    install -Dm644 ReadablePassphrase.plgx "$pkgdir/usr/share/keepass/plugins/ReadablePassPhrase.plgx"
}
