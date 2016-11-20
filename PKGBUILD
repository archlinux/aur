# Maintainer: Jason White <jasonaw0 at gmail dot com>
pkgname=button-lua
pkgver=0.0.4
pkgrel=1
pkgdesc="Used with Button. Allows generating build descriptions with Lua."
arch=('i686' 'x86_64')
url="https://github.com/jasonwhite/$pkgname"
license=('MIT')
depends=('lua')
optdepends=()
makedepends=('xxd')
source=("https://github.com/jasonwhite/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('6cead1cfa812e7388f5a746ae8e3446f')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
