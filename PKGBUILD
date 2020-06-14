# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: mexus <gilaldpellaeon@gmail.com>

pkgname=dua-cli-bin
pkgver=2.6.1
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
sha256sums=('2324a23375788ac09005ae6577b44218'
         'd01992cf6924d1287263d35b2086b478')

package() {
    cd "$srcdir/"
    install -Dm 644 "dua-cli-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "dua-v${pkgver}-x86_64-unknown-linux-musl/dua" "$pkgdir/usr/bin/dua"
}
