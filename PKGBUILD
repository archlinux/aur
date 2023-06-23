pkgname=libtree-bin
pkgver=3.1.1
# Contributor: Asuka Minato
pkgrel=1
pkgdesc="ldd as a tree"
arch=('x86_64' 'i686' aarch64 armv7h armv6h)
url="https://github.com/haampie/libtree"
license=('MIT')
conflicts=(libtree libtree-git)
provides=(libtree)
source=(https://raw.githubusercontent.com/haampie/libtree/37d3d040dfe18b2762995c058818928559d7ca2a/LICENSE)
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/haampie/libtree/releases/download/v${pkgver}/libtree_x86_64")
source_i686=("$pkgname-$pkgver-i686::https://github.com/haampie/libtree/releases/download/v${pkgver}/libtree_i686")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/haampie/libtree/releases/download/v${pkgver}/libtree_aarch64")
source_armv7h=("$pkgname-$pkgver-armv7h::https://github.com/haampie/libtree/releases/download/v${pkgver}/libtree_armv7l")
source_armv6h=("$pkgname-$pkgver-armv6h::https://github.com/haampie/libtree/releases/download/v${pkgver}/libtree_armv6l")
sha256sums=('820cdf88ed9cd2491143a8d1c5452f58a92c8bd5b4b68558ad6f23508e367d1e')
sha256sums_x86_64=('49218482f89648972ea4ef38cf986e85268efd1ce8f27fe14b23124bca009e6f')
sha256sums_i686=('230a163c20f4a88a983d8647a9aa793317be6556e2c6a79e8a6295389e651ef5')
sha256sums_aarch64=('c5d4fbcd4e3fb46f02c028532f60fcf1c92f7c6aad5b07a991c67550c2554862')
sha256sums_armv7h=('17f493621e7cc651e2bddef207c1554a64a114e1c907dbe5b79ff0e97180b29e')
sha256sums_armv6h=('16f5a7503a095bd88ebc5e21ec4ba8337c5d9712cac355bf89399c9e6beef661')

package() {
  install -Dm755 $pkgname* $pkgdir/usr/bin/libtree
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

