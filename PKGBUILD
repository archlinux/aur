#
# Maintainier: Ste74 <capitani74atgmaildotcom>
# Author of theme: tuxino <http://www.istitutomajorana.it/forum2/>

pkgname=plymouth-theme-manjaro-elegant-new
basename=manjaro-elegant-new
pkgver=1.0
pkgrel=1
pkgdesc="Manjaro Elegant Plymouth theme modified new."
arch=('any')
license=('GPL')
url="http://www.istitutomajorana.it/forum2/Thread-Tema-Plymouth-Manjaro"
depends=('plymouth')
install=$basename.install
source=('https://github.com/Ste74/Aur-binary-repo/releases/download/v1.0/manjaro-elegant-new.zip'
        'manjaro-elegant-new.install'
       )
md5sums=('4cde5d85f557dce2b5a4e8125915d104'
         '6d109a6a5e8430542efe0f6b19a447ff')

package() {
  cd $srcdir/manjaro-elegant-new
  mkdir -p $pkgdir/usr/share/plymouth/themes/manjaro-elegant-new
  install -Dm644 * $pkgdir/usr/share/plymouth/themes/manjaro-elegant-new
}
