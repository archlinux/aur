# Maintainer: crl <crl18039102576@126.com>

pkgname=bs-thread-pool
pkgver=4.1.0
pkgrel=1
pkgdesc="BS::thread_pool: a fast, lightweight, modern, and easy-to-use C++17 / C++20 / C++23 thread pool library"
url="https://github.com/bshoshany/thread-pool"
arch=('any')
license=('MIT')
depends=('gcc-libs')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be7abecbc420bb87919eeef729b13ff7c29d5ce547bdae284923296c695415bd')

package() {
    cd "$srcdir/thread-pool-$pkgver"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 include/BS_thread_pool.hpp -t "$pkgdir/usr/include"
    install -Dm644 include/BS_thread_pool_utils.hpp -t "$pkgdir/usr/include"
}
