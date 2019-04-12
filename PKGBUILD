# Maintainer: Jordan Day < jordanday444 at gmail dot com >

_pkgname=vice
pkgname=$_pkgname-gnome
pkgver=3.3
pkgrel=1
pkgdesc="Versatile Commodore Emulator (Provides desktop files for easy use in Gnome)"
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=("$_pkgname")
provides=("$_pkgname")

source=(
  "$_pkgname.png"
  "$_pkgname.desktop"
)

md5sums=('cb764e40ad039399aac16efc647725ed'
         '94d0be3ab03d1d05bc4cbd59f8d92cf4')

package() {
  # Install the XDG desktop file and icon
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
