# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_binname="speedtest"
_pkgname="${_binname}-go"
pkgname="${_pkgname}-bin"
pkgver=1.7.9
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
sha256sums_x86_64=('6f372c7f46dc1a2c7160320c8e87d6f9232c09d54128f5518edf6e1d97a71f17')
sha256sums_i686=('ed67a939a79cfe1029b552f732ad08ede53ccb2575b8ec354cbb11158c8f6e5e')
sha256sums_aarch64=('33a43c2db04e4c0f8fef5c2c70842a5cfd5135cb56b314ff817fa0089e7ba01c')
sha256sums_armv5h=('ad20bcf43ab08858b605814524a2c6c75d1d2bc28e39090725b817cdd08f7e84')
sha256sums_armv6h=('bc1118093dc410357a29db21e0b1f52b7153b38e4ca204586d0aa25a50e77ab1')
sha256sums_armv7h=('cf83a3550c0f15cce1a66554a7a727c06c3fe220c3d7299b3488553e8afae0d6')
sha256sums_riscv64=('11f8bdd6589865f4c0bb234659d677c20a70e3d5b30100d1e6d181e63725428f')
sha256sums_loong64=('c26beb7386ceb8d75109a0ed9206f2aca6e5cc522f7e6aa0319a9d490e9a9748')
sha256sums_ppc64=('8d79c5b7453ade587c1d7098e65f0622c714d1918475d1eac3f7df7a78a81183')
sha256sums_ppc64le=('119942934a65cc609e7bf99b2803c01b2a18e0655748a403b08e930919a798ce')
sha256sums_s390x=('92999ff2749cc29c3a6ff00b4a68fb7b4d8e4d4479b54aecacacbe77cfd9dab2')
sha256sums_mips=('64764afb2900e88f626e3c6ed46c15380f88d876c7faba013d860ea9f084a41a')
sha256sums_mipsel=('47c348aa92b7b7bd0b65e3c748746f6b0b0e92d1cf10b67dceaaa50e9ec843dd')
sha256sums_mips64=('fc81a196b55060924da80a3f3d6d7983ad68bb11f11f95c5a7f999e1ad24d606')
sha256sums_mips64el=('08ba0267d165ed09b34ef140d777c49e507546a694eafd012ee7b6370e0b5bb6')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
