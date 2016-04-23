#Maintainer: zpydr <zpydr at openmailbox dot org>
pkgname=gnome-shell-extension-taskbar
pkgver=52.0
pkgrel=1
pkgdesc="GNOME Shell Extension TaskBar"
arch=('any')
url="https://extensions.gnome.org/extension/584/taskbar/"
license=('GPL')
depends=('gnome-shell')
source=('https://github.com/zpydr/gnome-shell-extension-taskbar/archive/52.0.tar.gz')
md5sums=('SKIP')
prepare() {
  tar -xvf $pkgver.tar.gz
}
package() {
  rm $pkgver.tar.gz
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/TaskBar@zpydr/"
  cp -a extension.js  images  lib.js  LICENSE  locale  metadata.json  prefs.js  README  schemas  stylesheet.css  TaskBar.pot windows.js "$pkgdir/usr/share/gnome-shell/extensions/TaskBar@zpydr/"
}
