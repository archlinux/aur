# maintainer: brionical27 <brionical@proton.me> 
pkgname=hyprpaper-gui-bin
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A GUI wallpaper changer for Hyprpaper"
arch=(x86_64)
url="https://github.com/lexiuwu71/hyprpaper-gui"
license=('No license')
depends=("hyprpaper")
install=hyprpaper-gui.install
source=("$url/releases/download/v$pkgver/Linux-x86-bin.zip")
sha256sums=(SKIP)
install=hyprpaper-gui.install
package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	cp $srcdir/Linux-x86-bin/change-wallpaper $pkgdir/usr/bin/hyprpaper-gui
	echo "[Desktop Entry]
	Name=Hyprpaper GUI Switcher
	GenericName=A Wallpaper changer for Hyprpaper, written in Python with Pygame.
	Exec=hyprpaper-gui
	Terminal=false
	Categories=Utility;
	Type=Application
	Icon=preferences-system" >>"$pkgdir/usr/share/applications/hyprpaper-gui.desktop"

}
