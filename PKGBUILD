# Maintainier: FadeMind https://gravatar.com/fademind
# Author of theme: crimsonsuv http://kde-look.org/usermanager/search.php?username=crimsonsuv

pkgname=kdeartwork-wallpapers-manjaro-redefined
basename=manjaro-redefined
pkgver=1.0
pkgrel=2
pkgdesc="Manjaro Redefined Wallpaper."
arch=('any')
license=('GPL')
groups=('kde' 'kdeartwork')
url="http://kde-look.org/content/show.php?content=166289"
depends=('kdebase-workspace')
source=($basename.tar.gz::'https://copy.com/tQSfRdWAT1bd/manjaro-redefined.tar.gz?download=1')
md5sums=('723e1deb0f62c12c57dfa9b951175021')
  
package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/wallpapers/
  cp -R $basename $pkgdir/usr/share/wallpapers/
}