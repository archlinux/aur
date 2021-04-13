# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=0.26.3
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe/tree/master/clients/go/cmd/zbctl"
license=('Apache')
depends=()
source=(
    "$pkgname-$pkgver::https://github.com/zeebe-io/zeebe/releases/download/$pkgver/zbctl")
# noextract=("$pkgname-$pkgver")
b2sums=('eda23e0dbce83a3932b9b5e3184b8766814c6db4d99956d1bab08be21635a54ea5834eb78c7a51339c6c4439e01ee1e417dab23c0332fed4a0b3c384f6dc2428')

package() {
    install -Dm755 $srcdir/$pkgname-$pkgver $pkgdir/usr/bin/$pkgname
}
