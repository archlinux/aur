# Maintainer: mexus <gilaldpellaeon@gmail.com>
pkgname=dua-cli-bin
pkgver=2.3.8
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
    "https://github.com/Byron/dua-cli/releases/download/v${pkgver}/dua-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
    "https://github.com/Byron/dua-cli/archive/v${pkgver}.tar.gz"
)
md5sums=(
    'c95ac4146d5888ed7ff593ed9612c8f5'
    'ac49a90e54b40b19ee74b182a7e563c7'
)

package() {
    cd "$srcdir/"
    install -Dm 644 "dua-cli-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "dua" "$pkgdir/usr/bin/dua"
}
