# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.13.0
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/subfinder/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')
b2sums_i686=('adcd6aefc723f0655a0340f8e5d16c3fd1da184dced35b8147ab5cc468e1e9f4062ec2ac73127cdea90cba14eadbf9f8a6f32d1b7f38f26d4e5e0337539599f9')
b2sums_x86_64=('c971689ed7a8e1be5869170a514b71196501baa16b9f02e66688ab17c1ad2b0c84cfeebd8b886c656990e7fd340744ef851f07540ea6f7211e1530dee77d81f2')
b2sums_armv7h=('f7b59840de8c31185353a2a1a6e63909598fac3c416ef9086bc9f78272d833935a807b6d497d09a3b3a890d2c130dac886cbd83f570ee05cd810a060dea9000d')
b2sums_aarch64=('9dcb5da81397b16e543d7cca8e469415c5c06ee3bf4167ec88f08ed50d3bbd61324e1bbddeea39638808cd5f3d2a55a4b3cffa26fc19553d86f7f9fc6c81aa63')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
