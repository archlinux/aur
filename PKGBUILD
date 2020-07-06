# Maintainer: purofle 3272912942@qq.com
pkgname="miraiok-bin"
pkgver="0.5.2"
pkgrel=1
pkgdesc="一个提供QQ Android协议支持的高效率机器人库"
arch=("x86_64")
url="https://github.com/LXY1226/MiraiOK"
license=("AGPL3")
depends=("jdk8-openjdk")
source=("miraiOK::http://t.imlxy.net:64724/mirai/MiraiOK/miraiOK_linux_amd64")
noextract=("${source[@]%%::*}")
md5sums=('114eef36cea19e2846ecb149e88899ac')

package() {
	mkdir -p ${pkgdir}/usr/bin
	install -D -m 755 "${srcdir}/miraiOK" "${pkgdir}/usr/bin/miraiOK"
}
