# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="neonmodem"
pkgname="${_pkgname}-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc="A BBS-style, multi-backend discussion board TUI"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://neonmodem.com"
_url="https://github.com/mrusme/${_pkgname}"
license=(
  'GPL-3.0-only'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz"
)
source_armv6h=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz"
)
source_armv7h=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums_aarch64=('049d74476e0c6c3de08cab0d84902c2f85010feb5f575eb845ca7a364c0619a0')
sha256sums_armv6h=('3550cc05734a33ce1bc05df580e0d87f2a054a7564f6442992873cff3f11ac02')
sha256sums_armv7h=('67bc449cb3e79e7288e34f773f36b2b62fb67acc35cffeb482b4665aab6264a6')
sha256sums_i686=('a3376f17bcc87815fd56107879bc43afddcd88a33e85fc068f5333f2b7de7df4')
sha256sums_x86_64=('a69eecf7d99f2ad7fb8fceb84cf0857a6109760466a22c3ca86cd734facdbc17')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
