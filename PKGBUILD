# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
url="https://github.com/afnanenayet/diffsitter/"
provides=('diffsitter')
conflicts=('diffsitter')
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('MIT')
source=(
    "$url/releases/download/v$pkgver/diffsitter-$arch-unknown-linux-gnu.tar.gz"
    "$url/archive/v$pkgver.tar.gz"
)
sha256sums=(
    '7bbc746871e4b9771a6812d2c81aedc7664eb5913a0b8e84a789b4853e00bcb9'
    '7a3be76241b2a2f4b616561eb54dc0cf4587c935d690615defc80398e8262f80'
)

package() {
    install -Dm755 "$srcdir/diffsitter-$arch-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

