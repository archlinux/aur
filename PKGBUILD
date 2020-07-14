# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.3.6
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
sha256sums=('ec7b97629d7b0c00aa71c34440095ddb947283a14ad8e6fddaa27832e5e3895f'
            'fe9e33fc73d30a3c3ec7b1d75fd245c6a0d1679d5778ebe34b1d6fb9b63922ba')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}
