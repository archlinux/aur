# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.8
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('2029dad2ab2740376273b715f27e950511c8392b1e575226a922a818041dbf95f60eca51f33b3b036cf5cc5b6f8f8b0a81221e1d80ff69f4ddad8e0f8ed37ba2')
b2sums_i686=('edce41defc7d5f8db646ed5c5c0d1d27a6321fe8531289c427a176e0336887cab47f6650a6756a5a77072e920ad6354efe5ecb4b3bd47e01214d7507db1d08b7')
b2sums_x86_64=('f6bcedb8be7a1005434f5e67efdd165e471e511f53263f74c4cf4de1e737e3164f62a91d28548f17bd5fd441a277592724f5031d4494f2e6e48eda69732e156b')
b2sums_armv7h=('ac67a7080548d5b65e3ee595454b533aab5841b547c39f6b0a699bb76fba680d5cfe5215b7a207733eaf7bf5ac9cae1c183419ff599e794b7097b55b9e119ede')
b2sums_aarch64=('7b6afefb9f68a16918d9d8fb1eba1babf03573803ccc2e9ab868bb2ef04d8f49bd519dccde3227f87b5be918ec17aa9d29cc8ac7e8ecd7795c08ba6da69f89c5')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
