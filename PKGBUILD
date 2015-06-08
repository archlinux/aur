# Maintainier: FadeMind https://gravatar.com/fademind
# Author of theme: crimsonsuv http://kde-look.org/usermanager/search.php?username=crimsonsuv

pkgname=grub2-theme-manjaro-redefined
pkgver=1.0
pkgrel=2
pkgdesc="Manjaro Redefined GRUB2 theme."
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php?content=166302"
depends=('grub')
install=$pkgname.install
source=("http://switch.dl.sourceforge.net/project/manjaroredefined/Manjaro-Redefined-Grub-$pkgver.tar.gz"
        'grub2-theme-manjaro-redefined.install'
       )
md5sums=('SKIP'
         'e0683af9130adcc56d1ab9a28db1ff4a')

package() {
  cd $srcdir
  mkdir -p $pkgdir/boot/grub/themes/manjaro-redefined
  cp -R Manjaro-Redefined-Grub-$pkgver/* $pkgdir/boot/grub/themes/manjaro-redefined
}
