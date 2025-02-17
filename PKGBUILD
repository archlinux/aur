# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.45.0
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
sha256sums_x86_64=('f43684bb7d716ecb215e9716fcec7381cc3e70f1d9cf1c383d9220b3f7a98e05')
sha256sums_i686=('9d4c2176041819d6536ede98b02d4a74a165b06103b331d47c7c01dcf19c66a5')
sha256sums_aarch64=('0adae4a19fcfb40c53ddc68619b10ad9c8f7d54e5869455996b2e9c0d52d9451')
sha256sums_armv7h=('10e90bba389bcbd7f4f3a89a1f85545e19cd77cd52c6c7744b19cf78cf777252')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
