# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark
pkgver=3.18-2_10302015
pkgrel=1
pkgdesc="The Metal Gtk Theme. For Gnome 3.16, Xfce, Cinnamon, MATE"
arch=('any') 
url="http://fav.me/d9et76v"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.18' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/delorean-dark-3.18-2_10302015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('f88d378af1b91d0682cd5c566c024180')


package() {
  # install themes
  
  cd delorean-dark-3.18

find DeLorean-Dark-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir~/.themes/{}" \;

  cd 'delorean-dark-3.18/ROOT THEME'
find DeLorean-Dark-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir~/.themes/{}" \;            
}

# vim:set ts=2 sw=2 et:
