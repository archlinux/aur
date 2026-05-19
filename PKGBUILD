pkgname=susshi-bin
pkgver=0.15.6
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
b2sums=(af01a4034280cae5f8b1d547f08486698d22ed10e7031697da9e2b5b2baa904d3ddca47ce4afc8f0092e482c2392bd73925b205974f37f4dbfc3101c7e33bdbc)
b2sums_x86_64=(f615663d8afd9db4d5368392b0dceac450de3740f413e6fd6fcdedeae509fa0e6ca2f02e9d7bb7c0b39b8b536d2879a6e14fbf47399488cd172840dbb3fae0e8)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
