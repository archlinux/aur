# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.16.0
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
b2sums_i686=('f155b7e533f612794a5c2ca4ca91ec58d05f67d87f092a60e56618e864dc0dc803a9e8575b0a787900fc0016e52d536e66f294e3eb76502e1088d087fd9cf156')
b2sums_x86_64=('bf5483a688bddc8552823658619fc4e8acb0281d9da2a5eab1591b2285092f436a9ddfb3ba6f1e8a017418f989243caa26b853a7ec29bc7b1db5be68b17b0613')
b2sums_armv7h=('42489d6fa9f61a35fc1c59596a312e6a4b729c1235733f77fb11d33a6d4c8b806a31dab089d4c873ce0d99668976f0a793999fdcff631fc1e66c72dca1f0f032')
b2sums_aarch64=('3466a80b1ad311dac47faaaf79898252fd171bfd441f88fc4314f9c9118e784f2c318f6348a0a81a62046c1f63ae5ca3642141b1d0c9050e610c43de838f2f1f')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
