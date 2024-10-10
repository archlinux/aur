# Maintainer: Martin Petik
pkgname=ssysi
pkgver=1.0.1
pkgrel=2
pkgdesc="A lightweight system information tool written in Bash"
arch=('any')
url="https://github.com/stuffbymax/ssysi"
license=('MIT')
depends=('bash' 'sysstat' 'upower')
source=("https://raw.githubusercontent.com/stuffbymax/ssysi/refs/heads/main/ssysi.sh")
sha256sums=('94fd708c2229644a5f775964599bb6d1d106a0c2e21f1e567d2f43eca27f5f08')

package() {
    install -Dm755 "$srcdir/ssysi.sh" "$pkgdir/usr/bin/ssysi"
}
