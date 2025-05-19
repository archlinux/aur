pkgname=plymouth-theme-spinning-cat
pkgver=1.2
pkgrel=1
pkgdesc="Spinning Cat Plymouth Theme by mango7006"
arch=('any')
url="https://github.com/mango7006/plymouth-theme-spinning-cat"
license=('unlicense')
depends=('plymouth')

source=("git+https://github.com/mango7006/plymouth-theme-spinning-cat.git")
md5sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/plymouth/themes/plymouth-theme-spinning-cat"
  cp -r "$srcdir/plymouth-theme-spinning-cat/"* "$pkgdir/usr/share/plymouth/themes/plymouth-theme-spinning-cat/"
  echo -e "\n\n\nIMPORTANT"
  echo "MAKE SURE THAT YOU HAVE ENABLED PLYMOUTH IN YOUR INITCPIO AND BOOTLOADER"
  echo "AFTER INSTALL run 'plymouth-set-default-theme -R plymouth-theme-spinning-cat'"
  echo -e "Thank you for using my theme :)\n\n\n"
}
