# Maintainer: Brian BIdulock <bidulock@Openss7.org>
# Contributor: H.Gökhan Sarı <hsa2@difuzyon.net>
pkgname=gtk-theme-absolute
pkgver=0.7.7
pkgrel=2
pkgdesc="A murrine based gtk theme which is simple, clean and elegant."
arch=(any)
url="http://gnome-look.org/content/show.php/absolute?content=126326"
license=('GPL')
depends=('gtk-engine-murrine')
source=(http://gnome-look.org/CONTENT/content-files/126326-absolute-themes.tar.bz2)
md5sums=('2e37d1c7b3d5b05cc31283901849c1a3')

package() {
  install -dm0755 "$pkgdir/usr/share/themes"
  cp -R "$srcdir"/absolute-themes/* $pkgdir/usr/share/themes/

}

# vim:set ts=2 sw=2 et:
