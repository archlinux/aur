# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=mhrv-rs
pkgname=mhrv-rs-bin
pkgver=1.9.31
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

sha256sums_aarch64=('b11c58cdc70e14513857dfd521f6095aff99120e4a93066eef42f7ef92eab22d')
sha256sums_x86_64=('9310270bf35ee1c1595ec54c7c41c0f24fbe80aa39aae01d6d7c985dc639017b')

package() {
    install -Dm755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
