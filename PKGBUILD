# Maintainer: H.Gökhan Sarı <th0th@returnfalse.net>, SerialVelocity <avedissian.david@gmail.com>
pkgname=gtk-theme-bsm-simple
pkgver=1.3
pkgrel=3
pkgdesc="A small, light and smooth theme for GTK based desktops."
arch=(any)
url="http://gnome-look.org/content/show.php/BSM+Simple?content=121685"
license=('GPL')
depends=('gtk-engines')
source=(http://gnome-look.org/CONTENT/content-files/121685-BSM%20Simple%2013.tar.gz)
noextract=()
md5sums=('26ba7fd532b8811e77a041ce8bacf79f')

package() {
  cd "$srcdir/"
  chmod -R 755 "$srcdir/BSM"*
  mkdir -p "$pkgdir"/usr/share/themes/
  cp -R BSM* "$pkgdir"/usr/share/themes/
}

# vim:set ts=2 sw=2 et:
