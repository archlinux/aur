# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark-3.18
pkgver=10_11092015
pkgrel=1
pkgdesc="The Metal Gtk Theme. For Gnome 3.18, Gnome-Shell, GDM, Xfce w/xfwm4, XfDashboard, Cinnamon, MATE gtk2 & gtk3, Openbox, Plank, Firefox, & Chromium"
arch=('any') 
url="http://fav.me/d9et76v"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.18' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/delorean-dark-3.18-10_11092015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('f9291a41c289b0600cd02b2d4d6fac30')


package() {
  # install themes
  
  cd delorean-dark-3.18

find DeLorean-Dark-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

find xfdashboard-delorean-dark-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

find DeLorean-Dark-3.18-Plank-Theme/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/plank/{}" \;

  cd 'ROOT THEME'
  
find DeLorean-Dark-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/DeLorean-Dark-3.18/Root-Theme/{}" \;            
}

# vim:set ts=2 sw=2 et:
