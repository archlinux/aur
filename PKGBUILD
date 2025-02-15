# Contributor: wilke
# Maintainer: tee < teeaur at duck dot com >
pkgname=harsh-bin
pkgver=0.10.11
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
sha256sums=('6cfbf633797255c69499e33549db7bcf6b64cd23cc2d71383298e761b1faa44e')
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
