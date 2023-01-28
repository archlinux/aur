# Maintainer: sunflowercx <1527981693@qq.com>
pkgname=wyc-bin
pkgver=1.0
pkgrel=1
install=${pkgname}.install
pkgdesc="网云穿内网穿透Linux版本"
arch=("x86_64")
url="https://xiaomy.net"
license=('custom')
source=("https://down.xiaomy.net/linux/wyc_linux_64")
sha256sums=('c299049774e59ee7a12645a461f571ace0f1b09dcca1b2707a49475ef0d18694')
package() {
	install -Dm755 "${pkgname%-bin}_linux_64" -T "$pkgdir/usr/bin/wyc"
}
