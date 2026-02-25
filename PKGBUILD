# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=mermaid-rs-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast native Rust Mermaid diagram renderer. No browser required."
url="https://github.com/1jehuang/mermaid-rs-renderer"
license=('MIT')
source=("mmdr-v$pkgver.tar.gz::https://github.com/1jehuang/mermaid-rs-renderer/releases/download/v${pkgver}/mmdr-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE-v$pkgver::https://raw.githubusercontent.com/1jehuang/mermaid-rs-renderer/v${pkgver}/LICENSE"
        "README.md-v$pkgver::https://raw.githubusercontent.com/1jehuang/mermaid-rs-renderer/v${pkgver}/README.md")
sha256sums=('a4bdd20f95150a8953463ea6d0dd5b77df0a25d37150781ebf342e252347d2a5'
            '57ed7943c34463678a150769d4a4f6c95d2a190fe2c1977f74bc883492c94b86'
            'ccbd14bca88cd82d7a1f6804f77d1c175f2ebc6562adb25e339d47d9effa5bb9')
arch=('x86_64')
provides=('mermaid-rs')
conflicts=('mermaid-rs')

package() {
    install -Dm755 "$srcdir/mmdr" "$pkgdir/usr/bin/mmdr"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md-v$pkgver" "$pkgdir/usr/share/doc/mermaid-rs/README.md"
}
