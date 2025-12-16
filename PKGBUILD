# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.6.1
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
b2sums_i686=('c9cbd429bda29983426e931c12542c42e4852e0cb0fc05e51f9d1cebb5b8882515577585e33bf25d52207f74b161a8a2500ce25beb35e7168c60cff3748e27e0')
b2sums_x86_64=('97adcd779b8d4494057f05bab9f846d68fe18197f2eeec8bb0d6d65586c91b46cfa57cc45c0ce47ed2d31a490b9300b95d89c4d68d5f04a8c3241cfb08841dad')
b2sums_armv7h=('d13b01001b0473ad57a020e9f25d90fa533add76f5c4f5f82ee99efe626103fd878efebc58b8c6c135f71c9090622cceb9a4cb0b1f33b299b7a3645710c751dc')
b2sums_aarch64=('65d33be7fba1b15f1d48b5a38d5582bd6145185ba144219ec2d679e003e5a3fdf90549ca7325f5de867fc2c38e639bfb10a5ba5d168475f47c21be35d45e27e4')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
