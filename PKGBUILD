# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.3.2
pkgrel=3
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=("x86_64")
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=('subfinder')
conflicts=('subfinder')
source=("${pkgname}-${pkgver}.tar::https://github.com/projectdiscovery/subfinder/releases/download/v${pkgver}/subfinder-linux-amd64.tar"
        "https://raw.githubusercontent.com/projectdiscovery/subfinder/v${pkgver}/LICENSE")
sha256sums=('d6c9ca233054034f95036041f8046f078429d35aa80be258ecc587989e5a4003'
            'fe9e33fc73d30a3c3ec7b1d75fd245c6a0d1679d5778ebe34b1d6fb9b63922ba')

package() {
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 subfinder-linux-amd64 ${pkgdir}/usr/bin/subfinder
}
