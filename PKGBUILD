pkgname=coredns
pkgver=007
pkgrel=1
pkgdesc='CoreDNS is a DNS server that chains middleware'
url='https://github.com/coredns/coredns'
arch=(x86_64)
depends=()
makedepends=()
optdepends=()
backup=()
source=("https://github.com/coredns/coredns/releases/download/v${pkgver}/coredns_${pkgver}_linux_x86_64.tgz")
md5sums=('f687dab79c8c4451fbb36873895a50da')

package() {
    install -Dm755 coredns "$pkgdir"/usr/bin/coredns
}
