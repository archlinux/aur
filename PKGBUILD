# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=termscp-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='A feature rich terminal UI file transfer and explorer with support for SCP/SFTP/FTP/S3 '
arch=('x86_64')
url="https://github.com/veeso/${pkgname%-bin}"
license=('MIT')
depends=()
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz"
        "https://raw.githubusercontent.com/veeso/termscp/main/LICENSE")
sha256sums=('d8a2ba80961f57f6dba6868f51f0a36eb99ed95057b617ce8549c40078f9c1ab'
            '265fb3ccecc6ab08a7225b8e947d2e72d76b4c35330910ab5859a0d5e5e05d68')
package() {
  install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
