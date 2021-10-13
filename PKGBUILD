# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.4.9
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=("x86_64")
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=('subfinder')
conflicts=('subfinder')
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/subfinder_${pkgver}_linux_amd64.zip"
        "https://raw.githubusercontent.com/projectdiscovery/subfinder/v${pkgver}/LICENSE.md")
b2sums=('93a4e41f351aaa76715439a90a3641a3286c02b4ca7475f2662173b81afc6eeb92582c270e1c5c6d18de541c7fd5bf187572f50f5db6eab1874170a09c7cf091'
        'c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}
