# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=mhrv-rs
pkgname=mhrv-rs-bin
pkgver=1.9.28
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

sha256sums_aarch64=('64744bcb2774c8817ed97410da2d525787de354d09239566d198deb99a30d4ec')
sha256sums_x86_64=('8be806ebccc431cf4c5b1482c3b5ce09666f37d72a7d020e706e96a083055d45')

package() {
    install -Dm755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
