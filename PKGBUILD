pkgname=susshi-bin
pkgver=0.15.0
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
b2sums=(1d0066e7a790821b86fc7f827a5e95d1a2a80f1e1b5e6ccc4519f3d0bff15ade827ac3c342f276d5d9e2c9869f5f76c25834200a3144c0b1bd6bf9a6fcfcfd9e)
b2sums_x86_64=(bc68128d9e8bc74a38d47c0947c306bbe6226fc94cc864a830231117d37105f67e0f0534cdb356e1f4b77cbb4436034ea5207acae2b89643d6cbade725c77b45)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
