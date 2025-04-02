# Contributor: wilke
# Maintainer: tee < teeaur at duck dot com >
pkgname=harsh-bin
pkgver=0.10.16
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
sha256sums=('9307e2045d5ae1c437db61f49dbc79896e2abd0dbfd895e8fd8fb1d16f9be123')
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
