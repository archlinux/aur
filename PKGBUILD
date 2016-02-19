# Mantainer: Diego

pkgname=gtk-theme-numix-white
_theme=NumixWhiteTheme
pkgver=1.4
pkgrel=5
pkgdesc="Numix White is a Gtk 3 and Gtk 2 theme, based of the original Numix theme"
arch=('any')
url="http://thevirtualdragon.deviantart.com/art/Numix-White-Gtk-Theme-v1-4-367777347"
license=('GPL3')
depends=('gtk-engine-murrine')
 source=(http://fc07.deviantart.net/fs71/f/2013/132/8/3/numix_white__gtk_theme_v1_4_by_thevirtualdragon-d62yqtf.zip)
#source=('http://www.deviantart.com/download/367777347/numix_white__gtk_theme_v1_4_by_thevirtualdragon-d62yqtf.zip')
md5sums=('08ac10bf9ca082ac70d1d7e296ee6b35')
# md5sums=('08ac10bf9ca082ac70d1d7e296ee6b35')

package() {

  # remove unneeded files
  rm -f .gitignore LICENSE README

  # install theme
  install -d "$pkgdir/usr/share/themes/${_theme}"
  cp -rv ${srcdir}/${_theme}/NumixWhite3.8/* "$pkgdir/usr/share/themes/${_theme}"
}




