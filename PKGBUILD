# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=mhrv-rs
pkgname=mhrv-rs-bin
pkgver=1.9.36
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

sha256sums_aarch64=('0e76d0717bf95685e39014d14b236fed85d6712dde4a8d739e9bb602894ba3f1')
sha256sums_x86_64=('d76f163a4b9844f80791f7efe69d3b0c94deb20588442d724507134e6841198c')

package() {
    install -Dm755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
