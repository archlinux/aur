# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="qrcp-bin"
pkgver=0.7.0
pkgrel=2
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
url="https://github.com/claudiodangelis/qrcp"
arch=('x86_64' 'i386')
license=('MIT')
provides=('qrcp')
conflicts=('qrcp-git' 'qr-filetransfer-git' 'qrcp')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_x86_64.tar.gz")
source_i386=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_i386.tar.gz")
sha256sums_x86_64=('165c90c224ae5e311d2c1b9393e00bd2e2eaf92f6247fb2f2ecaa57d1f51801e')
sha256sums_i386=('7357284cd89023f4d9b5d7f49c5a973dcdafb200ba5ac5873c5d51093527bf44')

package() {
  install -Dm755 qrcp "$pkgdir/usr/bin/qrcp"
}
