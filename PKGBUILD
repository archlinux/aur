# http://pen-art.ru/downloads/icons/ubo-icons-0.1alpha.tar.gz
# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://pen-art.ru
# NOTES:
# From gnome-look : http://gnome-look.org/content/show.php/?content=122078

pkgname=ubo-icons
pkgver=0.1alpha
pkgrel=1
pkgdesc="Ubo icon theme from GNOME-Look  http://gnome-look.org/content/show.php/?content=122078"
arch=('any')
url="http://pen-art.ru/downloads/icons/${pkgname}-${pkgver}.tar.gz"
license=('Artistic 2.0')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
# install="${pkgname}.install"
source=("http://pen-art.ru/downloads/icons/${pkgname}-${pkgver}.tar.gz")
md5sums=("b6e734927f10cfce323a6bb2232d7ea2")


package() {
  msg2 "Installing ${pkgname}...";
  cd ${pkgname}-${pkgver};
  install -dm 755 "${pkgdir}"/usr/share/icons/${pkgname};
  cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/${pkgname};
}


