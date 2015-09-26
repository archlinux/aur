#
# Maintainier:Ste74 <capitani74atgmaildotcom>
# Author of theme: tuxino <www.istitutomajorana.it/forum2/>

pkgname=grub2-theme-starfield-manjaro-menda
pkgver=1
pkgrel=1
pkgdesc="Manjaro Starfield GRUB2 menda theme ."
arch=('any')
license=('GPL')
url="http://www.istitutomajorana.it/forum2/Thread-Tema-grub-Manjaro"
depends=('grub')
install=$pkgname.install
source=("https://github.com/Ste74/Aur-binary-repo/releases/download/v1.0/grub2-theme-starfield-manjaro-menda.zip"
        "$pkgname.install"
       )
md5sums=('8ac326f5982bee21758570de93c900c0'
         '623eeafb90c3bf6a53291f56fb3ea5e7')

package() {
  cd $srcdir
  mkdir -p $pkgdir/boot/grub/themes/starfield-manjaro-menda
  cp -R Starfield-Manjaro-Menda/* $pkgdir/boot/grub/themes/starfield-manjaro-menda
}
