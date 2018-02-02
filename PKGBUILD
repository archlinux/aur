# Maintainer: grimi <grimi at poczta dot fm>

_pkgver=2018.02.02
pkgname=emerald-icon-theme
pkgver=${_pkgver//\./}
pkgrel=1
pkgdesc="Fresh and simple personality icon theme"
arch=('any')
url='https://www.gnome-look.org/p/1012534'
license=('GPL3')
depends=('hicolor-icon-theme')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/vinceliuice/${pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('c97571d8ceba34ba18940336a68ee85cacd8d2f48553570b3b8a29829f100555')


package() {
   cd ${pkgname}-${_pkgver}
   find Emerald{,-Dark,-Matcha}/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
   find Emerald{,-Dark,-Matcha}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/icons/{}" \;
}

