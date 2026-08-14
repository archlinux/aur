# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="speedtest-go"
pkgname="${_pkgname}-bin"
pkgver=1.7.11
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
sha256sums_aarch64=('0cece989a5eb688f39bec33ea05fee9f82c5882c8aaa0fd580c9461583363fc4')
sha256sums_armv5h=('3155c31059e6d7274a53843829f3c7c2a74e9eaaf3d2651bd0588f814ac2724b')
sha256sums_armv6h=('fa1a1fd3175b2bd59118a04ace1639bbedbcacfbd84171bc46193c01bb373e34')
sha256sums_armv7h=('e777996e33e40b78324f1ed6dcdba3a1279ff9eaa9fe8d9b4b0fe5965353f83f')
sha256sums_i686=('51751fa102834133d820f428c1ae0e38f17577cdb726b09bc95d91a60dd997f5')
sha256sums_loong64=('0d0a8a574335122cb7aef77ecd3c2841f4ea9e8d41d90ab265ed7c22418d6f86')
sha256sums_powerpc64=('3ea06f788a11a3e2e3d87de64551cba64dde0d30779f724815288560639566d9')
sha256sums_powerpc64le=('efb02fffbff427d67d18612f55af28528b5ca57fa52a8307eb01085e608cc491')
sha256sums_riscv64=('ca68dd04166bd680bbdb9e581d1105aa21f764ceb5d1852451110604f8e74069')
sha256sums_x86_64=('86055ee85fac5aaa27d132224a8296c1a416c4bf0a3809c07af39d97cd0cf96c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
