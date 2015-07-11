# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
# Contributor: grimi <grimi at poczta dot fm>

pkgname=openbox-shiki-colors-themes
pkgver=0.2
pkgrel=3
pkgdesc="Openbox Shiki-Colors matching themes for the GTK and respective Gnome-Colors icon theme"
arch=('any')
url="http://www.box-look.org/content/show.php/Shiki-Colors+for+Openbox?content=118358"
license=('Creative Commons by-nc-sa')
depends=('openbox')
source=("http://fc00.deviantart.net/fs71/f/2010/011/1/5/Shiki_Colors_for_Openbox_by_jmcknight.gz")
sha256sums=('cac41a7c807743a52e90ea3c7e1c4892992e8fe6b499672bd29e2f755ef77cf3')

build() { 
  true
}

package() {
  cd "$srcdir"
  for theme in Shiki-*; do
     install -d "$pkgdir/usr/share/themes/$theme/openbox-3"
     install -m644 "$theme/openbox-3/"{*.xbm,themerc} "$pkgdir/usr/share/themes/$theme/openbox-3"
  done
}
