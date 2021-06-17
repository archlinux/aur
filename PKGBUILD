# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe/tree/master/clients/go/cmd/zbctl"
license=('Apache')
depends=()
source=(
    "$pkgname-$pkgver::https://github.com/zeebe-io/zeebe/releases/download/$pkgver/zbctl")
# noextract=("$pkgname-$pkgver")
b2sums=('8876841cb4391ab66e375d187722754bad355e62c5665861d50c6aeb1223ee4f3632827f63c90655fae10b04faa594e9cd7cc840822075ba995fca0e7677db87')

package() {
    install -Dm755 $srcdir/$pkgname-$pkgver $pkgdir/usr/bin/$pkgname
}
