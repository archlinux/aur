# Maintainer: kumax <kumax2048@pm.me>
pkgname=wechat-devtools-bin
pkgver=1.06.2206090
pkgrel=1
_pkgrel=2
_pkgver=${pkgver}-${_pkgrel}
pkgdesc="WeChat Devtools For Linux."
license=("MIT")
arch=("x86_64")
url="https://github.com/msojocs/wechat-web-devtools-linux"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gconf" "libxkbfile")
optdepends=("wine")
source=("io.github.msojocs.wechat-devtools-no-wine_${pkgver}_amd64.deb::https://github.com/msojocs/wechat-web-devtools-linux/releases/download/v${_pkgver}/io.github.msojocs.wechat-devtools-no-wine_${_pkgver}_amd64.deb")
md5sums=('b5da7353a9589a85ae11fd6ed6dc123e')

package() {
	tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
