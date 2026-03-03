pkgname=susshi-bin
pkgver=0.12.1
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
b2sums=(56d8d5eb3b92a94bda82c5ee30e9d6661fdd32cf7af584e5b6f6f9c02283287561222c5b71e34a8ae7030a0fad099c6d57811c3c419b17629456fd5ec60114e6)
b2sums_x86_64=(cbadd3e4b06a794939e546ca440ee8d1ddadff768fcfe723ef011e505a6fa1c94f70d8616a1b4c86e34a2e61c08d317d395733f53770b69fa1b8b93cbc852cbe)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
