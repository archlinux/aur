# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
url="https://github.com/afnanenayet/diffsitter"
provides=('diffsitter')
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/diffsitter-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/v$pkgver/diffsitter-i686-unknown-linux-gnu.tar.gz")
source_arm=("$url/releases/download/v$pkgver/diffsitter-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/diffsitter-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('71b2cc9a9f3bba912de82bd849e063992561d531b4bdee60f3b0abe761a29fae')
sha256sums_x86_64=('7e2d59a02165e9d6a26a070ada386d95f3510bd4c25cc51b9558b93e677be2ad')
sha256sums_i686=('a203b60f31026c427565fd64ba25c63abf8403a750e224277823991c044a17ea')
sha256sums_arm=('1c72a5e8f46dc9ad0091f0107c50a33cad4682b7591d043eebda7f0de2505a42')
sha256sums_aarch64=('40c319c327a306286f998c1fe5e572d171d0837fb5fa7ec4ccb8a9befe1900c1')

package() {
    install -Dm755 "$srcdir/diffsitter-$CARCH-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

