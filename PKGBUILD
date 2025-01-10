# Maintainer: Yakov Till <yakov.till at gmail dot com>

pkgname=tinydng-cli-bin
pkgver=0.1.1
pkgrel=1

provides=("tinydng-cli=${pkgver}")
conflicts=("tinydng-cli")
replaces=("tinydng-cli<=0.1.0")

url="https://tinydng.com"
pkgdesc="Compress DNG to save space without losing visual quality"
license=('unknown')  # No license specified by the developer

arch=('x86_64')
makedepends=('unzip')
depends=()
options=(!debug)
pkgdisplayname=tinydng-cli
source=("${pkgdisplayname}-${pkgver}-linux-x64.zip::https://dl.tinydng.com/${pkgdisplayname}-${pkgver}-linux-x64.zip")
sha256sums=('a3ca1783b91f6529eb047bd5789ffc49a4051b6c2e593a388ac5e83511427bf2')

package() {
    install -Dm755 "${srcdir}/${pkgdisplayname}" "${pkgdir}/usr/bin/${pkgdisplayname}"
}