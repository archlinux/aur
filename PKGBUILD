#Maintainer: korn201234 <aaronzschauer@gmail.com>
pkgname=apac
pkgver=0.9.2
pkgrel=2
pkgdesc="A simple arch aur helper."
arch=('any')
url="https://git.aaronhosting.xyz/korn20123/apac"
license=('GPL-3-or-later')
makedepends=(go)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('a5667a593d545db1c8a78596be20f8c196866c4f19add57294be7d4aa463f0b4')
build() {
    cd "$srcdir/$pkgname"
    go build
}
package() {
    install -Dm755 "$srcdir/$pkgname/apac" "$pkgdir/usr/bin/$pkgname"
}
