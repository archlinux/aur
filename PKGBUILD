# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='got'
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc='CLI tool to download large files faster than cURL and Wget'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/melbahja/got'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('f97efb6350bbec25a62055f7431ef6d92a82bd647934356f4d0ed711f403c148')
sha256sums_armv6h=('b7328e8d2b74615f70609412644be0e9593ef8462c4f0f0d46a1e1799f4ae1ac')
sha256sums_aarch64=('1ba396f6ab6cd4dc3cee9766b7c0f7e4c3848b2e66cde2fd89d93b52b1c62d71')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
