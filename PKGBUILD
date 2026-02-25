# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source_x86_64=("keifu-v$pkgver-x86_64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("keifu-v$pkgver-aarch64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/LICENSE"
        "README.md-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/README.md")
sha256sums=('fff55e233457a73b20e6b2e9b37f9ecc18a4addc63ad8785e7d8fd97f0acdae7'
            'e838903186895c136b60bdd78b74dbc440a84d170e78b9eb2e6cf820b558dce1')
sha256sums_x86_64=('c6df0239734c140bb791c77c75bab034d37c0dd1438d3c772073f4097345a5d9')
sha256sums_aarch64=('ebb9400332141cd23b2c5357d90417da6b16002240eb9023224e4cfe02f9078e')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('keifu')
conflicts=('keifu')

package() {
    install -Dm755 "$srcdir/keifu" "$pkgdir/usr/bin/keifu"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md-v$pkgver" "$pkgdir/usr/share/doc/keifu/README.md"
}
