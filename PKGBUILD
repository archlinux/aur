# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.28
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('18474fd72d6d77a2499199402bac9e991ca493e953ef95b9784131dfb346bf79')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('4d473122497f7ef4b4e4c44f06351e3344f768d8826836abcfdae2448729a01c')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('8f1b5644fb311342ac6f0f8c753aa3dac258c8f99b79786671ae66c011f96bad')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
