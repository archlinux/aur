# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
install=dmarc-report-viewer-bin.install
source=("${url}/releases/download/${pkgver}/linux-${CARCH}.zip"
        'LICENSE')
sha256sums=('95aa3f576db39e06efec87dcee8212d5bd7c8c977c63aab3f1656ec6e1dc67bf'
            'd535da0d08dad6a00ce7a905f72aa497682409916005dea60e940ae454138d66')
b2sums=('82f67b4a29538b34d367caf7a5ced9e78689465eb591aae30402e6962da89a9ea92100b70de8ddf6b15924436e8a0ca79f655d9a59dc2181d0d06d4aecdf3fb0'
        '6ce77c7aa5aa6136c651ce6256de2c18ef66fa00e55f8347857787e3f3fb8430b18a0ced8f1a78fe141e48f05669fa9ce326e62c8cf241818ac6e7765c73658d')

package() {
    install -Dm755 "${srcdir}/linux-${CARCH}/dmarc-report-viewer" "${pkgdir}/usr/bin/dmarc-report-viewer"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
