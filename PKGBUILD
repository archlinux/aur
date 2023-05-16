# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=termscp-bin
pkgver=0.12.0
pkgrel=2
pkgdesc='A feature rich terminal UI file transfer and explorer with support for SCP/SFTP/FTP/S3 '
arch=('x86_64')
url="https://github.com/veeso/${pkgname%-bin}"
license=('MIT')
depends=(smbclient)
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz"
	"https://raw.githubusercontent.com/veeso/termscp/main/LICENSE")
sha256sums=('36982c920d108249c1843971b6a3663a57de7d95a9d7c0db227bd768e2c49995'
            'c66100d7a3296a222483de266bd548754b44a416d0b0a3495f7bc78a3f4f58cc')
package() {
	install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
