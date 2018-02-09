# Maintainer: unstartdev <guo.yongan@outlook.com>
pkgname=electron-ssr-source
pkgver=0.2.0beta3
pkgrel=3
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
source=("https://github.com/erguotou520/electron-ssr/releases/download/v0.2.0-beta-2/electron-ssr-0.2.0-beta-2.tar.gz"
	"desktop.tar.gz"
	"icons.tar.gz")
noextract=()
md5sums=('d60ea1933cd47867e6671a382d1ff2f7'
         '4abbf552004cddffc22230070b622f7b'
         '679cf82afcc498d1db4dba5aed8bd0a0')
validpgpkeys=()

package() {
	install -d electron-ssr-0.2.0-beta-2/ $pkgdir/opt/$pkgname
	install -D electron-ssr-0.2.0-beta-2/*pak $pkgdir/opt/$pkgname
	install -D electron-ssr-0.2.0-beta-2/icudtl.dat $pkgdir/opt/$pkgname
	install -D electron-ssr-0.2.0-beta-2/libffmpeg.so $pkgdir/opt/$pkgname
	install -D electron-ssr-0.2.0-beta-2/libnode.so $pkgdir/opt/$pkgname
	install -D electron-ssr-0.2.0-beta-2/LICENSE.electron.txt $pkgdir/opt/$pkgname
	install -D electron-ssr-0.2.0-beta-2/LICENSES.chromium.html $pkgdir/opt/$pkgname
	install -D electron-ssr-0.2.0-beta-2/*bin $pkgdir/opt/$pkgname
	install -d electron-ssr-0.2.0-beta-2/locales $pkgdir/opt/$pkgname/locales
	install -d electron-ssr-0.2.0-beta-2/resources $pkgdir/opt/$pkgname/resources
	install -D electron-ssr-0.2.0-beta-2/locales/* $pkgdir/opt/$pkgname/locales
	install -D electron-ssr-0.2.0-beta-2/resources/* $pkgdir/opt/$pkgname/resources
	install -D electron-ssr-0.2.0-beta-2/electron-ssr $pkgdir/opt/$pkgname
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
