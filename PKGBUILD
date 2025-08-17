# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mercator"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=3
pkgdesc="OpenStreetMap but as terminal user interface (TUI) program"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/mrusme/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv7.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('a066275edaa420e192e2b7bbedb96d0374e342d5b443c9251e730905afc20583')
sha256sums_armv6h=('610d22ad12c3ba8a3123ed74db39d79fad38e689477958a89c874bbfe440f480')
sha256sums_armv7h=('aa715b0a039d9c094df3eff9f8b0a8af5958522a6bf6f9e42c8f4b514401f22c')
sha256sums_i686=('151ac7497776fba8760e47cc361e6b0530b6e5428f54f3a4fe5f4db2787f3e7e')
sha256sums_x86_64=('b791bfc9a72f27fcf743559be602351491878144a57583625436b565a469b6a2')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
