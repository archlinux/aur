# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.6.3
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
b2sums=('782360480dfe52e02ed0aee5beecc8cedc43a0b8dc3c7e0fa33de2a3a734ec5ff2ab4971c785ffeff98d34703e0c5e4f5414bfdecfb3be1e5b09920d912dabc1'
        'c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}
