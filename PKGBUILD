# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='proxify'
pkgname="${_pkgname}-bin"
pkgver=0.0.8
pkgrel=1
pkgdesc='Swiss Army knife Proxy tool for HTTP/HTTPS traffic capture, manipulation and replay'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/proxify'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('c5a24c238cdca9bf30150ee49b18647eeae4c8cdb0a4f37f7a5772ccc26081bf')
sha256sums_armv6h=('fb755a55e32d5312a46e1a3d359b0ef9f42efb3810112e6539f016b561e6ac9b')
sha256sums_aarch64=('88f5464f1a20b200409cbf8b4e2beb8c1d226f1b8c5a6e63b451b397432049c5')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.MD' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
