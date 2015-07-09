# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=delorean-dark-themes-3.8
pkgver=10082013
pkgrel=1
pkgdesc="Unique Metal Theme for Gtk2, Gtk3, Metacity, Xfwm4, LXDE & Openbox"
arch=('any')
url="http://fav.me/d6a12ra"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.6.0' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/DeLorean-Dark-Themes-3.8_${pkgver}.zip")
install=$pkgname.install
#replaces=('delorean-dark-themes-3.8')
#conflicts=('delorean-dark-theme-3.8')

md5sums=('5385784e49392adfc4769dbe61392e8b')


package() {
  # install themes
  
  #cd DORIAN

  find delorean-dark-theme-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find delorean-dark-theme-carbon-metacity/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;    
  find delorean-dark-theme-G-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  find delorean-dark-theme-P-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \; 
  find delorean-dark-theme-R-3.9/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;           
}

# vim:set ts=2 sw=2 et:
