# Maintainer: Yakov Till <yakov.till at gmail dot com>

pkgname=tinydng-cli
pkgver=0.1.0
pkgrel=1

url="https://tinydng.com"
pkgdesc="Compress DNG to save space without losing visual quality"
license=('unknown')  # No license specified by the developer

arch=('x86_64')
makedepends=('unzip')
depends=()
source=("${pkgname}-${pkgver}-linux-x64.zip::https://dl.tinydng.com/${pkgname}-${pkgver}-linux-x64.zip")
sha256sums=('8c768c9cb1709f47bdd2c83ca2e5c4ccfd89eaa78d12f610fd8d65cd08fb26d8')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}