# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-dark
pkgver=0.8
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="http://gnome-look.org/content/show.php/Windows+10+Theme?content=171327"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
source=http://b00merang.weebly.com/uploads/1/6/8/1/16813022/windows_10_dark_v0.8.zip
sha1sums=('2726637ef04ff2f55524452ee26614c8196e0d76')

package() {
  cd Windows\ 10\ Dark

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10Dark"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10Dark/{}" \;

}

