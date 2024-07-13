# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_binname="speedtest"
_pkgname="${_binname}-go"
pkgname="${_pkgname}-bin"
pkgver=1.7.8
pkgrel=1
pkgdesc="CLI and Go API to test internet speed using speedtest.net"
arch=('x86_64' 'i686' 'aarch64' 'armv5h' 'armv6h' 'armv7h' 'riscv64' 'loong64'
      'ppc64' 'ppc64le' 's390x' 'mips' 'mipsel' 'mips64' 'mips64el')
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
source_ppc64=("${_pkgsrc}-ppc64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64.tar.gz")
source_ppc64le=("${_pkgsrc}-ppc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64le.tar.gz")
source_s390x=("${_pkgsrc}-s390x.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_s390x.tar.gz")
# Change 'hardfloat' to 'softfloat' if necessary
source_mips=("${_pkgsrc}-mips.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mips_hardfloat.tar.gz")
source_mipsel=("${_pkgsrc}-mipsel.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mipsle_hardfloat.tar.gz")
source_mips64=("${_pkgsrc}-mips64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mips64_hardfloat.tar.gz")
source_mips64el=("${_pkgsrc}-mips64el.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mips64le_hardfloat.tar.gz")
sha256sums_x86_64=('fef447535893f6de869f0bf1a094b7583f61da78158d4b181821cccd8ea0aa3d')
sha256sums_i686=('5e4eda1ffa0ddafd9613d1c26dab11c47c79576833281669f3fbfbfeea5de06d')
sha256sums_aarch64=('e6bec712261c850b679fc3f97e2e66911a831636f65b2306f3241a074dd0a80e')
sha256sums_armv5h=('0cc3ee20741918dd49c793597e5ea90a322b9a5cc437dcd553f99d94d6f9ad44')
sha256sums_armv6h=('cdf32abe589088c68e036c3bbb7bc2acc7471254c57a70996619a9ab477a56f6')
sha256sums_armv7h=('897d806db7577734e10198bebd267270669e37501bfd85b8e16865ad8f8b2418')
sha256sums_riscv64=('39ee914e9183c1f9ffc6b22d1000255eeca23f77a0d4e2fb86d8dbf52fbd7894')
sha256sums_loong64=('b51ce006d798b04fd42d0d0a56bf81f14acb1fd42876f6db4a28c681ca4c926c')
sha256sums_ppc64=('5cee19fefb9820e20ba3d3d51ecdae0a1b3fc0b0b6b05e811baa3b42a174c0ae')
sha256sums_ppc64le=('3e45ae09addfe9dbf516cf4f6c06fc0c7c08d0ec4099de9c909d6eec9ace26a7')
sha256sums_s390x=('65b473736b78eb6ebc5be7197c6134c5060201c4a5b33902ec78b28395e25990')
sha256sums_mips=('f1b29e3bef2eedab9d83972198a51b5abc8b58b2fec7bddb56200a970b6cc3ee')
sha256sums_mipsel=('4efe4a9f8c180722fc10b87e451fca43447164e5e7007c14dae82ccd939584b3')
sha256sums_mips64=('1c86f64d4dbab1b18a468d9f68b01428c5ba8fed51d2fcde74faa4c78bc91bbc')
sha256sums_mips64el=('b1639cd7e9eb82863382a5107c9c497f5b03c9a44b1b2799b04a3c1c3184ce71')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
