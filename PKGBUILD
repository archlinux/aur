# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=('canta-gtk-theme')
pkgdesc="Flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell"
pkgver=2018.10.30
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
sha256sums=('b00e5f7c926d80c180e37e8ca53f80c05b46c8cb5caf80270dad0b3a885bab00')

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -b -d "${pkgdir}/usr/share/themes"
}
