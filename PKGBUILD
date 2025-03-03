# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gotz"
pkgname="${_pkgname}-bin"
pkgver=0.1.14
pkgrel=1
pkgdesc="A simple CLI timezone info tool"
arch=('aarch64' 'armv6h' 'i686' 'x86_64')
url="https://github.com/merschformann/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('7de98af92cbbd020c028ab98cb15ed25a45e72eac3860df293f9593f28467ea8')
sha256sums_armv6h=('e9ceca394c73fe35841a225895ec11679e53e787eea914568cb4f1ebc50c54f5')
sha256sums_i686=('303795cc11d81367bfd4bc60b39a050e9dcb264254023055d3741b7de385fc38')
sha256sums_x86_64=('8e14aac3232616d5863bd7a2b4b62736f67d1d4edc3922521754e23b5a39b35f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
