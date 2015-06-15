# Maintainer: Peter Reschenhofer  <peter.reschenhofer@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=gnome-shell-extension-icontopbar
pkgver=26
pkgrel=1
pkgdesc="A gnome shell extension that places the tray icons of apps on the top bar."
url="https://extensions.gnome.org/extension/495/topicons"
license=('GPL2')
arch=('any')
conflicts=('gnome-shell-extension-gnome2-notifications-git')
source=('metadata.json' 'extension.js')

_extpath="usr/share/gnome-shell/extensions"
_extname="topIcons@adel.gadllah@gmail.com"

package() {
  cd $pkgdir
  mkdir -p "$_extpath/$_extname"
  cp "$srcdir"/* "$_extpath/$_extname"
}

md5sums=('6f1e54a373f116d66e63bb7e8c4ae065' '6d7acd94cb86e49904b9928c20ed0de0')
