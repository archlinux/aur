#Maintainer: purofle <3272912942@qq.com>
pkgname=mirai-console-loader
pkgver=1.0.5
pkgrel=1
pkgdesc="模块化、轻量级且支持完全自定义的 mirai 加载器。"
arch=("any")
url="https://github.com/iTXTech/mirai-console-loader"
lincense=("AGPL3")
depends=("jdk11-openjdk")
makedepends=("unzip")
source=("$url/releases/download/v$pkgver/mcl-$pkgver.zip")
md5sums=('927451fcd6553cc173170346bd99dca9')

package() {
	mkdir -p $pkgdir/opt/mcl
	cp -r $srcdir/* $pkgdir/opt/mcl
	chmod -R 777 $pkgdir/opt/mcl
}
