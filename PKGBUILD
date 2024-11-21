# Maintainer: martin Petik <martinp6282@gmail.com>
pkgname=ssysi
pkgver=1.1.4
pkgrel=4
pkgdesc="A lightweight system information tool written in Bash"
arch=('any')
url="https://github.com/stuffbymax/ssysi"
license=('MIT')
depends=('bash' 'sysstat' 'upower')
source=("https://raw.githubusercontent.com/stuffbymax/ssysi/refs/heads/main/ssysi.sh")
sha256sums=('a3af627bd5f372949e672c9bd8f8622928dc0532fdc447f7fb38ebcc42b79af8')

package() {
    install -Dm755 "$srcdir/ssysi.sh" "$pkgdir/usr/bin/ssysi"
}
