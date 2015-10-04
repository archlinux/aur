# Maintainer: Alan Li <yglunl@gmail.com>

pkgname=gtk-theme-windows10
pkgver=0.4.3
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="http://gnome-look.org/content/show.php/Windows+10+Theme?content=171327"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
source=(http://b00merang.weebly.com/uploads/1/6/8/1/16813022/windows_10_default_v0.4.3.zip)
sha1sums=('627325f43bbf6b1750e2ef6adda00149a582f202')

package() {
  cd Windows\ 10

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;

}

