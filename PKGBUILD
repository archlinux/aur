# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.5.7
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')
b2sums_x86_64=('8c327f50bfbc2155a181edbcabd5cc0216c7330c07e7925eb60bc3452c65eb34791c6f758134415c3be2df747f8f889ae6056ea0528ec91e6b2f81590c9fd56c')
b2sums_armv6h=('b13c4435e463384841f7237f5d73e6aa7b8b6e69b305ec2b8094dd9f34ab827f1314472d6e324fd7970504ac8108c2ac6d6a05be5deab2e46e84b785f186cae5')
b2sums_aarch64=('7ad7a812da6d46faa9facffc7b14f88fcfbeb4540d45fe927b8873e4b74be49943ab8e1b6e5279f0ab857dc35115edb64398c8054b0c5f38c345cb84da3e6518')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
