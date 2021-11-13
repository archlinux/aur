# Maintainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='got'
pkgname="${_pkgname}-bin"
pkgver=0.6.1
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

sha256sums_x86_64=('162ec0115478f88d47de6a1a32d6003d41d2c6134504a8588b3db32a7d10d547')
sha256sums_armv6h=('e0c8a0e2fb0a8d0c20f39028b61b9960b09c9e4ea34fec69830b8c13e583878b')
sha256sums_aarch64=('b2be2ad1ef419865548633efc9e1c358bb8897bd3ff206cf6531f14e5e97adfe')
sha256sums_i686=('b2be2ad1ef419865548633efc9e1c358bb8897bd3ff206cf6531f14e5e97adfe')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm755 "w${_pkgname}" -t "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
