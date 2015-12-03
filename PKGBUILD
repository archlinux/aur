# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10
pkgver=0.8
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="http://gnome-look.org/content/show.php/Windows+10+Theme?content=171327"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
source=("windows10_light.zip::http://gnome-look.org/content/download.php?content=171327&id=1&tan=61148233")
sha1sums=('6263928f192df1731af0f45e13244a1cd3e4c05a')

package() {
  cd Windows\ 10

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;

}

