# Maintainer: Eli Saado <elimalkosaado@gmail.com>
pkgname=crypto-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="View the prices of (many) cryptocurrencies from your terminal"
arch=('any')
license=('MIT')
depends=('ruby')
options=()
source=("crypto-cli")
sha256sums=('001078b50c1a64b200b8901691970ec75bc8084f1c8af3a25d657c183f1ca27c')

package() {
    cd "$srcdir"
    install -Dm755 crypto-cli "$pkgdir/usr/bin/crypto-cli"
}
