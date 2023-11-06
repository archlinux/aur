# Contributor: Asuka Minato
pkgname=typst-book-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple tool for creating modern online books in pure typst"
arch=(x86_64 aarch64)
url="https://myriad-dreamin.github.io/typst-book/"
license=('Apache')
depends=(glibc gcc-libs)
source_x86_64=("https://github.com/Myriad-Dreamin/typst-book/releases/download/v$pkgver/typst-book-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(https://github.com/Myriad-Dreamin/typst-book/releases/download/v$pkgver/typst-book-aarch64-unknown-linux-gnu.tar.gz)
sha256sums_x86_64=('3a38eb0acef2257370014d5bb77722d4086cac297dd1f8992e74ab2210104dd8')
sha256sums_aarch64=('cec75b2fafde7885fc318af0c2b25920feb19a78fc027bfeb6f3bf53a9a6daca')

package() {
	find . -name "typst-book" -exec install -Dm755 {} -t $pkgdir/usr/bin \;
}
