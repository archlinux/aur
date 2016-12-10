# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=vibrancy-colors
pkgver=2.7
pkgrel=2
pkgdesc="Modern, clean and customizable flat icon theme"
arch=('any')
url="http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html"
license=('CCPL:by-sa' 'GPL2')
options=('!strip')
source=("v$pkgver.tar.gz::https://www.dropbox.com/s/sealvky0fzusfix/Vibrancy-Colors-GTK-Icon-Theme-v-2-7.tar.gz")
sha1sums=('0a42fb74af7463215f126e9aff9f1ba4fb50d258')

package() {
  install -d $pkgdir/usr/share/icons
  cp -r * $pkgdir/usr/share/icons
  rm $pkgdir/usr/share/icons/v$pkgver.tar.gz
}
