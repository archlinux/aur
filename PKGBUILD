# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.0.8
pkgrel=1
pkgdesc="Tool for listing Assets from multiple Cloud Providers"
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_arm=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
sha256sums_x86_64=('522042853a98d415bedddd0ec2c03b16803c4dc8345df1b3876f811e868bf1e7')
sha256sums_i686=('8c16b363dfcfa5cc4a728df532ff51e9cc99794f776032bcc0510ac7ac70a48f')
sha256sums_aarch64=('6c016b8435224207fbe8f5cd44a0a3a21a0dc2db3ebd0ce68a38780d24b7f42b')
sha256sums_arm=('f43ce48aa8d1712f9520fd013d975b262a245c3880727c0f39ef05b63e636d72')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
