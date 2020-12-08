# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=0.25.2
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe/tree/master/clients/go/cmd/zbctl"
license=('Apache')
depends=()
source=(
    "$pkgname-$pkgver::https://github.com/zeebe-io/zeebe/releases/download/$pkgver/zbctl")
# noextract=("$pkgname-$pkgver")
sha1sums=('853ab99778733be739d622b64b570b6db1365d64')

package() {
    install -Dm755 $srcdir/$pkgname-$pkgver $pkgdir/usr/bin/$pkgname
}
