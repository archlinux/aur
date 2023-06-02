# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=2.9.1
pkgrel=2
pkgdesc="A command line tool for browsing Hacker News in your terminal. Pre-compiled."
arch=('i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
provides=('circumflex')
conflicts=('circumflex')
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_32-bit.tar.gz")
source_pentium4=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_32-bit.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_64-bit.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_arm64.tar.gz")

sha256sums_i686=('216b103db78ff366ab622d88f92e891b91856ff9b0981a23847f8a5393b750d1')
sha256sums_pentium4=('216b103db78ff366ab622d88f92e891b91856ff9b0981a23847f8a5393b750d1')
sha256sums_x86_64=('216b103db78ff366ab622d88f92e891b91856ff9b0981a23847f8a5393b750d1')
sha256sums_aarch64=('216b103db78ff366ab622d88f92e891b91856ff9b0981a23847f8a5393b750d1')

package() {
    install -Dm755 circumflex "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 -t "$pkgdir/usr/share/man/man1/"
}
