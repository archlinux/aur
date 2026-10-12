# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>

pkgname=keifu-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc' 'libgcc' 'git')
depends_x86_64=('zlib')
provides=('keifu')
conflicts=('keifu')
source=("LICENSE-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/LICENSE"
        "README.md-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/README.md")
source_x86_64=("keifu-v$pkgver-x86_64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("keifu-v$pkgver-aarch64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('fff55e233457a73b20e6b2e9b37f9ecc18a4addc63ad8785e7d8fd97f0acdae7'
            '3272d8d80bfaf4f734805caf3c62d05401324a0d0526f4ee7d1f790cb79b08f8')
sha256sums_x86_64=('3eab9bfb08bdef778717f29d286a3a5c9e5ca539717faaee498968b9bb56a88b')
sha256sums_aarch64=('0b883b837f10e8f15b5592881adfbb17b92f7b81c2d89b77e93500cae0d96cff')

package() {
    install -Dm755 "$srcdir/keifu" "$pkgdir/usr/bin/keifu"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md-v$pkgver" "$pkgdir/usr/share/doc/keifu/README.md"
}
