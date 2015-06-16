# Maintainer: Hiram Jeronimo Perez (woRg), <worg[at]linuxmail.org>

pkgname=gtk-theme-plastiq
_realname=plastiq
pkgver=0.9.1
pkgrel=1
pkgdesc="GTK2/GTK3, GNOME Shell, Dark theme with blue highlights"
arch=('any')
url=('http://dl.dropbox.com/u/7133562/plastiq.tar.gz')
license=('GPL3')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
optdepends=('marlin-bzr: Sleek and fast GTK3 file manager [AUR]')
source=(${url})
md5sums=('cf3cf24b86c9689a424c1e4aa42d80e2')

package () {
  install -dm755 "${pkgdir}/usr/share/themes"
  cp -Pr "${srcdir}"/${_realname} "${pkgdir}/usr/share/themes/plastiq"
  find . -type d -name 'gnome-shell' -exec cp -r '{}' "${pkgdir}/usr/share/themes/plastiq" \;
}
