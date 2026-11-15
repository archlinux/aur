# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.50.2
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
sha256sums_x86_64=('df65a100940decdd564a37024a8261be566a629c9747a909f70421c616a2575c')
sha256sums_i686=('97209c31d00400aeac8467901e4a5bec43fae5568012eb5037d620bc2bb4b783')
sha256sums_aarch64=('5f81368b5769c87a960dbf70dfadb84823e2fe9613fcf2696202fc4a52ea3f2d')
sha256sums_armv7h=('2e48e143f87d653a28b8e0e20d67e8ec70c4205a86e5309cce7987f5e826f584')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
