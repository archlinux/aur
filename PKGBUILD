# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="git-chglog"
pkgname="${_pkgname}-bin"
pkgver=0.15.4
pkgrel=1
pkgdesc="git CHANGELOG generator"
arch=('x86_64' 'i686' 'aarch64' 'armv6h')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('03cbeedbd1317289295e75016fa0acd26baeb2fc7810ed287361dd9bd8bc33a8')
sha256sums_i686=('14e0109131f6e897cbc0878a15e3c476ee23745e7a9a9fd8a487af6c11e62ba1')
sha256sums_aarch64=('75d6fcfe1e2f7335a37048e01db53b87035a11ab78a8c3fc2ba65a6e5794f71f')
sha256sums_armv6h=('79efbebc1327e91334decb3be51094f3e430928fcc25512b5b963864f1da0b9d')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
