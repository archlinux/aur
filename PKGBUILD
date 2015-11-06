# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=candra-themes-3.18
pkgver=4_10152015
pkgrel=2
pkgdesc="Minimalist flat themes for, Gnome, Xfce, Cinnamon, MATE, Openbox, LXDE"
arch=('any') 
url="http://fav.me/d9cy9dt"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.18' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/candra-themes-3.18-4_10152015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('c43d856aea0ea7e070ee62d16b7acaa3')


package() {
  # install themes
  
  cd candra-themes-3.18

find Candra-Gnome-Shell-Alt-3.18/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

find Xfdashboard-Candra/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

  cd candra-theme-3.18
find Candra-theme/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

  cd 'Root'
find Candra-theme/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/Candra-themes-3.18/Root-Theme/{}" \;           

  cd ..
  cd ..
  cd candra-theme-dark-3.18
find Candra-theme-dark/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

  cd 'Root'
find Candra-theme-dark/ -type f \
-exec install -Dm644 "{}" "$pkgdir/usr/share/themes/Candra-theme-dark-3.18/Root-Theme/{}" \;            
}

# vim:set ts=2 sw=2 et:
