# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.31
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('d9241b7d320d94fc301d824ccec86128c44a4e5b6a9b71bf3f6e8abb20d4c03d')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('86ada09fd62e93398de62f86cb85058faeb98dbc10dd69d7b21e8daf04e5aace')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('d755eb74a896152567cf9a5be01a1e53901bdfb21eedfde5193537cc55dce986')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
