# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=('canta-gtk-theme')
pkgdesc="Flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell"
pkgver=2020.01.31
_pkgver=$(echo $pkgver | tr '.' '-')
_pkgname="Canta-theme-${_pkgver}"
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/Canta-theme"
license=('GPL2')
depends=('gtk-engine-murrine'
         'gtk-engines'
         'gnome-themes-standard'
         'sassc')
makedepends=('gtk3')

source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('c08e3d10eb5625024cb778de3f0901bcc73c07959b090e821ca69c0ae15e06b3')

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -d "${pkgdir}/usr/share/themes"
}
