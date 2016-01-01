# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-dark
pkgver=0.8.3
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
changelog=(${pkgname}.changelog)
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.8.3/Windows.10.dark.v0.8.3.zip")
sha1sums=('e14a32bf144b58596ba94b7f407f27b434d326f3')

package() {
  cd Windows\ 10\ Dark

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10Dark"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10Dark/{}" \;

}

