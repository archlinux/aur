# Contributor: wilke
# Maintainer: tee < teeaur at duck dot com >
pkgname=harsh-bin
pkgver=0.10.21
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
sha256sums=('743125ce8f4b1d567e1063b8263f882501a508f90497fe0654c31849dd01751e')
           ;;
    armv64h) _pkgarch="arm64"
           ;;
    i686) _pkgarch="i386"
           ;;
esac

source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
