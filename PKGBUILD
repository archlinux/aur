# Maintainer: lau96 <lau9639@outlook.com>
_pkgname="HBuilderX"
pkgname="hbuilderx"
pkgver="4.87.2025121004"
pkgrel=1
epoch=1
pkgdesc="cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。"
arch=('x86_64')
url="https://www.dcloud.io"
license=('unknown')
source=("https://download1.dcloud.net.cn/download/$_pkgname.$pkgver.linux_x64.full.tar.gz")
sha256sums=('b64685adb1b08a5f6d6b8912e2a9ead078d953fb45f813fae0e5f452a2a095a0')
options=(!strip !debug)

package() {
	install -d "$pkgdir/opt/$_pkgname"
	cp -r "$srcdir/$_pkgname/"* "$pkgdir/opt/$_pkgname"
}

# makepkg -g
# makepkg --printsrcinfo > .SRCINFO
