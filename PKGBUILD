# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=dorian-theme
pkgver=3.14_12_03012015
pkgrel=1
pkgdesc="A sleek dark theme for gtk2+3 Gnome-Shell Cinnamon MATE Xfwm4 Openbox3 Chromium Firefox Thunderbird Unity"
arch=('any')
url="http://fav.me/d86da4w"
license=('GPLv3')
depends=('gtk-engines' 'gnome-themes-standard>=3.14' 'gtk-engine-murrine>=0.98.2')

source=("https://dl.dropboxusercontent.com/u/330352/dorian-theme-3.14_12.03012015.zip")


md5sums=('0a19bc8129d1151d4ba222f156f7e9e8')


package() {
  # install themes

  find Dorian-theme*/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;           
}

# vim:set ts=2 sw=2 et:
