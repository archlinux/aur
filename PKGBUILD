#Maintainer: zpydr <zpydr at openmailbox dot org>
pkgname=gnome-shell-extension-taskbar
pkgver=291.c8686e9
pkgrel=1
_gitname=gnome-shell-extension-taskbar
pkgdesc="GNOME Shell Extension TaskBar"
arch=('any')
url="https://github.com/zpydr/gnome-shell-extension-taskbar"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/zpydr/gnome-shell-extension-taskbar.git')
md5sums=('SKIP')
 
package() {
  cd gnome-shell-extension-taskbar 
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/TaskBar@zpydr"
  cp -a extension.js  images  lib.js  LICENSE  locale  metadata.json  prefs.js  README  schemas  stylesheet.css  TaskBar.pot  windows34.js  windows.js "$pkgdir/usr/share/gnome-shell/extensions/TaskBar@zpydr/"
} 

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
