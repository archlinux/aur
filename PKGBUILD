pkgname=susshi-bin
pkgver=0.13.5
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
b2sums=(079014ba12e6ebe958572fd29afef2d70f9bc98fbf11e52258ac1bd5afb9022484f34935a021c3789f5724c4a6b512fd115ee350a29264b358af8e25d3274a3b)
b2sums_x86_64=(d993b2374cf1cb4d52ccbccdff22df8d88aebe09568e2cf25d0e3e16158a1f578f6efdbb5b381255c5af75f3137e5cd6185f47cc7dcb5af7bacb409817bf3029)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
