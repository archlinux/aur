# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=candra-themes-3.18-cn
pkgver=7_11112015
pkgrel=1
pkgdesc="Minimalist flat themes for, Gnome, Xfce, Cinnamon, MATE, Openbox, LXDE"
arch=('any') 
url="http://www.linuser.org"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.18' 'gtk-engine-murrine>=0.98.2')

source=("http://7xizf7.com1.z0.glb.clouddn.com/candra-themes-3.18-7-11112015.zip")
#install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('13d051d2b0a754899c436428a490c599')


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
