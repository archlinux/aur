# Maintainer: ramen <hendrikschick@hndrkk.sh>
# Contributor: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
# Contributor: Crotok <crotok [at] mailbox [dot] org>

_pkgbase=shub
pkgname=shub-bin
pkgver=2.15.2
pkgrel=1
pkgdesc="Scrapinghub Command Line Client"
arch=("x86_64")
conflicts=("${_pkgbase}")
url="https://github.com/scrapinghub/shub/"
license=("BSD")
provides=("shub=${pkgver}")

source=("https://github.com/scrapinghub/shub/releases/download/v2.15.2/shub-Linux.tar.gz"
        "https://raw.githubusercontent.com/scrapinghub/shub/master/LICENSE")
sha256sums=('5e5105a5e4d599f11726dc5e2a9e6e83a7e922303b58896d15e7e8efccff6637'
            '49ea6190a7f081686a8c71faba2f915c9dbdbee99572e7b26612f30098a130a1')

package() {
    install -Dm755 "${srcdir}/dist_bin/shub" "${pkgdir}/usr/bin/shub"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
