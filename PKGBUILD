# Maintainer: mexus <gilaldpellaeon@gmail.com>
pkgname=dua-cli-bin
pkgver=2.3.9
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
    '33007833df89ff1727443782d7286c97'
    '3def7b07ae21d880971e713ec32003e9'
)

package() {
    cd "$srcdir/"
    install -Dm 644 "dua-cli-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "dua-v${pkgver}-x86_64-unknown-linux-musl/dua" "$pkgdir/usr/bin/dua"
}
