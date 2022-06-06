# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.17
pkgrel=2
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    armv6h) _pkgarch="armv6"
sha256sums=('4e7ac340b9586bd135509663aea1c5df0642d676fc8ba6832c288d0745cc31ba')
           ;;
    x86_64) _pkgarch="x86_64"
           ;;
    armv64h) _pkgarch="arm64"
           ;;
    i686) _pkgarch="i386"
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
