# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="speedtest-go"
pkgname="${_pkgname}-bin"
pkgver=1.8.1
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
sha256sums_aarch64=('ab5fad648da854920dbdef211a4f783b0881f47b581b01190533a2fd38743deb')
sha256sums_armv5h=('15bd953cef9d6b0908d282f41cf0a3d7dc3de97cc6b4cdd7f0e569279bc3d134')
sha256sums_armv6h=('3c96171ce107a38e8af738ead3c967883f2f9dc931122610ddf41fd3e714a4a3')
sha256sums_armv7h=('ba5b794ee400f7c1b092b2bb157a49330b4ff7774b8798af6489eff21df390e8')
sha256sums_i686=('6a7e5b78317048dbb228ac6d1d5acd25cba4d86432aefc3456896afc597e137a')
sha256sums_loong64=('6f727b8b02bf88c32eaea3837842a9c04559ae766e3e81fdf15875a512a7d192')
sha256sums_powerpc64=('78470ca400f6037fb079472eb7e574e586d0a2ae2cf0ee79a73eb0b9aa082839')
sha256sums_powerpc64le=('29385d15c8bb97449b362716698e2c6d9a4b58562e3d52728b16da694104a182')
sha256sums_riscv64=('cfb61945079df6151ded35438e426288ca7a83e1abe12897d1797cfc9904fa32')
sha256sums_x86_64=('7830532dd42140868095d1441508b7285bbd0fad1b0c52209f4d664651811ec7')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
