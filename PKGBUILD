# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="qrcp-bin"
pkgver=0.4.1
pkgrel=2
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
url="https://github.com/claudiodangelis/qrcp"
arch=('x86_64')
license=('MIT')
provides=('qrcp')
conflicts=('qrcp-git' 'qr-filetransfer-git')
source_x86_64=("https://github.com/claudiodangelis/qrcp/releases/download/${pkgver}/${pkgname/-bin/}")
sha256sums_x86_64=('a113aa0bfd54ce2605826be1fb1381ec1079a17796a5fd75f6ea54e78b69ef78')

package() {
  install -Dm755 qrcp "$pkgdir/usr/bin/qrcp"
}
