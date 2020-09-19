# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='got'
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI tool to download large files faster than cURL and Wget'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/melbahja/got'
license=('MIT')
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('931f7a2fd4fc1ecfcbad997f220e51e9641b11e14a84e678ba75932f69534ba3')
sha256sums_armv6h=('540357dc914f75ea70353e7cde1d5ec71f971078e6cdb5070f5c8567ea760dcf')
sha256sums_aarch64=('f0a4d8d9caad72fc128d17f93b3ef275d4e3bf40e55ebb5cc0967b4f0ce97af1')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
