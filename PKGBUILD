# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10
pkgver=0.8.3
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
changelog=(${pkgname}.changelog)
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.8.3/Windows.10.Light.v0.8.3.zip")
sha1sums=('af0f0fac6cf3df4abcb4fa4596b7f7a524823ded')

package() {
  cd Windows\ 10\ Light

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  # install theme
  find . -type f -exec \
    install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;

}

