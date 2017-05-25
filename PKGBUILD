# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Robert Orzanna <orschiro at gmail dot com>

pkgname=elementary-os-openbox
pkgver=20141005 
pkgrel=6
pkgdesc="Elementary OS Openbox theme"
arch=('any')
url="http://box-look.org/content/show.php?content=163471"
license=('GPL')
depends=('openbox')
source=(https://dl.opendesktop.org/api/files/download/id/1460768467/163471-elementary-os-05102014.obt)
md5sums=('5996b39b1cdb7c623760ab9f08dd96d5')

package() {
  install -dm755 "$pkgdir"/usr/share/themes/elementary-os-openbox
  cp -r "$srcdir"/openbox-3 "$pkgdir"/usr/share/themes/elementary-os-openbox
}
