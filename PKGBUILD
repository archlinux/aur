pkgname=susshi-bin
pkgver=0.10.1
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
b2sums=(76ff1f986c56ea9c2a68c891ce8c0e5664decd12d2cd0fffdb25f91e4ab4431c7b0511a8753253b85056f5d516f4a6a860d75088d781f70fd4567a8164916b72)
b2sums_x86_64=(e144b2609baf585e4887e915187f323e794b5371d03e51fbfa6afa95f378086fc47da09b41b01ea80a1c53b1999239776ba9f741669fae13712ed1bbe407cffb)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
