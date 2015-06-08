# Maintainier: FadeMind https://gravatar.com/fademind
# Author of theme: crimsonsuv http://kde-look.org/usermanager/search.php?username=crimsonsuv

pkgname=ksplash-theme-manjaro-redefined
pkgver=1.0.1
pkgrel=1
pkgdesc="Manjaro Redefined KSplash based on QML by Nowardev."
arch=('any')
license=('GPL')
groups=('kde' 'kdeartwork')
url="http://kde-look.org/content/show.php?content=166291"
depends=('kdebase-workspace')
source=("http://freefr.dl.sourceforge.net/project/manjaroredefined/Manjaro-Redefined-Splash-$pkgver.tar.gz")
md5sums=('SKIP')
  
package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/apps/ksplash/Themes/Manjaro-Redefined
  cp -R Manjaro-Redefined-Splash-$pkgver/* $pkgdir/usr/share/apps/ksplash/Themes/Manjaro-Redefined
  sed -i -e 's|-Splash-1.0.1||g' $pkgdir/usr/share/apps/ksplash/Themes/Manjaro-Redefined/Theme.rc
}
