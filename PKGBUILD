# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.44.3
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
sha256sums_x86_64=('1307e6ab8a66e2fc8401047b21a6fb84be3c32802b2d9db06956c57309bd2b0d')
sha256sums_i686=('36460c947c958cc249d1ff131e577114aeeafcf11944340eb9954daa50b25d39')
sha256sums_aarch64=('2f99025b8b1e9026b9a372c9fc140aa5eba4b81ec4609f5acc0b1462775de834')
sha256sums_armv7h=('c04ae4397770b8669f5892d1a6c220c2ae34a65b82266b2a569b835bb71997cf')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
