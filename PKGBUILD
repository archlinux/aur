# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.20
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    armv6h) _pkgarch="armv6"
	sha256sums=('8ccd427cf6bc31885b46618bfb1451a70bb918ef6d44183217967a9c0ad78579')
           ;;
    x86_64) _pkgarch="x86_64"
	sha256sums=('c74f4a90b0485843d3570901c5cc46edde0437c8ca32e48088ff23781ebe3b68')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('ba24a4a217bcf5ff18eebd8f9dadee2d1923438624dd9e5f3ac5902d6b392754')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('734f63de28401f73d84ca39234979ce059a788629cf88c1da4388aee621555b5')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
