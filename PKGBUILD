# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=oxygencolors
pkgver=6.3
pkgrel=3
pkgdesc="Oxygencolors is a full customizable iconset based on original oxygen"
arch=('any')
url="http://www.kde-look.org/content/show.php/oxygencolors?content=104048"
license=('GPL')
source=(http://dl.dropbox.com/u/4514366/AUR/oxygencolors\(v${pkgver}\).tar.bz2)
sha1sums=('c4e36e8d983cbdb2b4a849beecbc8b7848a3926c')

package() {
  cd "${srcdir}/${pkgname}(v${pkgver})"
  mkdir -p "${pkgdir}"/usr/share/icons/oxygencolors
  cp -r *  "${pkgdir}"/usr/share/icons/oxygencolors
  # fix permissions for some BSD icons
  find "${pkgdir}" -type f  -perm 750 -exec chmod 644 {} \;
} 
