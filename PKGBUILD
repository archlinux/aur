# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.47.2
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
sha256sums_x86_64=('230be044b96d5acd055d7d20aa25f6ddda3ea44e9f486dba62a0405065e0e904')
sha256sums_i686=('87b308220dca7c478d1218aca38bcf0f8a4ffbf1cd96ddea490354bbc21c0e61')
sha256sums_aarch64=('663c3f26d5e5c80cc502d1b42ebfe52f1ff932be8359ab18539d88016bdb8603')
sha256sums_armv7h=('80ee05a5e8baad78d17078579906c33b98a92110b2d7f9caec74dc8d94d7ad28')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
