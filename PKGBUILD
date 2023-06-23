
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=com.jisupdfeditor.deepin
pkgver=3.0.0.9
pkgrel=1
pkgdesc="一款简单好用的极速PDF编辑器"
arch=(x86_64)
url="https://www.jisupdfeditor.com/"
license=('custom')
depends=(
libx11
glibc
pango
freetype2
gdk-pixbuf2
xdg-utils
hicolor-icon-theme
bash
cairo
glib2
gtk2
at-spi2-core
fontconfig
deepin-wine-plugin-virtual
)
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/com.jisupdfeditor.deepin/com.jisupdfeditor.deepin_${pkgver}deepin4_i386.deb")
sha256sums=('664f218a0b5736cf78d7713a20a47376a85cdfb1e5cb4597de2a07d588ca6b7e')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	install -d $pkgdir/usr/share/
	cp -av $pkgdir/opt/apps/com.jisupdfeditor.deepin/entries/* $pkgdir/usr/share/
}
