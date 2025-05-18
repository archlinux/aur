pkgname=cattheme
pkgver=0.1
pkgrel=1
pkgdesc="Spinning Cat Plymouth Theme by mango7006"
arch=('any')
url="https://github.com/mango7006/cattheme"
license=('unlicense')
depends=('plymouth')

source=("git+https://github.com/mango7006/cattheme.git")
md5sums=('SKIP')

package() {
  echo " "
  echo "Thank you for using my theme :) "
  echo " "
  install -d "$pkgdir/usr/share/plymouth/themes/cattheme"
  cp -r "$srcdir/cattheme/"* "$pkgdir/usr/share/plymouth/themes/cattheme/"
  echo " "
  echo " "
  echo " "
  echo "IMPORTANT"
  echo "MAKE SURE THAT YOU HAVE ENABLED PLYMOUTH IN YOUR INITRD"
  echo "AFTER INSTALL run 'plymouth-set-default-theme -R cattheme'"
  echo "THEN REGENERATE YOUR INITRD WITH 'mkinitcpio -P' or whatever else you have installed"
  echo "THANK YOU FOR USING MY THEME"
  echo " "
  echo " "
  echo " "
}
