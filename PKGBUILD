# Maintainer: Jason White <jasonaw0 at gmail dot com>
pkgname=button-lua
pkgver=0.0.5
pkgrel=1
pkgdesc="Used with Button. Allows generating build descriptions with Lua."
arch=('i686' 'x86_64')
url="https://github.com/jasonwhite/$pkgname"
license=('MIT')
depends=('lua')
optdepends=()
makedepends=()
source=("https://github.com/jasonwhite/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('dc3ffd0b76481640086302ea9cbaaf323c154ceb')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
