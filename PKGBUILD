# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=mhrv-rs
pkgname=mhrv-rs-bin
pkgver=1.9.18
pkgrel=1
pkgdesc="Free DPI bypass via a Google Apps Script relay with TLS SNI concealment"
arch=('aarch64' 'x86_64')
url="https://github.com/therealaleph/MasterHttpRelayVPN-RUST"
license=('MIT')
conflicts=('mhrv-rs')
provides=('mhrv-rs')

source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/mhrv-rs-linux-arm64.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/mhrv-rs-linux-amd64.tar.gz")

sha256sums_aarch64=('a8b3164d34f638925eb078ef25af87e8c7cfc70a7cc6fbf9bf42933ca702c13d')
sha256sums_x86_64=('f389e63c5b732045a6272f83197a2891693e6b3ea82780b967ba0dd01e3b6e13')

package() {
    install -Dm755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
