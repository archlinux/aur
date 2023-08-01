# Maintainer: ramen <hendrikschick@hndrkk.sh>
# Contributor: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
# Contributor: Crotok <crotok [at] mailbox [dot] org>

_pkgbase=shub
pkgname=shub-bin
pkgver=2.14.5
pkgrel=1
pkgdesc="Scrapinghub Command Line Client"
arch=("x86_64")
conflicts=("${_pkgbase}")
url="https://github.com/scrapinghub/shub/"
license=("BSD")
provides=("shub=${pkgver}")

source=("https://github.com/scrapinghub/shub/releases/download/v2.14.5/shub-Linux.tar.gz"
        "https://raw.githubusercontent.com/scrapinghub/shub/master/LICENSE")
sha256sums=('6858c22a2b8750f6392ff24a7b484b4da318ebba41cc28eb260ad5be1aab771c'
            '49ea6190a7f081686a8c71faba2f915c9dbdbee99572e7b26612f30098a130a1')

package() {
    install -Dm755 "${srcdir}/dist_bin/shub" "${pkgdir}/usr/bin/shub"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
