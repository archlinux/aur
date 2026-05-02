#Maintainer: korn201234 <aaronzschauer@gmail.com>
pkgname=apac
pkgver=0.9.3
pkgrel=1
pkgdesc="A simple arch aur helper."
arch=('any')
url="https://git.aaronhosting.xyz/korn20123/apac"
license=('GPL-3-or-later')
makedepends=(go)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6359b28a6bc822a5befaed03b56c2fe41c3ba4da9fa54c16b8d76e3613c65966')
build() {
    cd "$srcdir/$pkgname"
    go build
}
package() {
    install -Dm755 "$srcdir/$pkgname/apac" "$pkgdir/usr/bin/$pkgname"
}
