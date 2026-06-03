# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.47.3
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
sha256sums_x86_64=('3bb0f6ee6d434b2c94e1c115d2882b2549972f7d693dd5c6f83b25e4a1572919')
sha256sums_i686=('850834fdb9e86fe87bd931b99f0e3cb1e1fdc9e50b10f40e5675b4a8f1cb004d')
sha256sums_aarch64=('e92caa66a23685adf1f73213d0570f2a179abae446d6257a7c89570a4a0e637f')
sha256sums_armv7h=('c79c34ab064bb080960abb400d3d4fd5beced18e6c491173d026e330e3b71869')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
