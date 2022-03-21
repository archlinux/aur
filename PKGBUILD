# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=redis-cell
pkgver=0.3.0
pkgrel=1
pkgdesc="Redis module that provides rate limiting in Redis as a single command."
arch=("x86_64")
url="https://github.com/brandur/redis-cell"
license=("MIT")
depends=("redis")
source=("${url}/releases/download/v${pkgver}/redis-cell-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("42a2a3c7af46cef5e3e3dd76d9cbe0c216bf207c4d4d9c41b5195d813b88983c")

package() {
    install -D "libredis_cell.so" "${pkgdir}/usr/lib/redis/libredis_cell.so"
}
