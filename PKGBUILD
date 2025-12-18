# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="alterx"
pkgname="${_pkgname}-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast and customizable subdomain wordlist generator using DSL"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/projectdiscovery/${_pkgname}"
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
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums_aarch64=('14dfdaebfee0ecce559afacf62e9e15e9f8aa7dd8a2a659d9e0b3bc2dbb4419f')
sha256sums_armv7h=('1e47eea003a396f70e5ee6940ab5e429755177b976ded0785f404530cdb7db5d')
sha256sums_i686=('243fd0d89a53f8030af088c93e59025524599a4131db14f9f344cfca171d159b')
sha256sums_x86_64=('ffae5b25138cb27b58900b9b5849e02d0390385fce404252d32e469f2a0e97ac')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
