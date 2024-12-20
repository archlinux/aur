# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="speedtest-go"
pkgname="${_pkgname}-bin"
pkgver=1.7.10
pkgrel=1
pkgdesc="CLI and Go API to test internet speed using speedtest.net"
arch=('x86_64' 'aarch64' 'i686' 'armv5h' 'armv6h' 'armv7h' 'riscv64' 'loong64'
      'powerpc64' 'powerpc64le' 's390x')
url="https://github.com/showwin/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv5h=("${_pkgsrc}-armv5h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_riscv64.tar.gz")
source_loong64=("${_pkgsrc}-loong64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_loong64.tar.gz")
source_powerpc64=("${_pkgsrc}-powerpc64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64.tar.gz")
source_powerpc64le=("${_pkgsrc}-powerpc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64le.tar.gz")
source_s390x=("${_pkgsrc}-s390x.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_s390x.tar.gz")
sha256sums_x86_64=('f349b09e20c55e2445c38592c96807378f53c090cc6a52b8fb14346b40b32ff2')
sha256sums_aarch64=('8aa7f95b1fd57ebf79960017aa52d9a07d4372693dbfd40fae84464122d7e425')
sha256sums_i686=('9f4ac3f94de6518d081c4903dc46927dcb683108cbf5d37c54035b3ddbbb8ac0')
sha256sums_armv5h=('a82c2557663d8c17734e78cf6f916659d16c44e7f7e23fa005a635c4dfe34c7e')
sha256sums_armv6h=('860742356e639a550fb740c4e09391179e87ece79849d879aa77ce9edf2aeb71')
sha256sums_armv7h=('3dd94ed28bf0bd8e052b214de098a19a15d3027820f3e81c8cc17084e8692f55')
sha256sums_riscv64=('e8be88d07764fa459d2432d9e2bb1b6378a39d5f0e028062c706e90c1ea1d95f')
sha256sums_loong64=('f7db2d63d86e409e624e784be3a0fcf61a2af321849fce363102ff5d6fcda29c')
sha256sums_powerpc64=('1f32f951bdebc897fbbbc87b6d8e91c95d664ca22c111aa174173d9ffb11c86e')
sha256sums_powerpc64le=('4b72e4e1c06dff59e3a64dd99911f8813ed09afced98fde79df4fa352e781252')
sha256sums_s390x=('12e34635f9f4b4c22f629e15ac392726104c679a3acf1f4ea729c520ef3409c3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
