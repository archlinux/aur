# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.17
pkgrel=3
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    armv6h) _pkgarch="armv6"
	sha256sums=('3f742b99d9ad9659b23142345f03d8871e5d0ab9b638cd4cbc5c9b36d1837029')
           ;;
    x86_64) _pkgarch="x86_64"
	sha256sums=('4e7ac340b9586bd135509663aea1c5df0642d676fc8ba6832c288d0745cc31ba')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('a9b12df4a7e8edfbd00c3b89572ca6474865f364e31ecee733c04fc0ab02f89b')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('d7e718fd2742d4b21df84e072a18f103f6094bc819fcc46e759d25496134cd5c')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
