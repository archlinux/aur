pkgname=drivedlgo-bin
_author=jaskaranSM
_gitname=drivedlgo
pkgver=1.3.3
pkgrel=1
pkgdesc="A Minimal Google Drive Downloader Written in Go"
arch=('x86_64')
url="https://github.com/jaskaranSM/drivedlgo"
license=('GPL3')
provides=('drivedlgo')
source=("drivedlgo_1.3.3_Linux_x86_64.gz::https://www.github.com/$_author/$_gitname/releases/download/$pkgver/drivedlgo_1.3.3_Linux_x86_64.gz")
sha256sums=('39f5b9707eb21ba3e024b65766bce2de0bd1bd7010ece58f2887ab9f49762ddf')

package () {
    install -Dm 775 "drivedlgo_1.3.3_Linux_x86_64" "${pkgdir}/usr/bin/drivedlgo"
}