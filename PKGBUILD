# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.5.1
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/master/LICENSE.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('8d39c5fdf160392eb735ae19d5dcb9227c32d6ead9aa9b0f9b59b0b45be63c42412da9b0c97cc7f33a24b16fdcd982f470dab65742849d229f6e43b2d845e758')
b2sums_x86_64=('06158e3695bba942282780ad54f3124df5bed9c815a2e9ed1ae453cb59562ef80f77ba8276dc6f3d16fe68485e0c0b7a7053c967face15a74bd8861174fc56f3')
b2sums_armv6h=('43f0c09755757aee8c569eb0ceee7a31d496a03f5041d0099102cc918b56756281432bdb44a4a04de8e0ab5d2f68846ec2a746563c030e7601a2690865c54110')
b2sums_aarch64=('c75b41abd80d6823ba3421fc661da069a83f97b175149857eeb0865ebb369238a0c02ee3467b777a829047501709c01069d16977e7e8e292568a526ebad0145e')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
