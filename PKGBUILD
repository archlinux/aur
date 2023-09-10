# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.8.29
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('7c8f54f6b7e13e317a06b4c1ae55c361ab888f2b996c43dee512734400e31ec8')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('6c758c7a30825cce77dfa16461908428257ccb1168aa1ffbef361c2480dc042d')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('d54a877aa7eecd405bc0e55116d7fd0d880ece1395d4bd962dc9f912484736a7')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
