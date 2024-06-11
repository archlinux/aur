# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=deadbeef-plugin-gui-qt5-bin
pkgver=1.9
pkgrel=1
pkgdesc="Qt5 plugin for DeaDBeeF (binary release)"
url="https://github.com/kuba160/ddb_gui_qt5"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('deadbeef' 'qt5-base')
provides=("deadbeef-plugin-gui-qt5" "deadbeef-gui-qt5" "ddb-gui-qt5")
conflicts=("deadbeef-plugin-gui-qt5")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver-preview2/ddb_gui_qt5_linux-shared.zip")
sha256sums=('f2c2d559108c21eed4f66b37ad67aa8a3c5638430ce5624c11927311442362e7')

package() {
  install -Dm755 plugins/ddb_gui_qt5.so -t "$pkgdir/usr/lib/deadbeef"
}
