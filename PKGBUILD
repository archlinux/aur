#Maintainer: korn201234 <aaronzschauer@gmail.com>
pkgname=apac
pkgver=0.9.2
pkgrel=1
pkgdesc="A simple arch aur helper."
arch=('any')
url="https://git.aaronhosting.xyz/korn20123/apac"
license=('GPL-3-or-later')
makedepends=(git go)
source=("git+$url")
sha256sums=('SKIP')
build() {
    cd "$srcdir/$pkgname"
    go build
}
package() {
    install -Dm755 "$srcdir/$pkgname/apac" "$pkgdir/usr/bin/$pkgname"
}
