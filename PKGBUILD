# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean
pkgver=3.16_12_05202015
pkgrel=1
pkgdesc="The Metal Gtk Theme. For Gnome 3.16, Gnome-Shell, Xfce, Cinnamon, MATE, Firefox, & Chromium "
arch=('any') 
url="http://fav.me/d7vgccg"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.16' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/delorean-3.16-12_05202015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('8997a57b4083be594af24702ac2745c8')


package() {
  # install themes
  
  #cd DORIAN

find DeLorean-Dark-3.16/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
find DeLorean-3.16/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \; 
find DeLorean-Root-3.16/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;            
}

# vim:set ts=2 sw=2 et:
