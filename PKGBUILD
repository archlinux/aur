# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>

pkgname=gtk-theme-futura
pkgver=1.1.0
pkgrel=1
pkgdesc="A flat gtk theme inspired by Windows8 interface."
arch=('any')
url="http://nale12.deviantart.com/art/Futura-1-1-0-356531951"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engines' 'gtk-engine-murrine')
source=(http://fc04.deviantart.net/fs71/f/2013/059/9/1/futura_1_1_0_by_nale12-d5w9ptb.zip)
sha1sums=('372e5752958173fa9cee0fc06130ea241043a54a')

package() {
  cd Futura-Blue

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Futura-Blue"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Futura-Blue/{}" \;

  cd ../Futura-Red

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Futura-Red"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Futura-Red/{}" \;

}
