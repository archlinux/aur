# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.6.5
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
b2sums=('ff9eb868c0975553e3e75a483109edec97e4fab254f4900f242d8ba136e70c9ed114185bb4bdb2c2b6ead91ce8d283632d241991ad512c478ccf44b0e5459a54'
        'c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')

package() {
        install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
        install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}
