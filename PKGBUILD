# Maintainer: krisdoodle45
pkgname=harsh-bin
pkgver=v0.8.16
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

case "$CARCH" in
    armv6h) _pkgarch="armv6"
	    sha256sums=('9f05892e4e6121ca29f899a89c5b48e83abb7076c1584f14631fdcf2cbd2eb78')
           ;;
    x86_64) _pkgarch="x86_64"
	    sha256sums=('b1db193b1743a8bd7b1c1577d3142f702fb450c95de6d69e1b7d1595de0a36dc')
           ;;
    armv64h) _pkgarch="arm64"
	    sha256sums=('cff8e3ec8ed22986c18033ef4ec18a359fc61f476ea25e523dad1b82ee497fee')
           ;;
    i686) _pkgarch="i386"
    	    sha256sums=('d2294f7aba1b593ac4f265346321de0d968d4fd0289b6d26ba22f2f503059343')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
