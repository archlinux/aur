# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=gnome-shell-extension-icontopbar
pkgver=3.6.3
pkgrel=1
pkgdesc="A gnome shell extension that places the tray icons of apps on the top bar."
url="https://extensions.gnome.org/extension/495/topicons"
license=('GPL2')
arch=('any')
conflicts=('gnome-shell-extension-gnome2-notifications-git')
source=('metadata.json' 'extension.js')
md5sums=('352116d9fb76c8e81d9bba3224ddddcc' '2875ed67b0ea16b151c8c4c046d8606d')

_extpath="$pkgdir/usr/share/gnome-shell/extensions"
_extname="topIcons@adel.gadllah@gmail.com"

package() {
  mkdir -p "$_extpath/$_extname"
  cd "$srcdir"
  cp extension.js metadata.json "$_extpath/$_extname"
}