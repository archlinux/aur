pkgname=susshi-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager (pre-built binary)'
url='https://github.com/yatoub/susshi'
license=('MIT')
depends=('openssh')
arch=('x86_64')
provides=('susshi')
conflicts=('susshi')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("susshi-${pkgver}-linux-amd64::https://github.com/yatoub/susshi/releases/download/v${pkgver}/susshi-linux-amd64")
b2sums=(24903fcb4f329e232124c687d63c5ef144415b961a0e94a804f7ad75dde64d8769326879064d9e40d62bff6a6204f0468181872f66b2c75976a2375cb9850e21)
b2sums_x86_64=(969f5dbe4751b39dc40c5adca9dc56bef80a2fc56c6251bdbca457d1e46de80a5c5f4fc2fde9526bdda54e84dad9b257aaeadf04bc08326f8ffd437629e7cda0)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
