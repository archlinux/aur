# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='proxify'
pkgname="${_pkgname}-bin"
pkgver=0.0.12
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

sha256sums_x86_64=('9ddc13e06957b744eb727adb0c5067f00a8aab7be187e86bfe3bc22cf26512be')
sha256sums_armv6h=('367ad5c97c7d6dd40d42f018cf36aa5359a05c59b33105711ecf64813cc197c6')
sha256sums_aarch64=('8737b1bda199ce52fde2b34124851902ff6a64b81181ad93921d36304c83e6f3')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.MD' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
