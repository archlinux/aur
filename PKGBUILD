# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.4.4
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
sha256sums=('36060e5af0c963f5695c8b3d18254944323e2f6abe8cd3b2dcdcddac10960990'
            'fe9e33fc73d30a3c3ec7b1d75fd245c6a0d1679d5778ebe34b1d6fb9b63922ba')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}
