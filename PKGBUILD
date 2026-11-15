# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.50.1
pkgrel=1
pkgdesc="NextDNS DNS/53 to DoH Proxy"
url="https://github.com/nextdns/nextdns"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=(MIT)
depends=()
provides=(nextdns)
conflicts=(nextdns)
backup=(etc/nextdns.conf)
install="nextdns.install"
source_x86_64=("https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_386.tar.gz")
source_aarch64=("https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('a80ca407616bdd64b026fb38df78718e583b8edd9f638317df2792407e73a586')
sha256sums_i686=('090428c64b4e52b3f1a917343651f71f46e806e3ee5504cf772f8739264ebf6d')
sha256sums_aarch64=('9435fb1edfcdb4c520671e0c291cb6d8317018b4130946e214f1a03981ec1686')
sha256sums_armv7h=('3eaf940bb172221ded8c72b1e7955fd43e8fcf14b9a6c28b3c0327434a702a8d')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
