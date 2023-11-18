# Maintainer: Yao Yunshan <qimuzi@aliyun.com>
pkgname=clangd
pkgver=16.0.2
pkgrel=1
pkgdesc="Stable clangd official release"
arch=('any')
url="https://github.com/clangd/clangd"
license=('Apache')
source=("$url/releases/download/$pkgver/clangd-linux-$pkgver.zip")
sha256sums=('928f826340e322e3eed534f4b215e5c403c22e73dbfa66ae4fd8f44e22f4ca28')

package() {
	mkdir -p $pkgdir/opt
	mkdir -p $pkgdir/usr/bin
	cp -r $srcdir/clangd_$pkgver $pkgdir/opt/clangd
	ln -sf /opt/clangd/bin/clangd $pkgdir/usr/bin/clangd
}
