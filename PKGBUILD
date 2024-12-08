# Contributor: wilke
# Maintainer: tee < teeaur at duck dot com >
pkgname=harsh-bin
pkgver=0.10.6
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
sha256sums=('6116b2f26039b59b4bb496dfbd8ca768387f3386b8c6d183b016bac9f8bfe3e1')
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
