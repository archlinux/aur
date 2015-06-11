# Maintainer: garion < garion @ mailoo.org >
# Contributor: uastasi <uastasi@archlinux.us>

pkgname=filezilla-faenza-icons
pkgver=0.1
pkgrel=4
pkgdesc="Faenza icon theme for Filezilla."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/?content=135869"
license=('GPL')
depends=(filezilla)
source=(http://gnome-look.org/CONTENT/content-files/135869-faenza.tar.gz)
md5sums=('c358dc7b0d2c416a074d16ebdee6fac4')

package() {
  mkdir -p $pkgdir/usr/share/filezilla/resources/faenza/
  cp -R $srcdir/faenza $pkgdir/usr/share/filezilla/resources/
}
