# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.44.5
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
sha256sums_x86_64=('5870a12cb0f14e17d11c108d82825640d68dec3932aa3c43b31c7938735805d9')
sha256sums_i686=('4d58811c55e85e75adbb39ef71f8eb89618a15aa1df86d00188b7525cc5ba5ac')
sha256sums_aarch64=('0dd280c3fb6e47fbe0e8afaa7fe2c5b6566005d33cec906862dc44f9c675b75d')
sha256sums_armv7h=('092d88fc9d6d8391afcc4f0a51bd6aa3a0bc61a82cafbf6adb19cf08b2cf9a06')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
