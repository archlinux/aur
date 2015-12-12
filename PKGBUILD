# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-dark
pkgver=0.8.1
pkgrel=5
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
changelog=(${pkgname}.changelog)
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.8.1/Windows.10.dark.v0.8.1.zip")
sha1sums=('638b54ba396b0da806fcb2f6d33d04672872b805')

package() {
  cd Windows\ 10\ Dark

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10Dark"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10Dark/{}" \;

}

