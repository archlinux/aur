# Maintainer: Funami
pkgname=dnspeep-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Spy on the DNS queries your computer is making"
arch=('x86_64')
url="https://github.com/jvns/dnspeep"
license=('MIT')
depends=('libpcap')
provides=('dnspeep')
conflicts=('dnspeep')
source=("https://github.com/jvns/dnspeep/releases/download/v$pkgver/dnspeep-linux.tar.gz"
        "https://raw.githubusercontent.com/jvns/dnspeep/v$pkgver/License.md")
sha256sums=('c8f42127dad3189664a3457797704b49d35dc2b1b09916ccbb6fa2be4eb007d7'
            '6b13fac99d17c5c42a3929e363aaa2ea75fc791da671e599a0dab5f9ac432b0d')

package() {
  install -Dm755 dnspeep -t "$pkgdir/usr/bin"
  install -Dm644 License.md -t "$pkgdir/usr/share/licenses/dnspeep"
}
