pkgname=baml-bin
pkgver=0.11.0.alpha.4281
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4281/baml-language-0.11.0-alpha.4281-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4281/baml-language-0.11.0-alpha.4281-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('39882dd5cad860dda97902280c76cf9bb31be27615f2d72ecc6b58aefc3e1965')
sha256sums_aarch64=('f3e1b1421b50d1c012d7bc28d04ab61240c3b3ae3d22c8f7b281bce626ab980e')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
