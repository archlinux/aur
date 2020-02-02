# Maintainer: mexus <gilaldpellaeon@gmail.com>
pkgname=dua-cli-bin
pkgver=2.1.13
pkgrel=1
pkgdesc="A tool to conveniently learn about the disk usage of directories, fast!"
provides=("dua-cli")
conflicts=("dua-cli")
arch=('x86_64')
url="https://github.com/Byron/dua-cli"
license=('MIT')
depends=()
makedepends=()
source=(
    "https://github.com/Byron/dua-cli/releases/download/${pkgver}/dua-${pkgver}-x86_64-unknown-linux-musl.tar.gz"
    "https://github.com/Byron/dua-cli/archive/${pkgver}.tar.gz"
)
md5sums=(
    '71fd506ea2a8d347d1bfb1ed78b96e03'
    '83c852636cfaaa64f19f5a2ee0ac8c6d'
)

package() {
    cd "$srcdir/"
    install -Dm 644 "dua-cli-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "dua" "$pkgdir/usr/bin/dua"
}
