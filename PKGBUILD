# Maintainer: Alan Li <yglunl@gmail.com>

pkgname=gtk-theme-windows10
pkgver=0.6.8
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="http://gnome-look.org/content/show.php/Windows+10+Theme?content=171327"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
source=(http://b00merang.weebly.com/uploads/1/6/8/1/16813022/windows_10_default_v0.6.8.zip)
sha1sums=('c8b9fe98a6828aee6018bd72ec841adfc62ef619')

package() {
  cd Windows\ 10

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;

}

