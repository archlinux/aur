# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.6.9
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
b2sums_x86_64=('286164e6e55bc46ac1fb088e5c749893069e8e173dde98d96a513a0890a83008cd0d9373cfd8636b17eda9a6e9377e65f92cb8dd549e3dc5d8fce05058446e73')
b2sums_armv6h=('cf9f17bd6adbdd134b7b1112a316311edd4c09865c2959f1e10948114e530d33e8abaad58b453fbcc0aeec261a6d6b2ca7db3a732432cc966bb93e5932bcd344')
b2sums_aarch64=('962d9419473511c214f4915c5eef5b4da4d427406d38e0c91be2ca76687c7830aa9ed676526d37ae956277db17c46f9838302ac8fbc8715729b3fe09c992c702')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
