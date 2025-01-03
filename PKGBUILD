# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ipv6prefixfilter-bin
_pkgname=IPv6PrefixFilter
pkgver=0.9.0
pkgrel=1
pkgdesc="A router advertisement (RA) filter compatible with Linux and Windows that filters RA attempting to set unspecified IPv6 prefixes.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/misaka19683/IPv6PrefixFilter"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'nftables'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-build.zip"
)
sha256sums=('5ef772e309f9efde8b665de0ee4e7007d8a8ddf71fb90f03817516398f29ff1e')
package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}