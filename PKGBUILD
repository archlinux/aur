# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="speedtest-go"
pkgname="${_pkgname}-bin"
pkgver=1.8.3
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
sha256sums_aarch64=('48f51504548d76d5dc2ce7f72e713bd3b4e35554028b7131467060688754c657')
sha256sums_armv5h=('4b14cea63c7cf46cce348d8e221ee3f557c3449689e9ae6c6995613277dc6aa9')
sha256sums_armv6h=('395fd65509af7297b62d8942a323483b48c176cd9404889cc499870fe291d596')
sha256sums_armv7h=('29d6f7b1038d765970c4f0a24e2e26a80b2041f58a7ce3c2e1b4318317c0fbe0')
sha256sums_i686=('7b9641833a94c5937d9872f589e017c0fa5e3ef9c4a36a4d88f3b5c7355dc053')
sha256sums_loong64=('0568d3e02fa0da2ab9104b0d08ac47d248f00d4cdcaa2c0fbcab9221eaab1e26')
sha256sums_powerpc64=('a8384a9a50b6e46ca3df823cbf8c11218b019c09970a43ef918f68caa3fbe66e')
sha256sums_powerpc64le=('f254841ca2373e12dce1807d3f7d8de2755a5a1419f446ef23046d54c6a5541f')
sha256sums_riscv64=('8ccdb9359c91bf24f9292c98bfbb408aaa5909b13b4b2a883e7248218a42664a')
sha256sums_x86_64=('c55caae22927cd719a2f8c0bef96ecf74b5fe8ca919ff9200d76328ae5de9477')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
