# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.26
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('037ada1763f0f7bc776cb506050ba72cc662e118f3bc565ffc293ffaf403433d')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('b6223de7db3be44aed74364a491c101ee85e302ebfdbb251170f46540986d358')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('b8f3b7a4cc2d49a152ba6e566d0419419a0700de280529417d9d1b0b218d4082')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
