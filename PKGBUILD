pkgname=susshi-bin
pkgver=0.13.3
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
b2sums=(738319a8d2df13e46fa656dc3827ceda46ed966649ed982e974d03a0bf5ce98993fdd586babb77f62a946f162be1f4105c73e557fe4aff26b5c1f072ccfd2c55)
b2sums_x86_64=(e6676f5a4e5f91471cb28802350006a2da82512e8d8a934d1784b20a0bc4d17537d25d7d92e56264aa6501d83f603953af3c5787a398bb67eeb52f810739ca0e)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
