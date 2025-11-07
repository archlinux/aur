# Maintainer: lau96 <lau9639@outlook.com>
_pkgname="HBuilderX"
pkgname="hbuilderx"
pkgver="4.85.2025110510"
pkgrel=1
epoch=1
pkgdesc="cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。"
arch=('x86_64')
url="https://www.dcloud.io"
license=('unknown')
source=("https://download1.dcloud.net.cn/download/$_pkgname.$pkgver.linux_x64.full.tar.gz")
sha256sums=('ad63be64ed35c2df7efc6e6928b4c4890809f43d31f930d09d7e8657cd136692')
options=(!strip !debug)

package() {
	install -d "$pkgdir/opt/$_pkgname"
	cp -r "$srcdir/$_pkgname/"* "$pkgdir/opt/$_pkgname"
}

# makepkg -g
# makepkg --printsrcinfo > .SRCINFO
