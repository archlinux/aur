# Maintainer: Hao Long <aur@esd.cc>

pkgname=subfinder-bin
pkgver=2.3.5
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=("x86_64")
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=('subfinder')
conflicts=('subfinder')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/projectdiscovery/subfinder/releases/download/${pkgver}/subfinder_${pkgver}_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/projectdiscovery/subfinder/${pkgver}/LICENSE")
sha256sums=('485dfc3d4aa0039502fc1963a6780a5d23879ed46ee8e01035fdeebf1c58ba01'
            'fe9e33fc73d30a3c3ec7b1d75fd245c6a0d1679d5778ebe34b1d6fb9b63922ba')

package() {
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 subfinder-linux-amd64 ${pkgdir}/usr/bin/subfinder
}
