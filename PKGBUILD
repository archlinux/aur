# Maintainer: lau96 <lau9639@outlook.com>
pkgname="hbuilderx"
pkgver="4.84.2025110307"
pkgrel=1
pkgdesc="cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。"
arch=('x86_64')
url="https://www.dcloud.io"
license=('unknown')
source=("https://download1.dcloud.net.cn/download/HBuilderX.$pkgver.linux_x64.full.tar.gz")
sha256sums=('d565b7929ab255787f115c615841d2a1ad73f40b528c6c00c44f355084ea46a7')
options=(!strip !debug)

package() {
	install -d "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/$pkgname/"* "$pkgdir/opt/$pkgname"
}
