pkgname=susshi-bin
pkgver=0.8.6
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
b2sums=(cdcec7b685b8353a6c980ac26386e2a224426f5af5ff3e8af9c30192711cca0e80eaeae721d818b3c2805a9dc0b031c340d5b138d911861a202bb6411707632e)
b2sums_x86_64=(65475930c1aefce45198051ae0f002d6de4789af063f0d57bf19777bfc1e9abd834d78aee3179ce63871c45613c4a070e8d1115a6f0d5330a793cd280b4ebf2e)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
