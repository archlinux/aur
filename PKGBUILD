pkgname=susshi-bin
pkgver=0.10.0
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
b2sums=(d8ef8fbf71d47e275a290c6c2f7b04e7abeae92f4959ff81e7fdf969a413c6be2031a3599e017bb87e6e128e34aed170485f4cfb33475d8184ed015b4254242d)
b2sums_x86_64=(dc78d828957923442d898f0abee9bd31e08d065407eb46572ac35eb5753afd311257824e5b3d750065387e9accdae98bea920bfa4219fcb9380ad67e2731462d)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
