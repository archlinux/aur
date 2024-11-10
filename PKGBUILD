# Maintainer: Martin Petik
pkgname=ssysi
pkgver=1.1.3
pkgrel=3
pkgdesc="A lightweight system information tool written in Bash"
arch=('any')
url="https://github.com/stuffbymax/ssysi"
license=('MIT')
depends=('bash' 'sysstat' 'upower')
source=("https://raw.githubusercontent.com/stuffbymax/ssysi/refs/heads/main/ssysi.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/ssysi.sh" "$pkgdir/usr/bin/ssysi"
}
