# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.4.6
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
sha256sums=('fbb7c0f43908292b073eb3ee4611a580d46b2200c7a0a0fc5096f8164d2b3f21'
            'cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}
