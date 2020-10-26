pkgname=drivedlgo-bin
_author=jaskaranSM
_gitname=drivedlgo
pkgver=1.3
pkgrel=1
pkgdesc="A Minimal Google Drive Downloader Written in Go"
arch=('x86_64')
url="https://github.com/jaskaranSM/drivedlgo"
license=('GPL3')
provides=('drivedlgo')
source=("drivedlgo_1.3_Linux_x86_64.gz::https://www.github.com/$_author/$_gitname/releases/download/$pkgver/drivedlgo_1.3_Linux_x86_64.gz")
sha256sums=('f6c987083c4f9a1f9256742ee72b2f1d90a012978c30dbf8bf3a9b015e069cf3')

package () {
    install -Dm 775 "drivedlgo_1.3_Linux_x86_64" "${pkgdir}/usr/bin/drivedlgo"
}