# Maintainer: dag.robole at gmail dot com

pkgname=gtk-theme-elegant-brit
pkgver=20150813
pkgrel=3
pkgdesc="This is the Elegant Brit gtk theme ported to gtk3. Includes gtk2, gtk3, Metacity and GNOME Shell themes."
url="https://github.com/corebob/gtk-theme-elegant-brit"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/gtk-theme-elegant-brit/archive/master.zip")
md5sums=('5ddcb951e8fa74b2f544df70c6ea5de6')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/Elegant Brit/"
  cp -r ${srcdir}/gtk-theme-elegant-brit-master/* "${pkgdir}/usr/share/themes/Elegant Brit/"
}
