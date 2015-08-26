# Maintainer: Tom Kwok <contact@tomkwok.com>

pkgname=mediterraneannight-theme
pkgver=2.03
pkgrel=2
pkgdesc="A gtk3, gtk2, metacity, xfwm4 and unity theme (variation of 'Adwaita cupertino')."
arch=('any')
url="http://gnome-look.org/content/show.php/MediterraneanNight+Series?content=156782"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine' 'gtk3')
source=("https://dl.dropboxusercontent.com/u/80497678/MediterraneanNight-${pkgver}.tar.gz")
md5sums=('ec0735f053bff9f4502ec951114009fc')


package() {
  cd $srcdir/

  # delete custom buttons for metacity and unity
  rm ./Mediterranean*/*.tar.gz
  rm -rf ./MediterraneanNight/TitleBar-Buttons

  find Mediterranean*/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
