# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
install=dmarc-report-viewer-bin.install
source=("${url}/releases/download/${pkgver}/linux-${CARCH}.zip"
        'LICENSE')
sha256sums=('268817bcb12ec4af5305e82e66d22ff5d22efa3cb4b150ed513b2d6ecd42c7be'
            'd535da0d08dad6a00ce7a905f72aa497682409916005dea60e940ae454138d66')
b2sums=('45b5192ec079109b3045d22d50515f0e8c8efae86d90cda10ecc0ed382166d7b211798c3ef324078b0be12bf00a21ccb9033dff097ebdaec65bb6a9e9eb7fca9'
        '6ce77c7aa5aa6136c651ce6256de2c18ef66fa00e55f8347857787e3f3fb8430b18a0ced8f1a78fe141e48f05669fa9ce326e62c8cf241818ac6e7765c73658d')

package() {
    install -Dm755 "${srcdir}/linux-${CARCH}/dmarc-report-viewer" "${pkgdir}/usr/bin/dmarc-report-viewer"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
