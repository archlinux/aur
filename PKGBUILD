# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='proxify'
pkgname="${_pkgname}-bin"
pkgver=0.0.11
pkgrel=1
pkgdesc='Swiss Army knife Proxy tool for HTTP/HTTPS traffic capture, manipulation and replay'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/proxify'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('7173a408c79bf4d6f34ceac29a5bb9db13f96f44e245d3437089f45f1d951e91')
sha256sums_armv6h=('ee935e535b4b7d51210dc780d658bf3eead5222eefd4cc041b5203bdffc8a744')
sha256sums_aarch64=('26b0bfe45865619951f1d213e87faf6f239fc758478b3978ecfc167bda5ba011')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.MD' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
