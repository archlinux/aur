# Maintainer: Martin Petik
pkgname=ssysi
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight system information tool written in Bash"
arch=('any')
url="https://github.com/stuffbymax/ssysi"
license=('MIT')
depends=('bash' 'sysstat' 'upower') 
source=("https://raw.githubusercontent.com/stuffbymax/ssysi/main/ssysi.sh")
sha256sums=('6912f28bbd6c2a4753ee103f75648cf9a86a3ef333bcbd8bcc6d160ea2385d6a')

package() {
    install -Dm755 "$srcdir/ssysi.sh" "$pkgdir/usr/bin/ssysi"
}
