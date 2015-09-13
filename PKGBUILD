# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=sable
pkgver=3.14.31_03222015
pkgrel=1
pkgdesc="A flat green, blue, NC(gray), Purple, Yellow, and red themes with or without patterened background for gnome-shell, cinnamon-2.4, xfwm4, openbox-3, Qt4, Firefox Theme, and Chromium Theme, as well as all themes without patterned background. Ten in all."
arch=('any')
url="http://fav.me/d8eg4n0"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.14' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/sable-3.14.31_03222015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')
install=$pkgname.install

md5sums=('ce9b69cd1b4429d5336c9c2afc04a2de')


package() {
  # install themes
  
  #cd DORIAN

  find Sable-Green-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-Blue-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-Red-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \; 
  find Sable-NC-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-Green-NP-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-Blue-NP-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-Red-NP-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-NC-NP-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-Purple-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;   
  find Sable-Purple-NP-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find Sable-Yellow-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;   
  find Sable-Yellow-NP-3.14/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;      
}  

# vim:set ts=2 sw=2 et:
