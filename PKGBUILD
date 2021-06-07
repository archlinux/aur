# Maintainer:
# Contributer: Sumit Sahrawat <contact@sums.dev>
# Contributor: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=all-the-icons.el
_pkgmaintainer=domtronn
_versionprefix=
pkgver=5.0.0
pkgrel=1
pkgdesc="Icon font for all-the-icons.el (A utility package to collect various Icon Fonts and propertize them within Emacs.)"
pkgname=ttf-all-the-icons
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('MIT')
provides=('ttf-atom-file-icons' 'ttf-font-awesome' 'ttf-material-design-icons' 'ttf-octicons' 'ttf-weather-icons')
conflicts=('ttf-octicons')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('72ac4544ba715e082e1150adce50f9ad80b9d350585acd45ee080ac4e91caa57')

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/"
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 fonts/all-the-icons.ttf "$pkgdir/usr/share/fonts/TTF/all-the-icons.ttf"
  install -m644 fonts/file-icons.ttf "$pkgdir/usr/share/fonts/TTF/file-icons.ttf"
  install -m644 fonts/fontawesome.ttf "$pkgdir/usr/share/fonts/TTF/fontawesome.ttf"
  install -m644 fonts/material-design-icons.ttf "$pkgdir/usr/share/fonts/TTF/material-design-icons.ttf"
  install -m644 fonts/octicons.ttf "$pkgdir/usr/share/fonts/TTF/octicons.ttf"
  install -m644 fonts/weathericons.ttf "$pkgdir/usr/share/fonts/TTF/weathericons.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
