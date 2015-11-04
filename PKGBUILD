# Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>
pkgname=keepass-readable-passphrase-generator
pkgver=0.15.0
pkgrel=2
pkgdesc="The Readable Passphrase Generator generates passphrases which are (mostly) grammatically correct but nonsensical. These are easy to remember (for humans) but difficult to guess (for humans and computers)."
license=('Apache 2.0')
depends=('keepass')
arch=(any)
url="http://readablepassphrase.codeplex.com/"
source=("ReadablePassphrase.plgx::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=readablepassphrase&DownloadId=1500723&FileTime=130899836329970000&Build=21031")
sha256sums=('40a33ccf2074f0d5ac1e9bebba2853b1feb50fa522d95621d031e3ff8f5b337b')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    cd "$srcdir"
    install -Dm644 ReadablePassphrase.plgx "$pkgdir/usr/share/keepass/plugins/ReadablePassPhrase.plgx"
}
