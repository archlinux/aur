pkgname=susshi-bin
pkgver=0.10.2
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
b2sums=(b965586f035e0708c3636ddbc2321b0a991416092bdad0db2fbf50d1b496e2bc23f9d46af12c94108889c351097b20f112e242a5d4f373154bdba1539a32e0e2)
b2sums_x86_64=(a91e8755723b4f04c98524f92a84d17e096a16f6eb566c9f3053a673732c7ceb9d80a299ea70d46ab6518916a0ecdf570afea683caba50d50872951028a8fcc4)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
