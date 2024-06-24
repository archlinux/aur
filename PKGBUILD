# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=speedtest-go
pkgname=${_pkgname}-bin
pkgver=1.7.7
pkgrel=1
pkgdesc="CLI and Go API to Test Internet Speed using speedtest.net"
arch=('x86_64' 'i686' 'aarch64' 'armv5h' 'armv6h' 'armv7h' 'riscv64' 'loong64'
      'ppc64' 'ppc64le' 's390x' 'mips' 'mipsel' 'mips64' 'mips64el')
url="https://github.com/showwin/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv5h=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_armv6h=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")
source_riscv64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_riscv64.tar.gz")
source_loong64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_loong64.tar.gz")
source_ppc64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64.tar.gz")
source_ppc64le=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64le.tar.gz")
source_s390x=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_s390x.tar.gz")
# Change 'hardfloat' to 'softfloat' if necessary
source_mips=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mips_hardfloat.tar.gz")
source_mipsel=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mipsle_hardfloat.tar.gz")
source_mips64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mips64_hardfloat.tar.gz")
source_mips64el=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_mips64le_hardfloat.tar.gz")
sha256sums_x86_64=('8345b54198a15ee066d084a15b5ab757d39f6bfc1459e31631b8a6a976bbc69a')
sha256sums_i686=('6657e8c22b788e0a75c374f41d2521218eadc24d6ec4c9d43eff5e588243eb7d')
sha256sums_aarch64=('11db73962ea6113af78aea5912ffa7b561c6a2dbb97bb24734f379b6118cd888')
sha256sums_armv5h=('13da48fc7bafed380a7030054750baf0c9b37b46bbeea4aff3dd42562cb5f3d8')
sha256sums_armv6h=('30702860b3e012a1efb66ec72f17ed26323c97b36fdc495b48fd24002c95dc8f')
sha256sums_armv7h=('849dcee4b130804e31c44eb1d336a9b09b9bc3a1be0793d11e964ce4dd436cba')
sha256sums_riscv64=('28ee36b71cd24f49a238b778971592dd466af68f2ad388824bf555a2f4e82f53')
sha256sums_loong64=('97da6ed5c5c6c872c36ae5aac3f9fe0220062cb59fa407eaf5c7753d38bc5edf')
sha256sums_ppc64=('163ceff4325a1bd4c1d8a4ba0a21ef9c054a0bbbc3aef14bf692b1e3f9f368dc')
sha256sums_ppc64le=('7341deb23c735d9cdad5e88652524d351697ca145e402270bade6a3f4bcea805')
sha256sums_s390x=('c133c79835d5f8aeae7d2fa629577b9875b4634532e02b559094ea99d6b143db')
sha256sums_mips=('3201ae504771a169e1f6d759eb8a58c7e043b8372fd683aeffef49f57816968d')
sha256sums_mipsel=('765f70e0937c60b52384b93f1e8874d31b8bd9592609632023e6c067dafd04b4')
sha256sums_mips64=('38ae1b103f423786becd158d71c1567ee0633688d4a7b58da8902b0aae16097e')
sha256sums_mips64el=('8b03346b676963c8bdb6f013e7744d2dc13d27ade2b3c22d024df7055b9758a0')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
