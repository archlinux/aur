pkgname=libra-dark-gtk-theme
pkgver=2.3
pkgrel=1
pkgdesc="GTK-2.0 & GTK-3.0 compatible theme"
arch=('any')
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=()
url="http://gnome-look.org/content/show.php/Libra?content=167689"
source=('Libra-Dark.tar.gz::https://www.dropbox.com/s/tif9lq158ijdnaf/Libra-Dark2.3.tar.gz?dl=1')
md5sums=('706324efffb3fbede5534744f7103e65')

build() {
  msg "Extracting the Libra-Dark archive..."
  tar zxf "Libra-Dark.tar.gz"
}

package() {
  THEMES_DIR="/usr/share/themes"
  msg "Moving theme files into ${THEMES_DIR} ..."
  mkdir -p "${pkgdir}${THEMES_DIR}"
  mv Libra-Dark "${pkgdir}${THEMES_DIR}"
}
