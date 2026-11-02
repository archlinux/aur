# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hack-browser-data"
pkgname="${_pkgname}-bin"
pkgver=1.2.0
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
sha256sums_aarch64=('c6e63be643e6cd02520e9955dd1f9343403e5bb8e13cfe5a8dd2d88cd09ccde7')
sha256sums_armv7h=('ec97a988a398dd157617178f635dba20d4291d85f1173aef29b12327dc015c4f')
sha256sums_i686=('edf44c87ed4a66cef22a2aef6daee80447a0804f9793551aae59296453eb908c')
sha256sums_x86_64=('d56575c3866dba5db4396b6da2cfa44587608093373fa84edc9e4d6df2f77e96')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "README_ZH.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README_ZH.md"
  install -vDm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
