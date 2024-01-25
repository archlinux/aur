pkgname=byteblitz
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A CLI tool for viewing the binary content of files."
arch=('x86_64')
url="https://github.com/noahra/byteblitz"
license=('GPL3')
depends=()
makedepends=('git')
source=("https://github.com/noahra/byteblitz/releases/download/v1.0.0/byteblitz-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('824d39db6ade9f25a1f1d044b2bc85029369a1df5cf3084e3f31672577b7c1cf')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 byteblitz "$pkgdir/usr/bin/byteblitz"
}

