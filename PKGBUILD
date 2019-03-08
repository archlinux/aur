# Contributor: Crotok <crotok [at] mailbox [dot] org>
# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_pkgbase=shub
pkgname=shub-bin
pkgver=2.8.2
pkgrel=1
pkgdesc="Scrapinghub Command Line Client"
arch=("x86_64")
conflicts=("${_pkgbase}")
url="https://github.com/scrapinghub/shub/"
license=("BSD")
provides=("shub=${pkgver}")

source=("https://github.com/scrapinghub/shub/releases/download/v${pkgver}/shub-v${pkgver}-linux-x64.tar.gz"
        "https://raw.githubusercontent.com/scrapinghub/shub/master/LICENSE")
sha256sums=('823fff8e3409c77628a44acca779b4c1c2e27121d38a99961ff096e765f33e6e'
            '49ea6190a7f081686a8c71faba2f915c9dbdbee99572e7b26612f30098a130a1')

package() {
    install -Dm755 "${srcdir}/shub" "${pkgdir}/usr/bin/shub"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
