# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.44.6
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
sha256sums_x86_64=('e5bd77d8aab4e28f4e7176b96710dd4dcc1c935c32b421753c76ce658c821126')
sha256sums_i686=('92f8943896ea06d157cdf5656e28cb9d7e43e125f81e64013507d2f860e401d7')
sha256sums_aarch64=('89aaa695edbc98ec1abd90542611ed7a93102b0fbb00b0051d8d2cb6bbb4bfd9')
sha256sums_armv7h=('b87ad67cbffdd86e431e86bac986751f34fbe56224420016a0fb1dff6b52c46e')

package() {
  install -Dm 755 nextdns "$pkgdir"/usr/bin/nextdns
}
