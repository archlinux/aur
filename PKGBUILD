# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=wallpaper-lightning
pkgver=1
pkgrel=2
pkgdesc="'Lightning' wallpaper that used to be included in kdeartwork-weatherwallpapers"
arch=('any')
url="http://kde-look.org/content/show.php/Lightning002?content=78438"
license=('GPL')
source=('http://kde-look.org/CONTENT/content-files/78438-Lightning1920.jpg')
md5sums=('5ec093bbe2b9d1d1c44d61078ea4949b')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/wallpapers/Lightning/
  cp 78438-Lightning1920.jpg $pkgdir/usr/share/wallpapers/Lightning/Lightning1920.jpg
}
