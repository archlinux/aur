# Maintainer: jnbek <jnbek1972@gmail.com>

pkgname=gtk-theme-metagrip
pkgver=1.0
pkgrel=1
pkgdesc="A gtk2, gtk3, metacity window border theme. Works on MATE, Cinnamon for sure, and probably XFCE"
arch=('any')
url="http://art.gnome.org/themes/metacity/1360"
license=('GPL')
depends=('gtk-engines')
source=("${pkgname}-${pkgver}.tar.gz::http://ftp.gnome.org/pub/gnome/teams/art.gnome.org/themes/metacity/MCity-MetaGrip.tar.gz")
md5sums=('c307f9b8d4a24228904c0c1809e82904')


package() {

  # install theme
  find MetaGrip/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
