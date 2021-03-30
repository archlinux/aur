# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zbctl
pkgver=0.26.2
pkgrel=1
pkgdesc="CLI to interact with Zeebe"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe/tree/master/clients/go/cmd/zbctl"
license=('Apache')
depends=()
source=(
    "$pkgname-$pkgver::https://github.com/zeebe-io/zeebe/releases/download/$pkgver/zbctl")
# noextract=("$pkgname-$pkgver")
b2sums=('45a0d2687457c391129285eff4b8aec6581c846be0db376a055ab27ef44727264c9615c7a68a987d7a9f3456e04e43321d41a54f6a4e810dee079081278376bb')

package() {
    install -Dm755 $srcdir/$pkgname-$pkgver $pkgdir/usr/bin/$pkgname
}
