# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.4.0
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
sha256sums_aarch64=('d5c2232e487a9be09d6063ed7e4a0c90ee6b2998f7dd80275e6b12e44c04f5fa')
sha256sums_armv7h=('27c0c49fc61087047458f22d5d55cee7f9d138f97814a818a400fcebb6df995e')
sha256sums_i686=('9e84d9ed3c65fbca70bd3f7d05fe322076f71749f7ef2670e85996ad041bd490')
sha256sums_x86_64=('92823d16f77971eca378eeeb2ef4a204bf3eb30f7dae1be6b5a7769932f9ea08')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
