# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=twc-rs-bin
_pkgname=twc-rs
pkgver=0.3.2
pkgrel=1
pkgdesc="Fast CLI and interactive TUI dashboard for managing Timeweb Cloud infrastructure"
arch=('x86_64')
url="https://github.com/RAprogramm/twc-rs"
license=('MIT')
provides=('twc-rs')
conflicts=('twc-rs')
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
# Replace with the real checksum per release, e.g.:
#   updpkgsums   (from pacman-contrib), or
#   sha256sum twc-rs-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz
sha256sums=('7caab658d20eb49bcd7ed4c527a65f9a271aaade474627b066642f56518c4ad2')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
