# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=aero-clone-gtk-theme
_pkgname=aero
pkgver=57352
pkgrel=4
pkgdesc="AeroClone tehme for GTK2"
url="http://gnome-look.org/content/show.php/Aero-clone?content=${pkgver}"
license="GNU/GPL"
arch=('any')
source=("http://gnome-look.org/CONTENT/content-files/${pkgver}-${_pkgname}.tar.gz")
md5sums=('465f3c4e440ec14c86e9830366b8b889')

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/usr/share/themes/${_pkgname}-clone"
  tar -xf aero-clone.tar.gz -C "${pkgdir}/usr/share/themes"
  find "${pkgdir}" -name '*~' -delete
}
