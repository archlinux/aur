# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="qrcp-bin"
pkgver=0.6.1
pkgrel=1
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
url="https://github.com/claudiodangelis/qrcp"
arch=('x86_64')
license=('MIT')
provides=('qrcp')
conflicts=('qrcp-git' 'qr-filetransfer-git')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/claudiodangelis/qrcp/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('e8ea7897cd0670836af7322b2bbe673246908686b8c56b0fe1636f6a9a06e32a')

package() {
  install -Dm755 qrcp "$pkgdir/usr/bin/qrcp"
}
