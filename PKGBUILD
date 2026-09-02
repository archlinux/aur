# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('keifu')
conflicts=('keifu')
source=("LICENSE-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/LICENSE"
        "README.md-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/README.md")
source_x86_64=("keifu-v$pkgver-x86_64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("keifu-v$pkgver-aarch64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('fff55e233457a73b20e6b2e9b37f9ecc18a4addc63ad8785e7d8fd97f0acdae7'
            'e6bccc56665656d569a1f0ce1af8bb83d82b9a1acafa87a532a7a6913c5c2567')
sha256sums_x86_64=('e604044094036d32e4e299f1e83403a9d9b272f89391c22bc9702860491bd4a8')
sha256sums_aarch64=('e361563db635b91d2222cc109d6c6412438f9f8ca42f250e7d00974048752861')

package() {
    install -Dm755 "$srcdir/keifu" "$pkgdir/usr/bin/keifu"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md-v$pkgver" "$pkgdir/usr/share/doc/keifu/README.md"
}
