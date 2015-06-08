# Maintainier: FadeMind https://gravatar.com/fademind
# Author of theme: crimsonsuv http://kde-look.org/usermanager/search.php?username=crimsonsuv

pkgname=kdm-theme-manjaro-redefined
pkgver=1.1
pkgrel=1
pkgdesc="Manjaro Redefined KDM based on Mordern Arch KDM. Used manjaro redefined wallpaper, Ksplash for full experince of awesomeness."
arch=('any')
license=('GPL')
groups=('kde' 'kdeartwork')
url="http://kde-look.org/content/show.php?content=166290"
depends=('kdebase-workspace')
source=("http://master.dl.sourceforge.net/project/manjaroredefined/Manjaro-Redefined-kdm-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/apps/kdm/themes/manjaro-redefined
  cp -R Manjaro-Redefined-kdm-$pkgver/* $pkgdir/usr/share/apps/kdm/themes/manjaro-redefined
}
