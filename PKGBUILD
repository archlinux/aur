# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.4.8
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=("x86_64")
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=('subfinder')
conflicts=('subfinder')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/projectdiscovery/subfinder/releases/download/v${pkgver}/subfinder_${pkgver}_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/projectdiscovery/subfinder/v${pkgver}/LICENSE.md")
sha256sums=('0a2f92ebc2f1df5be915f4bb3c0c3a610c16e92023cd4dc3f7cb00a302702cfa'
            'cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}
