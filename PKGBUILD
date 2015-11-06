# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark-3.18
pkgver=6_11062015
pkgrel=1
pkgdesc="The Metal Gtk Theme. For Gnome 3.16, Xfce w/xfwm4, XfDashboard, Cinnamon, MATE, Openbox, Firefox, & Chromium"
arch=('any') 
url="http://fav.me/d9et76v"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.18' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/delorean-dark-3.18-6_11062015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('44a30ca8cc242f8755a6dff48e198da9')


package() {
  # install themes
  
  cd delorean-dark-3.18

find DeLorean-Dark-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

  cd 'ROOT THEME'
  
find DeLorean-Dark-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/DeLorean-Dark-3.18/Root-Theme/{}" \;            
}

# vim:set ts=2 sw=2 et:
