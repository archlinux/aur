# Maintainer: Jordan Day < jordanday444 at gmail dot com >

_pkgname=vice
pkgname=$_pkgname-gnome
pkgver=3.5
pkgrel=1
pkgdesc="Versatile Commodore Emulator (Provides desktop files for easy use in Gnome)"
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=("$_pkgname")

source=(
  "$_pkgname.png"
  "$_pkgname.desktop"
)

md5sums=('cb764e40ad039399aac16efc647725ed'
         '3c59a6ed9662dfc52e179309d8446665')

package() {
  # Install the XDG desktop file and icon
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
