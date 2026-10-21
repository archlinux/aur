# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.6.2
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
install=dmarc-report-viewer-bin.install
source=("${url}/releases/download/${pkgver}/linux-${CARCH}.zip"
        'LICENSE')
sha256sums=('0b34cc9bd8c1737a07ebb545a9141999a8532e961b9b64e9048f71ec2c883bc5'
            'd535da0d08dad6a00ce7a905f72aa497682409916005dea60e940ae454138d66')
b2sums=('7223563e464c04d68eb93dd02761c20b44f9bba7dc4f5700d7b5e7ba28a015fb9805096ec2d71003fcc92a202bd962fe403c4260dc6a2dbec83c0305adb2f8e9'
        '6ce77c7aa5aa6136c651ce6256de2c18ef66fa00e55f8347857787e3f3fb8430b18a0ced8f1a78fe141e48f05669fa9ce326e62c8cf241818ac6e7765c73658d')

package() {
    install -Dm755 "${srcdir}/linux-${CARCH}/dmarc-report-viewer" "${pkgdir}/usr/bin/dmarc-report-viewer"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
