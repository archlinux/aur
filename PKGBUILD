# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.25
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('4ef706cb8c1932e667416a4888c0e539d5aed8001b1870315603cd31cde5e335')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('5b8a1c4b2257a461e9279208e9ac232b175bfa5750614873893137a64e32c7ea')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('0b5904f7d0bc2e1409806d57be6474ae5ca3a601e9bc4c160f75d468cc28c906')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
