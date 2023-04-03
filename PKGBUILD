# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.24
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('3c94ed56f19e136b08eaeb9333d2fc88144bc644a894aec120b88e809e64fd6b')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('66ce0dccfa119c8b72b135eacc4a9453a1205ef9ecf379ab10d0a1167c65d434')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('305c6f678fd543033bf964a79e7ca3d6b9b98148a7270b7c0fbd13088e3604bc')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
