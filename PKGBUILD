# Maintainier: FadeMind https://gravatar.com/fademind
# Author of theme: crimsonsuv http://kde-look.org/usermanager/search.php?username=crimsonsuv

pkgname=plymouth-theme-manjaro-redefined-bsplash
basename=manjaro-redefined-bsplash
pkgver=1.0
pkgrel=1
pkgdesc="Manjaro Redefined Plymouth theme."
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php?content=166301"
depends=('plymouth')
install=$basename.install
source=('http://kent.dl.sourceforge.net/project/manjaroredefined/Manjaro-Redefined-Bsplash.tar.gz'
        'manjaro-redefined-bsplash.install'
       )
md5sums=('SKIP'
         '05ba612f303fb1282a46785ea72ebf1e')

package() {
  cd $srcdir/Manjaro-Redefined-Bsplash
  mkdir -p $pkgdir/usr/share/plymouth/themes/Manjaro-Redefined-Bsplash
  install -Dm644 * $pkgdir/usr/share/plymouth/themes/Manjaro-Redefined-Bsplash
}
