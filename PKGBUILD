# Maintainer: Mark Pendlebury <mark.pendlebury@elesoft.dev>
pkgname=cwtail
pkgver=2026.10.2
pkgrel=1
pkgdesc="CloudWatch Logs TUI — browse, explore, and live-tail log groups"
arch=('x86_64')
url="https://github.com/Elesoft-Dev/CloudwatchTail"
license=('MIT')
depends=('glibc')
source=("https://github.com/Elesoft-Dev/CloudwatchTail/releases/download/\${pkgver}/cwtail")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    install -Dm755 "\$srcdir/cwtail" "\$pkgdir/usr/bin/cwtail"
}
