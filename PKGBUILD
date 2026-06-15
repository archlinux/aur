# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hack-browser-data"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="Extract and decrypt browser data, supporting multiple data types"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/moonD4rk/HackBrowserData"
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
  "${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz"
)
source_armv7h=(
  "${_pkgname}-${pkgver}-linux-arm.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm.tar.gz"
)
source_i686=(
  "${_pkgname}-${pkgver}-linux-32bit.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-32bit.tar.gz"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-64bit.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-64bit.tar.gz"
)
sha256sums_aarch64=('d1e01923eb5861bbd16211353c496dda17843d0e5ba5886f561e27969de0ffc9')
sha256sums_armv7h=('c8d0dfe22999f7e021038bc45319b1933622fbc4eacd3adf07fab9b24f0adb2c')
sha256sums_i686=('789408f448cc22f6255fff560c15fede43be04678a6e0763a74a17db39c8f3cc')
sha256sums_x86_64=('7fed7b243494bf64e81a63df9510c474c95cefd3e1d025ce7dba16fe2c04c594')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "README_ZH.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README_ZH.md"
  install -vDm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
