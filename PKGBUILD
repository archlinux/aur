pkgname=susshi-bin
pkgver=0.13.2
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
b2sums=(c029435f5022898e4eeb196857f7e526479f1e937bd9eb7a8c1760648ca6ada1b6b98b760e6cdf2e498cb794f9f5ec7303faa6cbf7839a42b4b9f3dcd9498bed)
b2sums_x86_64=(84e3b96596a05a53f7879b70bd19e5d36df9aa3c8193bbc4cae9863182d401611ead332494b4125a5442da00671189e3569fd106cc628c2b4d3d98f2655eb3eb)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
