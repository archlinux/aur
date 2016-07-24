# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=xcursor-neutralplus
pkgver=1.2
pkgrel=4
pkgdesc='Nice mod of the Neutral X11 cursor theme'
url='https://www.kde-look.org/p/999928/'
arch=('any')
license=('PerlArtistic')
source=("https://dl.opendesktop.org/api/files/download/id/1460735271/48837-Neutral_Plus_${pkgver}.tar.bz2")
md5sums=('eb697c68167f05387dc3ee8d8cee084d')

package()
{
  install -dm755 "$pkgdir"/usr/share/icons/Neutral_Plus
  cp -r "$srcdir"/Neutral_Plus/{cursors,index.theme} "$pkgdir"/usr/share/icons/Neutral_Plus
}
