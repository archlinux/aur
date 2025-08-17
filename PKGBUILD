# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="git-chglog"
pkgname="${_pkgname}-bin"
pkgver=0.15.4
pkgrel=3
pkgdesc="git CHANGELOG generator"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
optdepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('75d6fcfe1e2f7335a37048e01db53b87035a11ab78a8c3fc2ba65a6e5794f71f')
sha256sums_armv7h=('79efbebc1327e91334decb3be51094f3e430928fcc25512b5b963864f1da0b9d')
sha256sums_i686=('14e0109131f6e897cbc0878a15e3c476ee23745e7a9a9fd8a487af6c11e62ba1')
sha256sums_x86_64=('03cbeedbd1317289295e75016fa0acd26baeb2fc7810ed287361dd9bd8bc33a8')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
