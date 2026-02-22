# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.47.1
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
sha256sums_x86_64=('951a5040f43074b34057fc4cdacacbd4ccc4d9126c9d64bd727bda25232a5f88')
sha256sums_i686=('44593b599cd94ea9615fa2cbc695e59c1df83af8196011ac9a025c004cf55b76')
sha256sums_aarch64=('7a7aa5a1d1a31dadd3ad285fd82389346bfced94dfbef79dfad4341fd1e96716')
sha256sums_armv7h=('c9adf6cef201310c48111791ed95c494d4b842b5fa150e4d518c2658abb98463')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
