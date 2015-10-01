#
# Maintainier: Ste74 <capitani74atgmaildotcom>
# Author of theme: tuxino <http://www.istitutomajorana.it/forum2/>

pkgname=plymouth-theme-manjaro-redefined-bsplash-new
basename=manjaro-redefined-bsplash-new
pkgver=1.0
pkgrel=1
pkgdesc="Manjaro Redefined Plymouth theme modified."
arch=('any')
license=('GPL')
url="http://www.istitutomajorana.it/forum2/Thread-Tema-Plymouth-Manjaro"
depends=('plymouth')
install=$basename.install
source=('https://github.com/Ste74/Aur-binary-repo/releases/download/v1.0/Manjaro-Redefined-Bsplash-new.zip'
        'manjaro-redefined-bsplash-new.install'
       )
md5sums=('18dd9449f3d35d9c4200df516a553f16'
         'c8f5183835db573c016df474d3314aa5')

package() {
  cd $srcdir/Manjaro-Redefined-Bsplash-new
  mkdir -p $pkgdir/usr/share/plymouth/themes/Manjaro-Redefined-Bsplash-new
  install -Dm644 * $pkgdir/usr/share/plymouth/themes/Manjaro-Redefined-Bsplash-new
}
