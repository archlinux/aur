# Maintainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='got'
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc='CLI tool to download large files faster than cURL and Wget'
arch=('x86_64' 'armv6h' 'aarch64' 'i686')
url='https://github.com/melbahja/got'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_32bit.tar.gz")

sha256sums_x86_64=('b8a31b3e7de91f150cb87ed1e22bd2313bba06653add3b0342108cb4fcac9549')
sha256sums_armv6h=('37d99890495c9fd04458115167cbdc6ab7ed70413762220b824cc9f5984b2c52')
sha256sums_aarch64=('c14a0686c47e9f9eb68aa8c40fc45bcfefbec1ca1b5b22db607166148236c83a')
sha256sums_i686=('da57a36dc8fb193eb558528832f399c0f1b0d022aa110556b3853b34873dd0ca')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm755 "w${_pkgname}" -t "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
