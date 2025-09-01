# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='proxify'
pkgname="${_pkgname}-bin"
pkgver=0.0.16
pkgrel=1
pkgdesc='A versatile and portable proxy for capturing, manipulating, and replaying HTTP/HTTPS traffic on the go'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/proxify'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('242eb958d95b05ca2cf9e2b874ddbee8f143ac13eac4aba3637b2f5736f9c1be')
sha256sums_armv6h=('b87d1b22db5dfb0f0532a19ca50d7f677ae8dd4b098869e2cd2159e98f013876')
sha256sums_aarch64=('374d71918dc3e9088bbad5e7f5aa5c643b4f87fbb57a43cdb5e3446f2392a14f')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.MD' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
