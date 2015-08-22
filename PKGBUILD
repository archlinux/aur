pkgname=libra-gtk-theme
pkgver=2.3
pkgrel=1
pkgdesc="GTK-2.0 & GTK-3.0 compatible theme"
arch=('any')
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=()
url="http://gnome-look.org/content/show.php/Libra?content=167689"
source=(Libra.tar.gz::http://gnome-look.org/CONTENT/content-files/167689-Libra2.3.tar.gz)
md5sums=('93fabb610537df27b200074fa1884eab')
backup=()

build() {
  msg "Extracting the Libra archive..."
  tar zxf "Libra.tar.gz"
}

package() {
  THEMES_DIR="/usr/share/themes"
  msg "Moving theme files into ${THEMES_DIR} ..."
  mkdir -p "${pkgdir}${THEMES_DIR}"
  mv Libra "${pkgdir}${THEMES_DIR}"
}
