# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="speedtest-go"
pkgname="${_pkgname}-bin"
pkgver=1.8.2
pkgrel=1
pkgdesc="CLI and Go API to test internet speed using speedtest.net"
arch=(
  'aarch64'
  'armv5h'
  'armv6h'
  'armv7h'
  'i686'
  'loong64'
  'powerpc64'
  'powerpc64le'
  'riscv64' 
  'x86_64'    
)
url="https://github.com/showwin/${_pkgname}"
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
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz"
)
source_armv5h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz"
)
source_armv6h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz"
)
source_loong64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_loong64.tar.gz"
)
source_powerpc64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64.tar.gz"
)
source_powerpc64le=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_ppc64le.tar.gz"
)
source_riscv64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_riscv64.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz"
)
sha256sums_aarch64=('8e5d1bd0226f2f6307633e310d61ec783be2c2cf9d248496d15aa5fa76e9e6ad')
sha256sums_armv5h=('2c0d07e041e26639f5078a285ae4e276d96fabefb7c9e9d27943d5bf05d42f8a')
sha256sums_armv6h=('bdae764383a8980b2ad1b5c2f9b484ebb7aedce1170f8951ddcc53f2081f780e')
sha256sums_armv7h=('97187010e527f3be6c12d690192b81aa5c63aee5aa267dc1b3199621c33cea53')
sha256sums_i686=('0c957627af0a83e8d1cc7fc99f5149c87996503cc72de4dea469917194fb661c')
sha256sums_loong64=('50843dc77fb42200527bfe598a171151f48e895e24b3955e9f2700bdfd277ae1')
sha256sums_powerpc64=('2107b50b73ee0a534173bbaa3f7b4884429f23c2c2f1ad946050127fc04545fd')
sha256sums_powerpc64le=('20c7a2d7edb9677a427e43ef123b70a7dbbda17267b02a6e48079ba509c8edbc')
sha256sums_riscv64=('de1767f9b9a036a7bd78c99b1d86f8837482e8a6bfcafa4fe7a5c23d159bdd7e')
sha256sums_x86_64=('d2a265c447c73273460222405fa2dbc88b7ec06f75c28bba1f015e024c7f9944')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
