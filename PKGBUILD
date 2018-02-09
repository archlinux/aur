# Maintainer: unstartdev <guo.yongan@outlook.com>
pkgname=electron-ssr-source
pkgver=0.2.0beta3
pkgrel=2
epoch=
pkgdesc="Install electron-ssr from tarball"
arch=('x86_64')
url="https://github.com/erguotou520/electron-ssr"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("electron-ssr-0.2.0-beta-3")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/erguotou520/electron-ssr/releases/download/v0.2.0-beta-3/electron-ssr-0.2.0-beta-3.tar.gz"
	"desktop.tar.gz"
	"icons.tar.gz")
noextract=()
md5sums=('3520dc50e5c57c3f1d04535614b0ef13'
         '4abbf552004cddffc22230070b622f7b'
         '679cf82afcc498d1db4dba5aed8bd0a0')
validpgpkeys=()

package() {
	install -d electron-ssr-*/ $pkgdir/opt/$pkgname
	install -D electron-ssr-*/*pak $pkgdir/opt/$pkgname
	install -D electron-ssr-*/icudtl.dat $pkgdir/opt/$pkgname
	install -D electron-ssr-*/libffmpeg.so $pkgdir/opt/$pkgname
	install -D electron-ssr-*/libnode.so $pkgdir/opt/$pkgname
	install -D electron-ssr-*/LICENSE.electron.txt $pkgdir/opt/$pkgname
	install -D electron-ssr-*/LICENSES.chromium.html $pkgdir/opt/$pkgname
	install -D electron-ssr-*/*bin $pkgdir/opt/$pkgname
	install -d electron-ssr-*/locales $pkgdir/opt/$pkgname/locales
	install -d electron-ssr-*/resources $pkgdir/opt/$pkgname/resources
	install -D electron-ssr-*/locales/* $pkgdir/opt/$pkgname/locales
	install -D electron-ssr-*/resources/* $pkgdir/opt/$pkgname/resources
	install -D electron-ssr-*/electron-ssr $pkgdir/opt/$pkgname
	install -D ./electron-ssr.desktop $pkgdir/usr/share/applications/electron-ssr.desktop
	install -D icons/hicolor/128x128/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/128x128/apps/electron-ssr.png
	install -D icons/hicolor/16x16/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/128x128/apps/electron-ssr.png
	install -D icons/hicolor/24x24/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/24x24/apps/electron-ssr.png
	install -D icons/hicolor/256x256/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/256x256/apps/electron-ssr.png
	install -D icons/hicolor/32x32/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/32x32/apps/electron-ssr.png
	install -D icons/hicolor/48x48/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/48x48/apps/electron-ssr.png
	install -D icons/hicolor/64x64/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/64x64/apps/electron-ssr.png
	install -D icons/hicolor/96x96/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/96x96/apps/electron-ssr.png
}
