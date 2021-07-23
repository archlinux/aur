# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.6.6
pkgrel=2
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
url="https://github.com/afnanenayet/diffsitter"
provides=('diffsitter')
conflicts=('diffsitter')
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/diffsitter-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/v$pkgver/diffsitter-i686-unknown-linux-gnu.tar.gz")
source_arm=("$url/releases/download/v$pkgver/diffsitter-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/diffsitter-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7a3be76241b2a2f4b616561eb54dc0cf4587c935d690615defc80398e8262f80')
sha256sums_x86_64=('7bbc746871e4b9771a6812d2c81aedc7664eb5913a0b8e84a789b4853e00bcb9')
sha256sums_i686=('42d6e46bee92a932757e1780c45ef9096d2e75ce13222850c2b438f8231c3169')
sha256sums_arm=('52c69fc97c7583330eb8ad2cd551458c2c0e7f08db43178f212ffe51840cd630')
sha256sums_aarch64=('701896651385e8c1662f44c5005e87b6de9e238572e208dded358dc3e138d606')

package() {
    install -Dm755 "$srcdir/diffsitter-$arch-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

