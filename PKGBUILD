# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.10.2
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('f649a07fe576416f6a3e28435e99518a257ee4458aef5fcf82c8d7ea05fee18f')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('8cb040c7df7eace78d32e0cabf22d6af83bc1f93599c37da6828762c5d199f9e')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('0a3245f2f350de6353e920e2928686fa8a6e7037e76e98e9140726fd7d7b388e')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
