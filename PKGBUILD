# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-dark
pkgver=0.7.7
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="http://gnome-look.org/content/show.php/Windows+10+Theme?content=171327"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
source=("windows10_dark.zip::https://github.com/Elbullazul/B00merang-Project/blob/master/Windows%2010%20Themes/Windows%2010%Dark%20v0.7.7.zip?raw=true")
sha1sums=('b0a1ae067a185f0f4a60414ef3bbc7326fe6e9c9')

package() {
  cd Windows\ 10\ Dark

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10Dark"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10Dark/{}" \;

}

