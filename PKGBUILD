# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="neonmodem"
pkgname="${_pkgname}-bin"
pkgver=1.0.7
pkgrel=1
pkgdesc="A BBS-style, multi-backend discussion board TUI"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://neonmodem.com"
_url="https://github.com/mrusme/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv7.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('ef65cba272ca0b344a97064fa0c3bd66dad64f8511c84215a77a3d7433119b20')
sha256sums_armv6h=('10186c7bc42c0dbc410612bae3d81cd9b4312849b7172fbac67a405d06d2c3ba')
sha256sums_armv7h=('14088c0dbea663245dc085d1b3e00927250b9e9fe68a943c77321402f70a46dd')
sha256sums_i686=('ee029ac8c6ec8fa371a9207cc8e33fe0fa879a7651a7c7f6813d80a75923fb00')
sha256sums_x86_64=('45ae9f1413b5ad7ff35ca986fe2dcc09e6055dff2c92987885beafee3536f126')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
