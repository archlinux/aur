# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=dorian-flat
pkgver=3.16_04_06102015
pkgrel=1
pkgdesc="A dark flat theme. For Gnome 3.16,openbox, xfwm4, Gnome-Shell, Cinnamon, MATE, Firefox, & Chromium "
arch=('any') 
url="http://fav.me/d8w4ms7"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.16' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/dorian-flat-3.16-04_06102015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('368e5e8f5e2e4d4a0d2313a9957c3ece')


package() {
  # install themes
  
  #cd DORIAN

find Dorian-Flat-3.16/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
find Dorian-Flat-Root-3.16/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;             
}

# vim:set ts=2 sw=2 et:
