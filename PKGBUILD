# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.49.0
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
sha256sums_x86_64=('929efc22eeb766b898b42bda254d73ebc1a54d0509ba55be3bef556629241621')
sha256sums_i686=('25ba85acd9d9f37398c649401b70ae64b8e3f6fd8e49a5cf0000cdc7073f2205')
sha256sums_aarch64=('6e35b3e94ea1c27bc60033db17b46d37554fda429b4aae28691551e98179d9f5')
sha256sums_armv7h=('71c452bcc4dc588529e3db45693504e67e12ee79deb1e3f470323e53827a8ed6')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
