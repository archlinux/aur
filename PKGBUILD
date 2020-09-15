# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Vinay Shastry <vinayshastry at gmail dot com>

_pkgname='wormhole-william'
pkgname="${_pkgname}-bin"
pkgver=1.0.4
pkgrel=4
pkgdesc='Securely transfer files between devices. Go implementation of magic wormhole.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/psanford/wormhole-william'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm7")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums=('4ba4c26ea740325a3a7315a41f31efd7f3bda1fdab155fdf9f37ca0eda99efb7'
            'ee47201dec4798fed875d8768ebfd04f186a74f1bbffe315a0c96b423331f462')
sha256sums_x86_64=('1dbb936fcecdc07e9bd8463e97da282db5c8acee864661ed689a5ce40a64ffdb')
sha256sums_armv7h=('8b85d767ec007c3434d4875ac525717a8934a78f57ae22606f3453bc4ee303aa')
sha256sums_aarch64=('1dbb936fcecdc07e9bd8463e97da282db5c8acee864661ed689a5ce40a64ffdb')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
