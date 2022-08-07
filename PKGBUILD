# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.18
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    armv6h) _pkgarch="armv6"
	sha256sums=('ce0e14833e05abd4d22eca2dd9c5328e08d7bcdda02a220545f0ca2c446cf9c8')
           ;;
    x86_64) _pkgarch="x86_64"
	sha256sums=('30ba187bba5e4a71a13db067b290af972fd755d2cc4ffe5a0b48453830013950')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('a7f8d07357f6c56c85e8c6c5866ffac3b112c4d928b562521eb90da6371d49f8')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('dfb4fa5ecf835b7e4c5767a009faca9b6c9280b83cc517793b904a78f899fc65')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
