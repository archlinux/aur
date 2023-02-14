# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=ctool-bin
pkgver="v2.2.0"
pkgrel=1
pkgdesc='程序开发常用工具 chrome /edge/firefox /utools/windows /linux/mac'
arch=('x86_64')
url="https://github.com/baiy/Ctool"
license=('MIT')
depends=('webkit2gtk'
	       'gtk3')
source=("${url}/releases/download/${pkgver}/ctool_tauri_linux.deb")
sha256sums=('539970c496b116b80333eac5b61f483484ffd81b196d38d8194080818da286a4')
package() {
	cd $pkgdir
	tar -xpf ${srcdir}/data.tar.gz
}

