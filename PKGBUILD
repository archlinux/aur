# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="Tool for listing Assets from multiple Cloud Providers"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://docs.projectdiscovery.io/tools/cloudlist"
_url="https://github.com/projectdiscovery/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv7h=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums_aarch64=('4bcb9b8718279a6d91c02647be3f5bbacf80626fc6e1c7eea8dba56dd812e856')
sha256sums_armv7h=('47c11384e40812cd1ee5fc9e31c3166c2429ae5c879b420c5db27006c08946f8')
sha256sums_i686=('ed9ebd2c1d274f22d3a13566cd6df8a77339f7b2a73917b9e4d7c690d61aa518')
sha256sums_x86_64=('0853acda07f1ef640ee5b7b0854ccaf0e9fb0cefe51cabcdc33aa81c45c2962b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
