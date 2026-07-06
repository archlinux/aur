# Maintainer: Arunachalam (Vellore, Tamil Nadu, India) <arunachalamthehacker@gmail.com>

pkgname=netwatch-git
pkgver=1.0.r0.g$(git rev-parse --short HEAD 2>/dev/null || echo "0000000")
pkgrel=1
pkgdesc="Arunachalam's Netwatch: Real-Time Network Intrusion Monitor & Defensive Security Tool. Built for the Tamilnadu Arch Linux community."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/netwatch"
license=('MIT')
depends=('python' 'python-psutil' 'python-scapy' 'python-requests')
makedepends=('git')
provides=('netwatch')
conflicts=('netwatch')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/netwatch"
  install -Dm755 netwatch.py "$pkgdir/usr/bin/netwatch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
