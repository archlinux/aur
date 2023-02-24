# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.22
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    armv6h) _pkgarch="armv6"
	sha256sums=('1db5d436d13fe4130f56252951e39fa3d5b9d0ac6c24073d3c9160543ffd68f3')
           ;;
    x86_64) _pkgarch="x86_64"
	sha256sums=('905c4af2f809eae98075cec78c4c26e5d933072bc8f531e8df5a5f68f7651354')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('23f7c75d5eef5c4fe55abde96a07797e8ab352102fe8808103b4003561cefb0c')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('4e1501fac1d023bf732f9bd4a87d96a48d0fcb847232444f74e1404385af77be')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
