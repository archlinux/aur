# Maintainer: yongmeng <yongmengkennyye@protonmail.com>
# Contributor: unstartdev <guo.yongan@outlook.com>
pkgname=electron-ssr-appimage
pkgver=0.2.3
pkgrel=1
epoch=
pkgdesc="Install electron-ssr from appimage"
arch=('x86_64')
url="https://github.com/erguotou520/electron-ssr"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("electron-ssr-0.2.3"
	  "electron-ssr-source")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/erguotou520/electron-ssr/releases/download/v$pkgver/electron-ssr-$pkgver-x86_64.AppImage"
	"desktop.tar.gz"
	"icons.tar.gz")
noextract=("electron-ssr-$pkgver-x86_64.AppImage")
md5sums=('b37e82fef397ff296de31a6f784a611c'
         '84f39007ef78543f8cd2f29b253afa42'
         '679cf82afcc498d1db4dba5aed8bd0a0')
validpgpkeys=()

package() {
	install -Dc electron-ssr-$pkgver-x86_64.AppImage $pkgdir/opt/electron-ssr.AppImage
	install -Dc ./electron-ssr.desktop $pkgdir/usr/share/applications/electron-ssr.desktop
	install -Dc icons/hicolor/128x128/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/128x128/apps/electron-ssr.png
	install -Dc icons/hicolor/16x16/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/128x128/apps/electron-ssr.png
	install -Dc icons/hicolor/24x24/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/24x24/apps/electron-ssr.png
	install -Dc icons/hicolor/256x256/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/256x256/apps/electron-ssr.png
	install -Dc icons/hicolor/32x32/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/32x32/apps/electron-ssr.png
	install -Dc icons/hicolor/48x48/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/48x48/apps/electron-ssr.png
	install -Dc icons/hicolor/64x64/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/64x64/apps/electron-ssr.png
	install -Dc icons/hicolor/96x96/apps/electron-ssr.png $pkgdir/usr/share/icons/hicolor/96x96/apps/electron-ssr.png
}
