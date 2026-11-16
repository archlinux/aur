# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.7.2
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
install=dmarc-report-viewer-bin.install
source=("${url}/releases/download/${pkgver}/linux-${CARCH}.zip"
        'LICENSE')
sha256sums=('ec777396ed3138cb67f24048914c3b469bacf08b3f4d9194415296f527ea94ed'
            'd535da0d08dad6a00ce7a905f72aa497682409916005dea60e940ae454138d66')
b2sums=('5535c328e60e1f78692448a9fbe434c26c3074ffaa75fd1b236cb659f68d13dcb641131a4c1a97c7338000d587187afa2e8d6d18ed0c89fb4f47f4190b36efbb'
        '6ce77c7aa5aa6136c651ce6256de2c18ef66fa00e55f8347857787e3f3fb8430b18a0ced8f1a78fe141e48f05669fa9ce326e62c8cf241818ac6e7765c73658d')

package() {
    install -Dm755 "${srcdir}/linux-${CARCH}/dmarc-report-viewer" "${pkgdir}/usr/bin/dmarc-report-viewer"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
