# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=mhrv-rs
pkgname=mhrv-rs-bin
pkgver=1.9.34
pkgrel=1
pkgdesc="Free DPI bypass via a Google Apps Script relay with TLS SNI concealment"
arch=('aarch64' 'x86_64')
url="https://github.com/therealaleph/MasterHttpRelayVPN-RUST"
license=('MIT')
conflicts=('mhrv-rs')
provides=('mhrv-rs')
options=('!debug')

source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/mhrv-rs-linux-arm64.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/mhrv-rs-linux-amd64.tar.gz")

sha256sums_aarch64=('1bc2c6c192562182e4755c92ad3826231019b5a566dd3d8ee3efb0ebf9b14cfa')
sha256sums_x86_64=('aa1cba1d4ddf15f3a9d1e7399f73ef7e03efc602e7e21e921be170d62cfc0e80')

package() {
    install -Dm755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
