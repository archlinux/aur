# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.44.4
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
sha256sums_x86_64=('d046af0c8ea70e52dc2e26c98090283db6c38ac8be74c569a4df0a670400f51e')
sha256sums_i686=('d485a8452c55048e2457ca438a6d0a9b69d23f404f26450bfd78f4058da41317')
sha256sums_aarch64=('f2a38d370c994e54ac145347306287a6b9662059dfe82fea264c52965a03fbd6')
sha256sums_armv7h=('a85524114db9d56684ed8849d32079467f794c7364f8910eead36e6383511099')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
