pkgname=susshi-bin
pkgver=0.15.4
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
b2sums=(c8cece90a884700a802c7d904f9f29d0749ec38db1b4a2e66455d3dac8be9d90c7c317ad8a6768ab6116f07d5d3cdba5072d47a860249f505cc4569b0437696d)
b2sums_x86_64=(86b2d8085db034fe46f78936288e458d378de24cc0a91fafb47e5a560ef90180f44da038289f84a834d46de83502668a26006847649d1426625e75b1b976590e)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
