# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.27
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('540c356abc3fa270fa04c441bbda7bd45226e7c1e04941f368dc4527b7bff96c')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('52c8ab5c7cdb3a065474dc5054b52b550c072b16213e62dc4b45ccc7757e7d9d')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('2c1157807675980ccca4a40f430cf1d2d3bcfb337480403b8e99e35b391eb7e1')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
