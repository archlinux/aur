# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=gnome-shell-extension-hot-edges
pkgver=v3
pkgrel=1
pkgdesc="A GNOME Shell extension to enable screen edge gestures"
arch=('any')
url="https://extensions.gnome.org/extension/798/overview-edge-gesture/"
license=('GPL3')
depends=('dconf')
makedepends=('git' 'gnome-common')
source=("http://downloads.sourceforge.net/project/mt-miscellaneous/gnome-extensions/3.16/edge-gestures%40v.kaiser.pendergrast.v3.shell-extension.zip")
md5sums=('494bca653e0e78152f4afbc3943abb32')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/edge-gestures@v.kaiser.pendergrast"
  cp "metadata.json" "$pkgdir/usr/share/gnome-shell/extensions/edge-gestures@v.kaiser.pendergrast/"
  cp "extension.js" "$pkgdir/usr/share/gnome-shell/extensions/edge-gestures@v.kaiser.pendergrast/"
}
