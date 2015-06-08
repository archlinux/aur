# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=xcursor-neutralplus
pkgver=1.2
pkgrel=3
pkgdesc='Nice mod of the Neutral X11 cursor theme'
url='http://www.kde-look.org/content/show.php/show.php?content=48837'
arch=('any')
license=('PerlArtistic')
source=("http://www.kde-look.org/CONTENT/content-files/48837-Neutral_Plus_1.2.tar.bz2")
sha1sums=('abddb75314374a65b6066fdddae23699768fe771')

package()
{
  install -dm755 "$pkgdir"/usr/share/icons/Neutral_Plus
  cp -r "$srcdir"/Neutral_Plus/{cursors,index.theme} "$pkgdir"/usr/share/icons/Neutral_Plus
}
