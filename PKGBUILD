pkgname=susshi-bin
pkgver=0.9.1
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
b2sums=(01ba16a31fc1a75f6a91ea2de8467eaee591c1002b8f038a1609c4c2d91a083fa12754b9414d1448c8d62713faef33f9123bf326e9dfa7b68b2ad5a3afc88a9b)
b2sums_x86_64=(50ce7cbf6aada7ac506dbf4130503a5371127cb8e16d4eb50f847f44e5650220627e7912e1ff57212508eb2a413bb2053fefd30a69d642e96fab7cc4d90e2f96)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
