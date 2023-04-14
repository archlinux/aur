# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=ctool-bin
pkgver="2.2.0"
pkgrel=2
pkgdesc='程序开发常用工具 chrome /edge/firefox /utools/windows /linux/mac'
arch=('x86_64')
url="https://github.com/baiy/Ctool"
license=('MIT')
depends=('webkit2gtk'
	       'gtk3'
	       gcc-libs
	       glibc
	       openssl
	       dbus
	       glib2
	       gdk-pixbuf2
               hicolor-icon-theme
	       )
source=("${url}/releases/download/v${pkgver}/ctool_tauri_linux.deb")
sha256sums=('539970c496b116b80333eac5b61f483484ffd81b196d38d8194080818da286a4')
package() {
	tar -xvpf ${srcdir}/data.tar.gz -C $pkgdir
	chown root:root -R $pkgdir

}
