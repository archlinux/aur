# Maintainer: Ryan Wilson <ryan@ryanwilson.io>
pkgname=fafind-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast parallel filesystem search by filename"
arch=('x86_64' 'aarch64')
url="https://github.com/rywils/fafind"
license=('MIT')
provides=('fafind')
conflicts=('fafind')
_url="https://github.com/rywils/fafind/releases/download/v${pkgver}"
source_x86_64=("fafind-x86_64-${pkgver}.tar.gz::${_url}/fafind-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("fafind-arm64-${pkgver}.tar.gz::${_url}/fafind-linux-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('215c2df984c5744e4331dbc5f96323a970d3cea27852126530702a576b085b21')
sha256sums_aarch64=('1bc1a1870f54c25f4e02a65414405cd805cd2dc0f3ca7d4a6d1f77fbd80a264b')

package() {
    install -Dm755 fafind "${pkgdir}/usr/bin/fafind"
}